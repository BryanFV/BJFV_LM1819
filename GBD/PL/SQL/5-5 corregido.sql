--FRANCISCO JAVIER MUÑOZ SÁNCHEZ

--Utilizando los datos del tablespace HR:

--Hacer un procedimiento que muestre el nombre y el salario del empleado cuyo código es 117.

CREATE OR REPLACE PROCEDURE EJER1
IS
  v_nombre EMPLOYEES.FIRST_NAME%TYPE;
  v_salario EMPLOYEES.SALARY%TYPE;
  
BEGIN
  SELECT FIRST_NAME, SALARY 
  INTO v_nombre, v_salario
  FROM EMPLOYEES
  where EMPLOYEE_ID='117';
  dbms_output.put_line('Nombre: '||v_nombre||' Salario: '||v_salario);
END EJER1;

--EJECUTAR EL PROCEDIMIENTO

SET SERVEROUTPUT ON
DECLARE
BEGIN
EJER1();
END;

--Hacer un procedimiento que, reciba por teclado un código de empleado y devuelva su nombre.

CREATE OR REPLACE PROCEDURE EJER2 (E_CODIGO IN EMPLOYEES.EMPLOYEE_ID%TYPE) --Aquí le estamos diciendo el campo y el tipo de dato NOMBRE_PROCEDIMIENTO(NOMBRE_PARAMETRO IN  TABLA.CAMPO TIPO_DATO)
IS
  v_nombre EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME 
  INTO v_nombre
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = E_CODIGO;
  dbms_output.put_line('Nombre: '||v_nombre);
END EJER2;

--EJECUTAR PROCEDIMIENTO

SET SERVEROUTPUT ON
DECLARE
BEGIN
EJER2(&E_CODIGO);
END;

--Crear un procedimiento que cuente el número de filas que hay en la tabla EMPLOYEES, deposite el resultado en una variable y visualiza su contenido.

CREATE OR REPLACE PROCEDURE EJER3
IS
  v_nfilas NUMBER;
BEGIN
  SELECT COUNT(*) 
  INTO v_nfilas
  FROM EMPLOYEES;
  dbms_output.put_line('Nº Filas de la tabla EMPLEADOS:: '||v_nfilas);
end EJER3;

--EJECUTAR PROCEDIMIETO

SET SERVEROUTPUT ON
DECLARE
BEGIN
EJER3();
END;


--Codificar un procedimiento que permita borrar un empleado cuyo número se introducirá por teclado.

CREATE OR REPLACE PROCEDURE BORRAR_EMPLEADO (E_CODIGO IN EMPLOYEES.EMPLOYEE_ID%TYPE)
IS
BEGIN
  DELETE FROM EMPLOYEES
  WHERE EMPLOYEE_ID= E_CODIGO;
END BORRAR_EMPLEADO;

--EJECUTAR PROCEDIMIETO

SET SERVEROUTPUT ON
DECLARE
BEGIN
BORRAR_EMPLEADO(&E_CODIGO);
END;

--Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento recibirá como parámetros el número del departamento y la localidad nueva.

CREATE OR REPLACE PROCEDURE MODIFICAR_LOCALIDAD (ID_DEPARTAMENTO IN DEPARTMENTS.DEPARTMENT_ID%TYPE, ID_LOCALIDAD IN DEPARTMENTS.LOCATION_ID%TYPE)
IS
BEGIN
  UPDATE DEPARTMENTS
  SET LOCATION_ID = ID_LOCALIDAD
  WHERE DEPARTMENT_ID = ID_DEPARTAMENTO;
  
  IF  (SQL%ROWCOUNT = 1) THEN
  
  	dbms_output.put_line('CAMPO MODIFICADO');
	
  ELSE
  
  	dbms_output.put_line('NO SE ENCUENTRA EL DEPARTAMENTO');
	
  END IF;
  
END MODIFICAR_LOCALIDAD;


--EJECUTAR PROCEDIMIETO

SET SERVEROUTPUT ON
DECLARE
BEGIN
MODIFICAR_LOCALIDAD(10,1500);
END;

--Crear un procedimiento que en la tabla EMPLOYEES incremente el salario el 10% a los empleados que tengan una comisión superior al 5% del salario.

 CREATE OR REPLACE PROCEDURE EMPLEADO_AUMENTO_S
 AS
 BEGIN
  UPDATE EMPLOYEES 
  SET SALARY = SALARY*1.1
  WHERE COMMISSION_PCT > 0.05;
  dbms_output.put_line('Se ha aumentado el sueldo en un 10% a empleados que comBran el 5%');
 END EMPLEADO_AUMENTO_S;
 
 --EJECUTAR PROCEDIMIETO

SET SERVEROUTPUT ON
DECLARE
BEGIN
EMPLEADO_AUMENTO_S();
END;

