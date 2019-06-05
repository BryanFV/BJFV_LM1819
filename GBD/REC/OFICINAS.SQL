--1.- Crea una tabla oficinas_2, con la misma estructura que oficinas, pero con un campo 
--adicional denominado total_empleados. Cargue los datos de oficinas en oficinas_2 (1 punto)




--2.- Calcule el campo total_empleados, con el número de empleados asignados a esa oficina, incluyendo las oficinas que no tienen empleados. 1.5 puntos
UPDATE OFICINAS_2

SET TOTAL_EMPLEADOS =(SELECT COUNT(NUM_EMPL) FROM EMPLEADOS E WHERE E.OFICINA=OFICINAS_2.OFICINA);

--3.- Realice el borrado de la tabla oficinas_2  de las oficinas con menos de 5 empleados asignados. 0.5 puntos.
DELETE FROM OFICINAS_2 WHERE TOTAL_EMPLEADOS < 5;
--4 .- Crear un procedimiento llamado limite_credito que reciba como parámetro un código de oficina y ponga a 0 el limite de crédito de todos los 
--clientes cuyo representante esté asignado a la misma. Si la oficina no existe deberá indicarlo con un mensaje. 2 puntos. 
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE limite_credito (E_CREDITO IN NUMBER)
IS
CURSOR LIMITE_CURSOR IS
SELECT C.NUM_CLIENTE FROM CLIENTES C INNER JOIN EMPLEADOS E ON C.REP_CLIE=E.NUM_EMPL
INNER JOIN  OFICINAS O ON E.OFICINA=O.OFICINA WHERE O.OFICINA=E_CREDITO;
V_CREDITO NUMBER;

BEGIN
 OPEN LIMITE_CURSOR;
 FETCH  LIMITE_CURSOR INTO V_CREDITO;
 IF LIMITE_CURSOR%NOTFOUND THEN
 DBMS_OUTPUT.PUT_LINE('NO EXISTE ESA LINEA EN CONCRETO.');
 ELSE
  UPDATE CLIENTES 
  SET LIMITE_CREDITO = 0 WHERE NUM_CLIENTE = V_CREDITO;
  COMMIT;
 FETCH LIMITE_CURSOR INTO V_CREDITO;
 END IF;
 CLOSE LIMITE_CURSOR;
 END;
--EJECUTAR
SET SERVEROUTPUT ON
BEGIN
LIMITE_CREDITO(&E_CODIGO);
END;

--COMPROBAR
SELECT C.LIMITE_CREDITO, O.OFICINA AS CODIGO_OFICINA FROM CLIENTES C INNER JOIN EMPLEADOS E ON C.REP_CLIE=E.NUM_EMPL
INNER JOIN OFICINAS O ON E.OFICINA=O.OFICINA;

--5. Usando un cursor, crear un procedimiento llamado datos_empleados que reciba como parámetro un número de empleado y muestre el nombre, la edad y el número de pedidos, de aquellos empleados cuyo número sea menor o igual que el introducido. 2.5 puntos. 

--6. Crear un procedimiento llamado inserta_producto que reciba los datos como parámetros y realice la inserción en la correspondiente tabla. Un ejemplo de llamada al procedimiento será inserta_producto ('RAY', '2B45D', 'JUNTA', 79, 210). Antes de proceder a la inserción se debe comprobar si se cumple la restricción de clave primaria, esto es, si ya existe el id_producto que se desea introducir se mostrará un mensaje de error indicando que se está violando la restricción. En cambio, si la inserción se realiza con éxito, se mostrará un mensaje indicándolo. (2.5 puntos.)