set serveroutput on;

declare
-- GLOBAL
  emp employees%rowtype;

begin 
  get_employee(50,emp);
  dbms_output.put_line(emp.first_name || ' ' || emp.last_name || ' ' || emp.salary);


exception 
  when others then
    dbms_output.put_line('ERR: ' || sqlcode || ' '|| sqlerrm);
end;
/