--Crear un procedimiento que inserte un empleado en la tabla EMPLOYEES. Su número será superior a los existentes y la fecha de incorporación a la empresa será la actual.

 CREATE OR REPLACE PROCEDURE INSERTAR_EMPLEADO
 AS
 v_id EMPLOYEES.EMPLOYEE_ID%TYPE;
 v_fecha EMPLOYEES.HIRE_DATE%TYPE;
 BEGIN
 v_id := SELECT MAX(EMPLOYEE_ID)+1 FROM EMPLOYEES;
 v_fecha := SYSDATE;
 
 INSERT INTO EMPLOYEES VALUES (v_id,'JAVIER','MUNOZ','JAVI','590.423.4567',SYSDATE, 'IT_`PROG', 6500, , 100, 60 );
  
  dbms_output.put_line('');
 END INSERTAR_EMPLEADO;
 
 --DONDE SE PUEDE PONER EL +1
  INSERT INTO EMPLOYEES VALUES (v_id +1,'JAVIER','MUNOZ','JAVI','590.423.4567',SYSDATE, 'IT_`PROG', 6500, , 100, 60 );
--PARA INSERTAR UN DATO HAY QUE VER SI EL REGISTRO ADMITE DATOS NOT NULL ESO SE PEUDE VER EN LA TABLA/COLUMNAS/NULLABLE
 
  --EJECUTAR PROCEDIMIETO
  
SET SERVEROUTPUT ON
DECLARE
BEGIN
INSERTAR_EMPLEADO();
END;


--Codificar un procedimiento que reciba una cadena y la visualice al revés.

SET SERVEROUTPUT ON
  DECLARE 
  V_CAD1 VARCHAR2(20):='GRACIAS'; 
  V_CAD2 VARCHAR2(20); 
  BEGIN 
  FOR I IN REVERSE 1..LENGTH(V_CAD1) LOOP 
  V_RESUL:=V_CAD2||SUBSTR(V_CAD1,I,1); 
  END LOOP; 
  DBMS_OUTPUT.PUT_LINE(V_RESUL); 
  END;

--Escribir un procedimiento que reciba una fecha y escriba el año, en número, correspondiente a esa fecha.

CREATE OR REPLACE PROCEDURE FECHA (v_fecha IN VARCHAR2)
AS
v_an NUMBER(2);
v_res NUMBER(4);

BEGIN
v_an := substr(v_fecha,7,2);

IF v_an > substr(SYSDATE,7,2) THEN
	v_res := (19 || v_an);
ELSE
v_res := (20 || v_an);
END IF;

END FECHA;

--OTRA FORMA

CREATE OR REPLACE PROCEDURE FECHA (v_fecha IN DATE)
AS
v_an NUMBER;
BEGIN
v_an := to_number(to_char(v_an, 'YYYY'));
dbms_output.put_line(v_an);
END FECHA;




--EJECUTAR PROCEDIMIENTO

SET SERVEROUTPUT ON
DECLARE
BEGIN
FECHA('12/05/1998'); --LO PONEMOS EN COMILLA SIMPLE PORQUE SI NO LO DETECTA COMO UNA DIVISIÓN
END;



--Realizar un procedimiento que reciba un número y muestre su tabla de multiplicar.

CREATE OR REPLACE PROCEDURE TABLA_MULTIPLICAR (V_NUMERO IN NUMBER)
IS
BEGIN
  FOR I IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (V_NUMERO||'X'||I||'='||V_NUMERO*I);
  END LOOP;
END TABLA_MULTIPLICAR;

--EJECUTAR PROCEDIMIENTO

SET SERVEROUTPUT ON
DECLARE
BEGIN
TABLA_MULTIPLICAR(&V_NUMERO);
END;

--Realizar función factorial.

--CREACIÓN FACTORIAL

SET SERVEROUTPUT ON
DECLARE
V_NUMERO NUMBER := 7;
V_FACTORIAL NUMBER;
BEGIN
V_FACTORIAL :=FACTORIAL(&V_NUMERO);
DBMS_OUTPUT.PUT_LINE(V_FACTORIAL);
END;

--PROCEDIMIENTO FACTORIAL

CREATE OR REPLACE FUNCTION FACTORIAL ( N IN NUMBER )
RETURN NUMBER AS 
RESULTADO NUMBER :=1;
BEGIN
FOR I IN 1..N LOOP

RESULTADO := RESULTADO *I;

END LOOP;
  RETURN RESULTADO;
END FACTORIAL;

--Realizar función salarios pizarra.

SET SERVEROUTPUT ON
DECLARE

v_datos employees%rowtype;

BEGIN

FOR i IN 100 .. 117 LOOP

SELECT *

INTO v_datos --COJE LOS VALORES DEL SELECT

FROM EMPLOYEES

WHERE EMPLOYEE_ID = i;

IF (v_datos.salary < 3000) THEN

	dbms_output.put_line(v_datos.FIRST_NAME || v_datos.LAST_NAME || v_datos.SALARY || 'ES POBRE');

ELSIF (v_datos.salary >= 3000 AND v_datos.salary < 5000) THEN

	dbms_output.put_line(v_datos.FIRST_NAME || v_datos.LAST_NAME || v_datos.SALARY || 'PUEDO CONTRATAR HBO');

ELSE

	dbms_output.put_line(v_datos.FIRST_NAME || v_datos.LAST_NAME || v_datos.SALARY || 'ESTA EN EL TACO');

END IF;

END LOOP;

END;

--CURSORES IS
--PROCEDIMEINTOS Y FUNCIONES IS O AS