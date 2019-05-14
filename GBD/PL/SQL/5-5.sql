--1.-Hacer un procedimiento que muestre el nombre y el salario del empleado cuyo código es 117.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE nomsal
IS
  v_nombre EMPLOYEES.FIRST_NAME%TYPE;
  v_salario EMPLOYEES.SALARY%TYPE;
  
BEGIN
  SELECT first_name, salary 
  INTO v_nombre, v_salario
  FROM employees
  where EMPLOYEE_ID='117';
  dbms_output.put_line('Nombre: '||v_nombre||' Salario: '||v_salario);
END nomsal;

--2.-Hacer un procedimiento que, reciba por teclado un código de empleado y devuelva su nombre.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE Codemp (E_CODIGO IN EMPLOYEES.EMPLOYEE_ID%TYPE)
  v_nombre EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME 
  INTO v_nombre
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = E_CODIGO;
  dbms_output.put_line('Nombre: '||v_nombre);
END Codemp;
