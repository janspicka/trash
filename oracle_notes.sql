- pomocna tabulka DUAL, pokud bych rad provedl: SELECT now() FROM DUAL ? 
- || spojuje hodnoty dvou tabulek, tedy: SELECT col1 || col2 AS alias
- hodnoty se zapuisuji jako 'value', NE jako "value"
- pokud chci polozit klauzuli where prikazu like pak mohu pouzit pattern viz nize
- % je nula nebo vice znaku, _ je prave jeden znak, napr '_A%'
- nebo '_A%!%' escape '!' kde escape symbol muze byt cokoli
- lze pouzit vyraz NOT pro negaci vyrazu: SELECT * FROM table WHERE NOT col <> "value"
- existuje neco jako substitucni promenna &x &&x, ale obecne to nefunguje
- formatovani datumu http://ss64.com/ora/syntax-fmt.html
- select * from table where col = '&value'; zaoamatuje si prikaz a "dale pro nej nebere pamet"

-- UVOD
select * from DEPT;
select * from EMP;
select * from SALGRADE;
select distinct job from emp;
select EMPNO as "Cislo", ENAME as "Zamestnanec", job as "Pozice", HIREDATE as "Datum nastupu" from emp;
select ENAME ||', '|| job as "Zamestnanec, pozice" from emp;
-- WHERE
select column_name from user_tab_columns where table_name = 'EMP';
select column_name || ' || '', '' || ' cmd from user_tab_columns where table_name = 'EMP';
select EMPNO || ', ' || ENAME || ', ' || JOB || ', ' || MGR || ', ' || HIREDATE || ', ' || SAL || ', ' || COMM || ', ' || DEPTNO as "Zamestnanec" from emp;
select ename, sal from EMP where sal > 2900;
select ename, deptno from EMP where EMPNO = 7900;
select ename, sal from emp where sal not between 1200 and 4000;
select ename, deptno from emp where deptno in (20,30);
select ename as "Zamestanec", sal as "Plat" from EMP where sal < 1200 or sal > 4000;
select ename, job from emp where MGR is null;
select ename, sal, comm from emp where comm is not null;
select ename from EMP where ename like '__A%';
select ename, deptno, mgr from emp where ename like '%LL%';
select ename, job, sal from emp where job in ('CLERK', 'ANALYST') and sal between 1000 and 3000;
select ename, sal, comm from emp where comm > sal*1.1;
-- FUNKCE 
select sysdate from dual;
select empno, ename, sal, round(sal*1.15) as novy_plat from EMP;
select empno, ename, sal, round(sal*1.15) as novy_plat from EMP;
select empno, ename, sal, novy_plat, novy_plat-sal as pridano_o from (select empno, ename, sal, round(sal*1.15) as novy_plat from EMP);
select ename, job, hiredate from emp where hiredate between '20-02-81' and '01-06-81';
select ename, hiredate from emp where hiredate like '%82';
select * from dual;
alter session set nls_language = 'american';
select ename, hiredate, to_char(next_day(add_months(hiredate,6),1), 'fmDAY, DD. MONTH YYYY') as review from emp;
select ename || ' ma plat ' || to_char(sal, 'fm$9,999') || ', ale chtel by ' || to_char(sal*3, 'fm$9,999') as "Zamestnancuv sen" from EMP; 
select ename, lpad(sal, 10,'*') as plat from emp;
select INITCAP(ename), LENGTH(ename) from EMP;
-- select ename as "Jmeno", to_char(hiredate,'DD-MON-YY') as "Datum nastupu", initcap(to_char(hiredate,'DAY'))  from emp;
select ename as "Jmeno", to_char(hiredate,'DD-MON-YY') as "Datum nastupu", initcap(to_char(hiredate,'DAY')) from emp order by to_char(hiredate, 'D');
select ename as "Jmeno", nvl(to_char(COMM),'nema provize') as "Provize" from emp;
select ename, job as pozice, decode(job, 
  'PRESIDENT', 'A',
  'MANAGER', 'B',
  'ANALYST', 'C',
  'SALESMAN', 'D',
  'CLERK', 'E', 
  'X') as stupen from emp;
  
