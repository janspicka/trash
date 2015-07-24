CREATE OR REPLACE FUNCTION get_name
      (id  IN employees.employee_id%TYPE)
      RETURN varchar2
IS
     -- there are local variables visible only in function
     name varchar2(100);
BEGIN
     SELECT first_name || ' ' || last_name
     INTO   name
     FROM   employees        
     WHERE  employee_id = id;

     RETURN name;
END get_name;
/

CREATE OR REPLACE FUNCTION get_yesterday
      RETURN date
IS
BEGIN
  RETURN (sysdate - 1);
  
exception
  when others then 
    dbms_output.put_line('Yesterday, all my troubles seemed so far away.');
    dbms_output.put_line('Now it looks as thought they''re here to stay.');
    dbms_output.put_line('Oh I believe in yesterday.');
    dbms_output.put_line('...');
END get_yesterday;
/
