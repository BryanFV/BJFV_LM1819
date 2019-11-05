--francisco javier muñoz sánchez

--1

--A.

INSERT INTO DEPARTMENTS_2 (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM DEPARTMENTS;

--B.
UPDATE DEPARTMENT_2
    SET TOTAL = (SELECT COUNT(DEPARTMENT_ID) FROM DEPARTMENT_2 WHERE DEPARTMETN_ID = DEPARTMENT_ID);
--C.

DELETE FROM DEPARTMENTS_2;


--2.

CREATE OR REPLACE PROCEDURE ACTIVIDAD_2 
(
  P_ACCION IN NUMBER 
, P_VALOR IN VARCHAR2 
, P_CLAVE IN NUMBER 
) AS 


BEGIN

IF P_ACCION = 0 THEN

    UPDATE DEPARTMENTS_2
        SET DEPARTMENT_NAME = P_VALOR
            WHERE DEPARTMENT_ID = P_CLAVE;

ELSIF P_ACCION = 1 THEN

    DELETE FROM departments_2
        WHERE DEPARTMENT_ID = P_CLAVE;
        
ELSE

DBMS_OUTPUT.PUT_LINE('EL PARAMETRO DE ACCIÓN NO ES VALIDO');
    

END IF;

END ACTIVIDAD_2;

--3.

CREATE OR REPLACE PROCEDURE ACTIVIDAD_3 AS 

CURSOR DEPARTAMENTOS IS
SELECT * FROM DEPARTMENTS;
V_DEPARTAMENT DEPARTMENTS_2%ROWTYPE;
BEGIN

INSERT INTO DEPARTMENTS_2 (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID FROM DEPARTMENTS;

FETCH DEPARTAMENTOS INTO V_DEPARTAMENT.DEPARTMENT_ID, V_DEPARTAMENT.DEPARTMENT_NAME, V_DEPARTAMENT.MANAGER_ID, V_DEPARTAMENT.LOCATION_ID;

WHILE DEPARTAMENTOS%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(V_DEPARTAMENT.DEPARTMENT_ID, V_DEPARTAMENT.DEPARTMENT_NAME, V_DEPARTAMENT.MANAGER_ID, V_DEPARTAMENT.LOCATION_ID);
FETCH DEPARTAMENTOS INTO V_DEPARTAMENT.DEPARTMENT_ID, V_DEPARTAMENT.DEPARTMENT_NAME, V_DEPARTAMENT.MANAGER_ID, V_DEPARTAMENT.LOCATION_ID;


END LOOP;

DBMS_OUTPUT.PUT_LINE('SE HAN INSERTADO' || DEPARTAMENTOS%ROWCOUNT || 'REGISTROS');

END ACTIVIDAD_3;

--4.

CREATE OR REPLACE PROCEDURE ACTIVIDAD_4 AS 

CURSOR DEPARTAMENTO IS
SELECT *
FROM DEPARTMENTS_2;
V_DEPARTAMENTO DEPARTMENTS_2%ROWTYPE;
V_CONTADOR NUMBER := 1;
BEGIN

FOR V_DEPARTAMENTO IN DEPARTAMENTO LOOP
DBMS_OUTPUT.PUT_LINE(V_DEPARTAMENTO.DEPARTMENT_ID || '----' || V_DEPARTAMENTO.DEPARTMENT_NAME || '----' || V_DEPARTAMENTO.MANAGER_ID || '----' || V_DEPARTAMENTO.LOCATION_ID);
V_CONTADOR := V_CONTADOR +  1;


END LOOP;

DBMS_OUTPUT.PUT_LINE( 'REGISTRO: ' || V_CONTADOR);
END ACTIVIDAD_4;