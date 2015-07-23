set serveroutput on;

DECLARE
-- GLOBAL
  v_text varchar2(100);
  v_text2 varchar2(100) := 'Hello world!';
  v_bool boolean := false; 
  v_number number(5);
  
  v_fname employees.first_name%TYPE;
  -- v_fname varchar(100);

BEGIN 
  DECLARE
  -- LOCAL
  BEGIN
    null;
    v_text := 'Hello world!';
    -- dbms_output.put_line(v_text);
    -- dbms_output.put_line(v_text2);
    -- 1 hodina = 1
    -- dbms_output.put_line(to_char(sysdate-3/24, 'DD-MM-YYYY HH:MI:SS'));
    -- v_number := '3.14';
    v_number := '3,14';
    -- dbms_output.put_line(v_number);
  END;
  
  
  
  SELECT first_name INTO v_fname FROM employees WHERE employee_id = 200;
  dbms_output.put_line('First Name is : '||v_fname);

END;
/
