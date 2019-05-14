SET SERVEROUTPUT ON
DECLARE
CURSOR emp_cursor IS
 SELECT first_name, email FROM employees;
 v_reg_cursor emp_cursor%ROWTYPE;
BEGIN
OPEN emp_cursor;
FETCH emp_cursor INTO v_reg_cursor;
    WHILE emp_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE(v_reg_cursor.first_name||'*'|| v_reg_cursor.email);
    FETCH emp_cursor INTO v_reg_cursor;
END LOOP;
CLOSE emp_cursor;
END;
---CON FOR:---
SET SERVEROUTPUT ON
DECLARE
CURSOR emp_cursor IS
 SELECT first_name, email FROM employees;
 v_reg_cursor emp_cursor%ROWTYPE;
BEGIN

for v_reg_cursor IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(v_reg_cursor.first_name||'*'|| v_reg_cursor.email);
  
END LOOP;

END;

