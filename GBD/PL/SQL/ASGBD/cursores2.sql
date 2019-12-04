--1. Realizar un procedimiento que incremente el salario el 20% a los empleados que tengan una comisión
-- igual al 25% (campo commision_pct) del salario, y visualice el nombre, comisión y salario antiguo, y el 
--nombre, comisión y salario nuevo de todos los empleados modificados. (3 puntos)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE P_AUMENTO
 AS
 CURSOR C_AUMENTO IS
 SELECT FIRST_NAME, COMMISSION_PCT, SALARY FROM EMPLOYEES WHERE COMMISSION_PCT = '0.25';
 V_AUMENTO C_AUMENTO%ROWTYPE;

 BEGIN
    OPEN
  UPDATE EMPLOYEES 
  SET SALARY = SALARY*1.20
  WHERE COMMISSION_PCT = 0.25;
  dbms_output.put_line('HEMOS SUBIDO EL SUELDO A LOS EMPLEADOS CON PCT IGUAL AL 25%');
 END P_AUMENTO;
--2. Buscar todos los empleados que tienen un salario + comisión superior a 8500 y asignarles como nuevo 
--salario esta suma. (3 puntos)
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE P_SALARIO1
 AS
 CURSOR C_SALARIO1 IS
 SELECT FIRST_NAME, COMMISSION_PCT, (SALARY + COMMISSION_PCT) AS SALARIO_MAS_PCT FROM EMPLOYEES 
 WHERE ((SALARY+COMMISSION_PCT)> 8500);
 FOR UPDATE;
 V_SALARIO1 C_SALARIO%ROWTYPE;
 BEGIN 
    OPEN C_SALARIO;
       FETCH C_SALARIO INTO V_SALARIO1, V_SALARIO2;
           while C_SALARIO%FOUND LOOP
            UPDATE EMPLOYEES
                SET SALARY =  V_SALARIO1
                WHERE V_SALARIO


CREATE OR REPLACE PROCEDURE P_SALARIO1 (num_dept NUMBER, inc NUMBER)
IS
   CURSOR C_SALARIO1 IS 
   SELECT FIRST_NAME, COMMISSION_PCT, (SALARY + COMMISSION_PCT) AS SALARIO_MAS_PCT FROM EMPLOYEES 
 WHERE ((SALARY+COMMISSION_PCT)> 8500);
   FOR UPDATE;
   reg c%ROWTYPE;
   inc NUMBER (8);
BEGIN
   OPEN c;
   FETCH c INTO reg;
   WHILE c%FOUND LOOP
         inc :=(reg.salario/100 )* inc;
         UPDATE empleados SET salario=salario+inc WHERE CURRENT OF c
         FETCH c INTO reg;
   END LOOP;
END;

--3. Escribir un procedimiento que suba el sueldo de todos los empleados que ganen menos que el salario medio 
--de su oficio. La subida será del 10% de la diferencia entre el salario del empleado y 
--el máximo de su oficio. (4 puntos)
