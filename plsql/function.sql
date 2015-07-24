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
