--1.-Desarrollar un procedimiento que visualice el nombre y apellido de todos los empleados    ordenados por número de departamento. --> 1 punto

SET SERVEROUTPUT ON
DECLARE
CURSOR nombre_cursor IS 
 SELECT first_name, last_name FROM employees order by department_id;
 v_reg_nombre nombre_cursor%ROWTYPE;
BEGIN
OPEN nombre_cursor;
FETCH nombre_cursor INTO v_reg_nombre;
    WHILE nombre_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_reg_nombre.first_name||' Apellido: '|| v_reg_nombre.last_name);
    FETCH nombre_cursor INTO v_reg_nombre;
END LOOP;
CLOSE nombre_cursor;
END;
--2.- Desarrollar un procedimiento que encuentre el primer empleado con un sueldo menor de 6.000 €. --> 0.5 puntos
SET SERVEROUTPUT ON
DECLARE
CURSOR primer_empleado IS
 SELECT first_name, last_name, salary FROM employees where salary < 6000 order by salary asc;
 v_reg_empleado primer_empleado%ROWTYPE;
BEGIN
OPEN primer_empleado;
FETCH primer_empleado INTO v_reg_empleado;
    WHILE primer_empleado%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_reg_empleado.first_name||' Apellido: '|| v_reg_empleado.last_name||' Salary: '||v_reg_empleado.salary);
    FETCH primer_empleado INTO v_reg_empleado;
END LOOP;
CLOSE primer_empleado;
END;
--3.- Realizar un procedimiento que visualice el número y nombre de un empleado, así como el nombre de su departamento, ordenados por nombre de departamento. --> 1 punto

--4.-Escribir un procedimiento que reciba una cadena y visualice el nombre y el número de empleado de todos los empleados cuyo nombre contenga la cadena especificada. Al finalizar visualizar el número de empleados mostrados. --> 1.5 punto

--5.- Crear un procedimiento que muestre las localizaciones (dirección y ciudad) y el número de departamentos que tiene (incluso si no tiene departamentos). --> 2 puntos

--6.- Escribir un programa que visualice el nombre, apellido y el salario de los cuatro empleados que tienen el salario más bajo. --> 2 puntos

--7.-Codificar un programa que visualice los dos empleados que ganan más de cada oficio. 2 puntos