- pomocna tabulka DUAL, pokud bych rad provedl: SELECT now() FROM DUAL ? 
- || spojuje hodnoty dvou tabulek, tedy: SELECT col1 || col2 AS alias
- hodnoty se zapuisuji jako 'value', NE jako "value"
- pokud chci polozit klauzuli where prikazu like pak mohu pouzit pattern viz nize
- % je nula nebo vice znaku, _ je prave jeden znak, napr '_A%'
- nebo '_A%!%' escape '!' kde escape symbol muze byt cokoli
- lze pouzit vyraz NOT pro negaci vyrazu: SELECT * FROM table WHERE NOT col <> "value"
- existuje neco jako substitucni promenna &x &&x, ale obecne to nefunguje
- formatovani datumu http://ss64.com/ora/syntax-fmt.html 

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
select ename as "Jmeno", to_char(hiredate,'DD-MON-YY') as "Datum nastupu", initcap(to_char(hiredate,'DAY'))  from emp;
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







