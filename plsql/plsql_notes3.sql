set serveroutput on;

DECLARE
-- GLOBAL

type c_employee is table of employees%rowtype index by pls_integer;

cursor c_emp(p_job_id employees.job_id%type) is select * from employees where job_id = p_job_id;
v_text varchar2(100);

v_emp_it c_employee;
v_emp_cl c_employee;
v_emp_ot c_employee;

v_emp number(10);
v_ex1 varchar2(100);


BEGIN 

-- DECLARED CURSOR 
for rec in c_emp('IT_PROG') loop
  -- dbms_output.put_line('ID: ' || rec.employee_id || ', NAME: ' || rec.first_name || ' ' || rec.last_name || ', JOB: ' || rec.job_id);
  null;
end loop;

-- NO DECLARED CURSOR
v_text := 'IT_PROG';
for rec in (
  select * from employees where job_id = v_text
) loop 
  dbms_output.put_line('ID: ' || rec.employee_id || ', NAME: ' || rec.first_name || ' ' || rec.last_name || ', JOB: ' || rec.job_id);
end loop;

-- EXECUTE IMMEDIATE
v_ex1 := 'select count(employee_id) from employees where employee_id = :b1';
for rec in (
  select * from employees
) loop 
  if rec.job_id = 'IT_PROG' then 
    execute immediate v_ex1
    into v_emp
    using rec.employee_id;
    
    if v_emp < 1 then  
      dbms_output.put_line('0');
    else
      dbms_output.put_line('1');
    end if;
  end if; 
  
  if rec.job_id in ('SH_CLERK', 'ST_CLERK', 'PU_CLERK' ) then 
    execute immediate v_ex1
    into v_emp
    using rec.employee_id;
    
    if v_emp < 1 then  
      dbms_output.put_line('0');
    else
      dbms_output.put_line('1');
    end if;
  end if; 
  
  if rec.job_id in ('IT_PROG', 'SH_CLERK', 'ST_CLERK', 'PU_CLERK' ) then 
    execute immediate v_ex1
    into v_emp
    using rec.employee_id;
    
    if v_emp < 1 then  
      dbms_output.put_line('0');
    else
      dbms_output.put_line('1');
    end if;
  end if; 

  
end loop;

exception 
when no_data_found then 
  -- dbms_output.put_line('Zadny radek.');
  dbms_output.put_line('ERR: ' || sqlcode || ' '|| sqlerrm);

when too_many_rows then 
    dbms_output.put_line('Moc radku.');
when others then
    dbms_output.put_line('ERR: ' || sqlcode || ' '|| sqlerrm);

END;
/
