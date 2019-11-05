--1.-Utilizando los datos de HR:

 --a.Hacer un procedimiento que muestre el nombre y el nombre del trabajo(job_title) del empleado cuyo código es 100.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE nombre_job
IS
  v_nombre EMPLOYEES.FIRST_NAME%TYPE;
  v_job JOBS.job_title%TYPE;
  
BEGIN
  SELECT FIRST_NAME, JOB_TITLE
  INTO v_nombre, v_job
  FROM EMPLOYEES e inner join jobs j on e.job_id=j.job_id
  where employee_id='100';
  dbms_output.put_line('Nombre: '||v_nombre||' Puesto: '||v_job);
END nombre_job;
/
exec nombre_job();
  --b.Hacer una función a la que le pasamos un código de empleado y devuelva su nombre.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE BUSCAME (E_BUSCAME IN EMPLOYEES.EMPLOYEE_ID%TYPE)
IS
V_NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
V_APELLIDO EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME
    INTO V_NOMBRE, V_APELLIDO
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = E_BUSCAME;
    DBMS_OUTPUT.PUT_LINE('NOMBRE DEL EMPLEADO: '  ||V_NOMBRE|| '  ' ||V_APELLIDO);
END BUSCAME;
/
EXEC BUSCAME(&E_BUSCAME);


 --c.Crear un procedimiento que cuente el número de filas que hay en la tabla DEPARTMENTS, deposite el resultado en una variable y visualiza su contenido.
 SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE CUENTAME
IS
  V_CUENTAME NUMBER;
BEGIN
  SELECT COUNT(*) 
  INTO V_CUENTAME
  FROM EMPLOYEES;
  dbms_output.put_line('Nº DE FILAS DE LOS DEPARTAMENTOS: '||V_CUENTAME);
end CUENTAME;
/
EXEC CUENTAME();
 --d.Codificar un procedimiento que permita borrar un empleado cuyo número se pasa por parámetros.
 SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE DESPEDIDO (E_DESPEDIDO IN EMPLOYEES2.EMPLOYEE_ID%TYPE)
IS
BEGIN
  DELETE FROM EMPLOYEES2
  WHERE EMPLOYEE_ID= E_DESPEDIDO;
END DESPEDIDO;
/
EXEC DESPEDIDO(&E_DESPEDIDO);
 --e.Escribir un procedimiento que modifique el puesto de un empleado. El procedimiento recibirá como parámetros el número del empleado y el nuevo puesto.
 SET SERVEROUTPUT ON
 CREATE OR REPLACE PROCEDURE HAGAMOS_REROLL (PUESTO IN EMPLOYEES2.JOB_ID%TYPE, N_EMPLEADO IN EMPLOYEES2.EMPLOYEE_ID%TYPE)
AS
BEGIN
  UPDATE EMPLOYEES2
  SET EMPLOYEE_ID = N_EMPLEADO
  WHERE JOB_ID = PUESTO;
  
  IF  (SQL%ROWCOUNT = 1) THEN
  
  	dbms_output.put_line('¡¡¡HEMOS HECHO REROLL!!!');
	
  ELSE
  
  	dbms_output.put_line('NO HA FUNCIONADO CRACK...XD');
	

END HAGAMOS_REROLL;
/
EXEC HAGAMOS_REROLL();

  END IF;
  select N_EMPLEADO from employees2;
--f.Crear un procedimiento que en la tabla EMPLOYEES incremente el salario el 20% a los empleados cuyo puesto sea IT_PROG. El procedimiento indicará por pantalla el número de tuplas modificadas.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE SUBIDA_DE_SUELDO_PRIMO
 AS
 BEGIN
  UPDATE EMPLOYEES2
  SET SALARY = SALARY*1.2
  WHERE JOB_ID='IT_PROG';
  dbms_output.put_line('Se ha aumentado el sueldo en un 20%');
 end SUBIDA_DE_SUELDO_PRIMO;
 /
  EXEC SUBIDA_DE_SUELDO_PRIMO();
  
 --COMPROBACIÓN:
 SELECT SALARY FROM EMPLOYEES2 WHERE JOB_ID='IT_PROG';

 --g.Crear un procedimiento que inserte un empleado en la tabla EMPLOYEES. Su número será superior al último en 10 unidades, el nombre y la ciudad la pasaremos por parámetros, complete con los campos obligatorios necesarios.
--2. Codificar un procedimiento que reciba una cadena y la visualice al revés.

--3. Escribir un procedimiento que reciba una fecha y escriba el año, en número, correspondiente a esa fecha.

--4. Codificar un procedimiento que reciba una lista de hasta 4 números y visualice su suma.

--5. Realizar un procedimiento que reciba un número y muestre su tabla de multiplicar.

--6. Diseñar un procedimiento que recibe por parámetros dos valores numéricos que representan la base y el exponente de una potencia donde el exponente es un número entero positivo o negativo. El procedimiento visualiza el valor de la potencia, teniendo en cuenta las siguientes consideraciones:

--Si la base y el exponente son cero, se mostrará un mensaje de error que diga "Datos erróneos".
--Si el exponente es cero la potencia es 1.
--Si el exponente es negativo la fórmula matemática de la potencia es pot = 1/base^exp. En este caso, si la base es cero escribir un mensaje de "Datos erróneos". Nota: No utilizar ninguna función que calcule la potencia.