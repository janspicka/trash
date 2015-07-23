set serveroutput on;

DECLARE
-- GLOBAL

v_id_min employees.employee_id%TYPE;
v_id_max employees.employee_id%TYPE;

v_id employees.employee_id%TYPE;


-- zkopiruje strukturu tabulky
v_employee employees%rowtype;



BEGIN 


select min(employee_id) into v_id_min from employees;
select max(employee_id) into v_id_max from employees;
-- dbms_output.put_line(v_id_min ||' '|| v_id_max);

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
    dbms_output.put_line(i);
    
  end if;
    
  
end loop;


END;
/

TRUNCATE TABLE employees_clerks;
TRUNCATE TABLE employees_others;
TRUNCATE TABLE employees_programmers;
