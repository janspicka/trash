create or replace PROCEDURE get_employee ( 
  id IN employees.employee_id%TYPE,
  emp OUT employees%rowtype)
IS 
  v_id_min employees.employee_id%TYPE;
  v_id_max employees.employee_id%TYPE;
BEGIN
  select min(employee_id), max(employee_id) into v_id_min, v_id_max from employees;
  
  select * into emp from employees where employee_id = id; 


exception 
  when no_data_found then 
    dbms_output.put_line('Pouzijte cisla v rozsahu: ' || v_id_min || '-' || v_id_max);

  when others then 
    -- dbms_output.put_line('Zadny radek.');
    dbms_output.put_line('ERR: ' || sqlcode || ' '|| sqlerrm);
    

END get_employee;
