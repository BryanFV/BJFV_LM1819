set SERVEROUTPUT ON
DECLARE 
v_varl VARCHAR2(10);
result number;

v_emp employees

BEGIN
SELECT * into v_emp
FROM employees
where employee_id = 117
END;
if (v_f_emp.salary < 3000) then
DBMS_OUTPUT.PUT_LINE('Soy un tieso.');
elsif (v_f_emp.salary >= 3000 and v_f_emp.salary < 6000) then
DBMS_OUTPUT.PUT_LINE('Puedo contratar HBO');
else
DBMS_OUTPUT.PUT_LINE('ESTOY EN EL TACO');




DECLARE 
v_inicio NUMBER:=100;
v_final NUMBER:=117;

begin

FOR i IN v_inicio .. v_final loop
  SELECT first_name, last_name, salary
  from employees where employee_id = 100
end loop;

if (i.salary < 3000) then
DBMS_OUTPUT.PUT_LINE('soy un tieso.');
elsif (i.salary >= 3000 and i.salary < 6000) then
DBMS_OUTPUT.PUT_LINE('Estoy bien.');
else
DBMS_OUTPUT.PUT_LINE('ESTOY EN EL TACO');

desde 100 al empleado 117
mostrar nombre, apellido, sueldo

< 3000 soy pobre
>= 3000 y < 6000
estoy bien
  
>= 5000
soy rico