select ename, job as pozice, 
  case 
    when job = 'ANALYST' then 'C'
    when job = 'PRESIDENT' then 'A'
    when job = 'CLERK' then 'E'
    when job = 'SALESMAN' then 'D'
    when job = 'MANAGER' then 'B'
    else 'X'
  end as stupen
from emp;

-- JOIN 
select ename, emp.deptno, dname from emp left join DEPT on emp.deptno = DEPT.DEPTNO;
select distinct job from emp left join DEPT on emp.deptno = DEPT.DEPTNO where dname = 'SALES';
select ename, dname, loc, comm from emp left join DEPT on emp.deptno = DEPT.DEPTNO where comm is not null and comm > 0 order by comm desc;
select ename, dname from emp left join DEPT on emp.deptno = DEPT.DEPTNO where ename like '%A%';
select ename, job, emp.deptno, dname from emp left join DEPT on emp.deptno = DEPT.DEPTNO where loc = 'DALLAS';
select a.empno, a.ename, a.mgr as mgr_no, b.ENAME as mgr_name from emp a inner join emp b on a.mgr = b.empno;
select a.empno, a.ename, a.mgr as mgr_no, b.ENAME as mgr_name from emp a left join emp b on a.mgr = b.empno;
select a.deptno, a.ename, b.dname, c.ename
  from emp a
  left join dept b on a.DEPTNO = b.DEPTNO 
  inner join emp c on a.deptno = c.deptno 
  where a.ename <> c.ename
  order by b.dname;

select a.deptno, b.dname, c.ename, a.ENAME
  from emp a
  left join dept b on a.DEPTNO = b.DEPTNO 
  inner join emp c on a.deptno = c.deptno 
  where a.ename <> c.ename
  order by b.DNAME;
  
  select e.ename, e.JOB, d.DNAME, sal, grade
  from emp e
  left join dept d on e.DEPTNO = d.DEPTNO 
  left join SALGRADE s on e.SAL between s.LOSAL and s.HISAL;
  
select e1.ename, e1.hiredate, e2.ENAME, e2.HIREDATE, e2.hiredate-e1.hiredate
from emp e1 
left join emp e2 on e1.MGR = e2.EMPNO
where e1.HIREDATE < e2.HIREDATE;

select e1.ENAME
from emp e1 
left join emp e2 on e1.MGR = e2.EMPNO
where e2.ename = 'BLAKE';

select e.ename
from emp e
left join DEPT d on e.DEPTNO = d.deptno
where dname = 'ACCOUNTING';

-- Agregacni fce 
select max(sal), min(sal), round(avg(sal)), sum(sal) from emp;
select dname, max(sal), min(sal), round(avg(sal)), sum(sal) from emp join dept on emp.DEPTNO = dept.DEPTNO group by dname;
select job, count(empno) as pocet from emp group by job;
select count(distinct mgr) from emp where mgr is not null;
select max(sal)-min(sal) from emp;

-- nasledujici dota dela neco trochu jineho, resp vraci i zamestnance/vedouci kteri nemaji vedouciho
select e1.mgr as mgr, min(e2.sal), max(e2.sal) from EMP e1 left join EMP e2 on e1.mgr = e2.EMPNO group by e1.MGR having min(e2.sal)>1000; 
select mgr, min(sal), max(sal) from emp where mgr is not null group by mgr having min(sal) > 1000;

select dname, loc, count(empno), to_char(avg(sal),'9999.00') as avgsal from emp
left join dept on emp.DEPTNO = dept.DEPTNO 
group by dname, loc;

-- vnorene dotazy? 
select ename, hiredate from emp where hiredate > (select hiredate from emp where ename = 'BLAKE');
select ename, to_char(hiredate, 'fmDD-MON-YYYY') from emp where deptno = (select deptno from emp where ename = 'BLAKE') and ename <> 'BLAKE';
select empno, ename, sal from emp where sal > (select avg(sal) from emp);

select empno, ename, sal, emp.deptno, dname from EMP 
join dept on EMP.deptno = dept.DEPTNO where EMP.DEPTNO = (select distinct deptno from emp where ename like '%G%');  

select ename, deptno, job from EMP where DEPTNO = (select distinct EMP.DEPTNO from EMP 
join DEPT on EMP.DEPTNO = DEPT.DEPTNO where DEPT.LOC = 'DALLAS');

select empno from emp where ename = 'KING' 

  






