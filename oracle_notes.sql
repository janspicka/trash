- pomocna tabulka DUAL, pokud bych rad provedl: SELECT now() FROM DUAL ? 
- || spojuje hodnoty dvou tabulek, tedy: SELECT col1 || col2 AS alias
- hodnoty se zapuisuji jako 'value', NE jako "value"
- pokud chci polozit klauzuli where prikazu like pak mohu pouzit pattern viz nize
- % je nula nebo vice znaku, _ je prave jeden znak, napr '_A%'
- nebo '_A%!%' escape '!' kde escape symbol muze byt cokoli
- lze pouzit vyraz NOT pro negaci vyrazu: SELECT * FROM table WHERE NOT col <> "value"


select * from DEPT;
select * from EMP;
select distinct job from emp;
select EMPNO as "Cislo", ENAME as "Zamestnanec", job as "Pozice", HIREDATE as "Datum nastupu" from emp;
select ENAME ||', '|| job as "Zamestnanec, pozice" from emp;

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

select sysdate from dual;
select empno, ename, sal, round(sal*1.15) as novy_plat from EMP;
select empno, ename, sal, round(sal*1.15) as novy_plat from EMP;
select empno, ename, sal, novy_plat, novy_plat-sal as pridano_o from (select empno, ename, sal, round(sal*1.15) as novy_plat from EMP);





