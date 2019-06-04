--1.- Crea una tabla oficinas_2, con la misma estructura que oficinas, pero con un campo 
--adicional denominado total_empleados. Cargue los datos de oficinas en oficinas_2 (1 punto)

CREATE TABLESPACE OFICINAS
DATAFILE
  'C:\ORACLE\OFICINAS\OFICINAS-1.ORA' SIZE 1 M,
  'C:\ORACLE\OFICINAS\OFICINAS-2.ORA' SIZE 500 K
DEFAULT STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 25);

CREATE USER OFICINAS 
IDENTIFIED BY OFICINAS
DEFAULT TABLESPACE OFICINAS
QUOTA UNLIMITED ON OFICINAS;

GRANT DBA TO OFICINAS;




--2.- Calcule el campo total_empleados, con el número de empleados asignados a esa oficina, incluyendo las oficinas que no tienen empleados. 1.5 puntos

--3.- Realice el borrado de la tabla oficinas_2  de las oficinas con menos de 5 empleados asignados. 0.5 puntos.

--4 .- Crear un procedimiento llamado limite_credito que reciba como parámetro un código de oficina y ponga a 0 el limite de crédito de todos los clientes cuyo representante esté asignado a la misma. Si la oficina no existe deberá indicarlo con un mensaje. 2 puntos. 
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE limite_credito (E_CREDITO OFICINAS.OFICINA%TYPE)
AS
CURSOR LIMITE IS
SELECT LIMITE_CREDITO FROM CLIENTES 


--5. Usando un cursor, crear un procedimiento llamado datos_empleados que reciba como parámetro un número de empleado y muestre el nombre, la edad y el número de pedidos, de aquellos empleados cuyo número sea menor o igual que el introducido. 2.5 puntos. 

--6. Crear un procedimiento llamado inserta_producto que reciba los datos como parámetros y realice la inserción en la correspondiente tabla. Un ejemplo de llamada al procedimiento será inserta_producto ('RAY', '2B45D', 'JUNTA', 79, 210). Antes de proceder a la inserción se debe comprobar si se cumple la restricción de clave primaria, esto es, si ya existe el id_producto que se desea introducir se mostrará un mensaje de error indicando que se está violando la restricción. En cambio, si la inserción se realiza con éxito, se mostrará un mensaje indicándolo. (2.5 puntos.)