set serveroutput on;

DECLARE
-- GLOBAL
v_result varchar2(100);
v_num number(5);
v_id number(5);
i number(5);

f_name employees.first_name%TYPE;
l_name employees.last_name%TYPE;

BEGIN 

  -- CASE 
  v_id := 120;
  case 
  when v_id is not null then 
    select first_name, last_name into f_name, l_name from employees where employee_id = v_id;
    v_result := f_name || ' ' || l_name;
  else 
    v_result := 'Nema nadrizeneho.';
  end case;
  dbms_output.put_line(v_result);
  
  -- LOOP
  i := 100;
  loop
    exit when i > 120;
    i := i + 2;
    select first_name, last_name into f_name, l_name from EMPLOYEES where employee_id = i;
    dbms_output.put_line(i || ' ' ||  f_name || ' ' || l_name);
  end loop;
  
  -- WHILE
  i := 100;
  while i < 150 loop
     if i > 120 then 
      exit;
    end if;
    dbms_output.put_line(i);
      i := i + 1;
  end loop;
  
  -- FOR
  for id in 100..115 loop
    select first_name, last_name into f_name, l_name from employees where employee_id = id;
    dbms_output.put_line(id || ' ' ||  f_name || ' ' || l_name);
  end loop;
 
   -- FOR
  for id in 0..20 loop
    -- skip even number
    continue when mod(id,2) = 1;
    dbms_output.put_line(id);
  end loop;

      


  DECLARE
  -- LOCAL
  BEGIN
    -- minimal code
    null;
  END;
END;
/


select mod(10,5) from dual;
