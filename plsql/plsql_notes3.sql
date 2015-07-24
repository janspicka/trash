
set serveroutput on;

DECLARE
-- GLOBAL

cursor c_emp(p_job_id employees.job_id%type) is select * from employees where job_id = p_job_id;

v_text varchar2(100);

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
  
END;
/
