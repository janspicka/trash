+--------------------------------------------------------
+--  File created - Úterý-červenec-21-2015   
+--------------------------------------------------------
+--------------------------------------------------------
+--  DDL for Table DEPT
+--------------------------------------------------------
+
+  CREATE TABLE "STUDENT"."DEPT" 
+   (	"DEPTNO" NUMBER(2,0), 
+	"DNAME" VARCHAR2(14 BYTE), 
+	"LOC" VARCHAR2(13 BYTE)
+   ) SEGMENT CREATION IMMEDIATE 
+  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS" ;
+--------------------------------------------------------
+--  DDL for Table EMP
+--------------------------------------------------------
+
+  CREATE TABLE "STUDENT"."EMP" 
+   (	"EMPNO" NUMBER(4,0), 
+	"ENAME" VARCHAR2(10 BYTE), 
+	"JOB" VARCHAR2(9 BYTE), 
+	"MGR" NUMBER(4,0), 
+	"HIREDATE" DATE, 
+	"SAL" NUMBER(7,2), 
+	"COMM" NUMBER(7,2), 
+	"DEPTNO" NUMBER(2,0)
+   ) SEGMENT CREATION IMMEDIATE 
+  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS" ;
+--------------------------------------------------------
+--  DDL for Table SALGRADE
+--------------------------------------------------------
+
+  CREATE TABLE "STUDENT"."SALGRADE" 
+   (	"GRADE" NUMBER, 
+	"LOSAL" NUMBER, 
+	"HISAL" NUMBER
+   ) SEGMENT CREATION IMMEDIATE 
+  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS" ;
+REM INSERTING into STUDENT.DEPT
+SET DEFINE OFF;
+Insert into STUDENT.DEPT (DEPTNO,DNAME,LOC) values ('10','ACCOUNTING','NEW YORK');
+Insert into STUDENT.DEPT (DEPTNO,DNAME,LOC) values ('20','RESEARCH','DALLAS');
+Insert into STUDENT.DEPT (DEPTNO,DNAME,LOC) values ('30','SALES','CHICAGO');
+Insert into STUDENT.DEPT (DEPTNO,DNAME,LOC) values ('40','OPERATIONS','BOSTON');
+REM INSERTING into STUDENT.EMP
+SET DEFINE OFF;
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7369','SMITH','CLERK','7902',to_date('17.12.80','DD.MM.RR'),'800',null,'20');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7499','ALLEN','SALESMAN','7698',to_date('20.02.81','DD.MM.RR'),'1600','300','30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7521','WARD','SALESMAN','7698',to_date('22.02.81','DD.MM.RR'),'1250','500','30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7566','JONES','MANAGER','7839',to_date('02.04.81','DD.MM.RR'),'2975',null,'20');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7654','MARTIN','SALESMAN','7698',to_date('28.09.81','DD.MM.RR'),'1250','1400','30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7698','BLAKE','MANAGER','7839',to_date('01.05.81','DD.MM.RR'),'2850',null,'30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7782','CLARK','MANAGER','7839',to_date('09.06.81','DD.MM.RR'),'2450',null,'10');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7788','SCOTT','ANALYST','7566',to_date('19.04.87','DD.MM.RR'),'3000',null,'20');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7839','KING','PRESIDENT',null,to_date('17.11.81','DD.MM.RR'),'5000',null,'10');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7844','TURNER','SALESMAN','7698',to_date('08.09.81','DD.MM.RR'),'1500','0','30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7876','ADAMS','CLERK','7788',to_date('23.05.87','DD.MM.RR'),'1100',null,'20');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7900','JAMES','CLERK','7698',to_date('03.12.81','DD.MM.RR'),'950',null,'30');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7902','FORD','ANALYST','7566',to_date('03.12.81','DD.MM.RR'),'3000',null,'20');
+Insert into STUDENT.EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values ('7934','MILLER','CLERK','7782',to_date('23.01.82','DD.MM.RR'),'1300',null,'10');
+REM INSERTING into STUDENT.SALGRADE
+SET DEFINE OFF;
+Insert into STUDENT.SALGRADE (GRADE,LOSAL,HISAL) values ('1','700','1200');
+Insert into STUDENT.SALGRADE (GRADE,LOSAL,HISAL) values ('2','1201','1400');
+Insert into STUDENT.SALGRADE (GRADE,LOSAL,HISAL) values ('3','1401','2000');
+Insert into STUDENT.SALGRADE (GRADE,LOSAL,HISAL) values ('4','2001','3000');
+Insert into STUDENT.SALGRADE (GRADE,LOSAL,HISAL) values ('5','3001','9999');
+--------------------------------------------------------
+--  DDL for Index DEPTNO_PK
+--------------------------------------------------------
+
+  CREATE UNIQUE INDEX "STUDENT"."DEPTNO_PK" ON "STUDENT"."DEPT" ("DEPTNO") 
+  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS" ;
+--------------------------------------------------------
+--  DDL for Index EMPNO_PK
+--------------------------------------------------------
+
+  CREATE UNIQUE INDEX "STUDENT"."EMPNO_PK" ON "STUDENT"."EMP" ("EMPNO") 
+  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS" ;
+--------------------------------------------------------
+--  Constraints for Table DEPT
+--------------------------------------------------------
+
+  ALTER TABLE "STUDENT"."DEPT" ADD CONSTRAINT "DEPTNO_PK" PRIMARY KEY ("DEPTNO")
+  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS"  ENABLE;
+  ALTER TABLE "STUDENT"."DEPT" MODIFY ("DEPTNO" NOT NULL ENABLE);
+--------------------------------------------------------
+--  Constraints for Table EMP
+--------------------------------------------------------
+
+  ALTER TABLE "STUDENT"."EMP" ADD CONSTRAINT "EMPNO_PK" PRIMARY KEY ("EMPNO")
+  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
+  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
+  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
+  TABLESPACE "USERS"  ENABLE;
+  ALTER TABLE "STUDENT"."EMP" MODIFY ("EMPNO" NOT NULL ENABLE);
+--------------------------------------------------------
+--  Ref Constraints for Table EMP
+--------------------------------------------------------
+
+  ALTER TABLE "STUDENT"."EMP" ADD CONSTRAINT "DEPTNO_FK" FOREIGN KEY ("DEPTNO")
+	  REFERENCES "STUDENT"."DEPT" ("DEPTNO") ENABLE;
