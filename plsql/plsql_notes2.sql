set serveroutput on;

DECLARE
-- GLOBAL
v_id_min employees.employee_id%TYPE;
v_id_max employees.employee_id%TYPE;
v_id employees.employee_id%TYPE;
v_num numeric(10);

-- zkopiruje strukturu tabulky
v_employee employees%rowtype;

type c_employee is table of employees%rowtype index by pls_integer;

v_employee2 c_employee;

v_emp_it c_employee;
v_emp_cl c_employee;
v_emp_ot c_employee;


BEGIN 

select min(employee_id), max(employee_id) into v_id_min, v_id_max from employees;
-- dbms_output.put_line(v_id_min ||' '|| v_id_max);

-- LINE BY LINE OPERACE
for i in v_id_min..v_id_max loop
  select * into v_employee from employees where employee_id = i;
  -- dbms_output.put_line(v_employee.employee_id); 

  if v_employee.employee_id is not null then
  
    if v_employee.job_id='IT_PROG' then
      insert into employees_programmers values v_employee;
    elsif v_employee.job_id in ('SH_CLERK', 'ST_CLERK') then
      insert into employees_clerks values v_employee;
    else 
      insert into employees_others values v_employee;
    end if;
    -- dbms_output.put_line('employee_id: '|| i || ' inserted.');
  end if;
end loop;

-- LINE TO BLOK OPERACE
for i in v_id_min..v_id_max loop
  select * into v_employee2(i) from employees where employee_id = i;
end loop;

for i in v_employee2.FIRST..v_employee2.LAST loop
  if v_employee2(i).job_id = 'IT_PROG' then 
    dbms_output.put_line('employee_id: ' || v_employee2(i).employee_id || ', job_id: ' || v_employee2(i).job_id);
  end if;
end loop;


-- BULK / BY BLOK OPERACE
select * bulk collect into v_emp_it from employees where job_id = 'IT_PROG';
select * bulk collect into v_emp_cl from employees where job_id in ('SH_CLERK', 'ST_CLERK', 'PU_CLERK' );
select * bulk collect into v_emp_ot from employees where job_id not in ('IT_PROG, ''SH_CLERK', 'ST_CLERK', 'PU_CLERK' );

FORALL i IN v_emp_it.FIRST..v_emp_it.LAST INSERT INTO employees_programmers VALUES v_emp_it(i);
FORALL i IN v_emp_cl.FIRST..v_emp_cl.LAST INSERT INTO employees_clerks VALUES v_emp_cl(i);
FORALL i IN v_emp_ot.FIRST..v_emp_ot.LAST INSERT INTO employees_others VALUES v_emp_ot(i);

END;
/

TRUNCATE TABLE employees_clerks;
TRUNCATE TABLE employees_others;
TRUNCATE TABLE employees_programmers;

SELECT TABLESPACE_NAME,SUM(BYTES)/1024/1024/1024 "FREE SPACE(GB)"
FROM USER_FREE_SPACE GROUP BY TABLESPACE_NAME;
