-- 1. Vypiste jmeno, plat a datum zamestnancu, kteri nastoupili v obdobi duben - cerven 1981.
select ename, sal, hiredate from emp where hiredate between to_date('04-1981','MM-YYYY') and to_date('06-1981','MM-YYYY');

-- 2. Vypiste jmeno, plat a nazev oddeleni zamestnancu, kteri maji plat vyssi nez 2000.
select ename, sal, dname from emp join dept on emp.deptno = dept.deptno where sal > 2000;

-- 3. Vypiste nazev oddeleni, ve kterem pracuje/i zamestnanec/ci s pismenem C ve jmene.
select dname from emp join dept on emp.deptno = dept.deptno where ename like '%C%';

-- 4. Vypiste jmeno zamestnance a jeho premie. V pripade, ze zamestnanec premie nema, vypiste text "nema zadne premie".
select ename, sal, 'nema zadne premie' as premie from emp where nvl(comm,0) = 0; 

-- 5 Vypiste jmeno zamestnance, jeho plat a zvyseny plat podle nasledujicich kriterii:
-- a) oddeleni 10 ma plat zvyseny o 10%
-- b) oddeleni 20 ma plat zvyseny o 25%
-- c) ostatni oddeleni maji puvodni plat
select ename, sal*1.10 from emp where DEPTNO = '10'
union
select ename, sal*1.25 from emp where DEPTNO = '20'
union 
select ename, sal from emp where DEPTNO not in ('20','10');
-- chtel jsem napsat case when... ale zapomnel jsem syntax
-- dale "not in" take neni uplne optimalni

-- 6. Vypiste dvema zpusoby seznam zamestnancu jejich plat je mensi nez 1200 a vetsi nez 2900.
select * from emp where sal between 1201 and 2899; 
-- between myslim bere i hodnoty 1200 atd...
select * from emp where sal > 1200  and sal < 2900;

-- 7. Vypiste seznam zamestnancu, jejich plat a nazev oddeleni, kteri pracuji v Dallasu a maji plat vyssi nez nejhure placeny zamestnanec daneho oddeleni.
select ename, sal, dname from emp 
join dept on emp.deptno = dept.deptno
join (select min(sal) msal, emp.deptno from emp 
join dept on emp.deptno = dept.deptno where loc = 'DALLAS' group by emp.deptno) xx on xx.deptno = emp.deptno
where emp.sal > xx.msal;
-- tohle je tak prekombinovane az to hezke neni

-- 8. Vypiste nazev oddeleni a prumerny plat v danem oddeleni. Prumerny plat zaokrouhlete na cela cisla. Sloupec s prumernym platem pojmenujte prumer.
select dname, round(avg(sal)) prumer from emp join dept on emp.DEPTNO = dept.DEPTNO group by dname;

-- 9. Vypiste jmena zamestnancu, kteri nepracuji jako vedouci. Vystup seradte sestupne. 
select ename from emp where empno not in (select distinct mgr from emp where mgr is not null) order by ename desc;
-- not in nei pekne, ale nejak mi vypadla alternativa

-- 10. Vypiste vsechny zamestnance spolu se jmenem jejich nadrizeneho a nazvem oddeleni. Vystup seradte podle nazvu oddeleni a jmena zamestnance.
select e1.ename, e2.ename, dname from emp e1 
join emp e2 on e1.mgr = e2.empno
join dept d on e1.deptno = d.deptno
order by dname,e1.ename desc;

-- 11. Vypiste jmeno zamestnance a mesto, ve kterem pracuje. Vyberte jen zamestnance, kteri nemaji nadrizeneho.
select ename, loc from emp 
join dept on emp.deptno = dept.deptno
where nvl(mgr,0) = 0;

-- 12. Vypiste jmeno zamestnance, plat a nazev oddeleni. Vyberte jen zamestnance, kteri maji plat vetsi nez prumerny plat v jejich oddeleni. 
-- Vystup seradte podle oddeleni a jmena zamestnance. 
select ename, sal, dname from emp 
join dept on emp.deptno = dept.deptno
join (select avg(sal) asal, deptno from emp group by deptno) e2 on e2.deptno = emp.deptno
where emp.sal > asal
order by dname, ename;

-- 13. Vypiste 3 nejlepe placene zamestnance ve firme. 
select ename, sal from 
(select ename, sal from emp order by sal desc) 
where rownum <= 3;

-- 14. Vypiste jmeno a plat zamestnancu s nejvyssim platem v jednotlivych oddelenich.
select ename, sal, emp.* from emp 
where (emp.deptno, emp.sal) in (select deptno, max(sal) msal from emp group by deptno);

-- 15. Vytvorte pohled, ktery bude obsahovat jmeno zamestnance, jeho plat, nazev oddeleni a prumerny plat v dannem oddeleni. 
-- Prumerny plat zaokrouhlete na cela cisla. Sloupce pojmenujte: jmeno, plat, oddeleni a prumer.
create or replace view pohled as 
select ename as jmeno, sal as plat, dname as oddeleni, round(asal) as prumer from emp 
join dept on emp.deptno = dept.deptno
join (select avg(sal) asal, deptno from emp group by deptno) e2 on e2.deptno = emp.deptno;

   
