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
SET SERVEROUTPUT ON
DECLARE
CURSOR empleados IS
 SELECT employee_id, first_name, department_name FROM employees, departments where employees.department_id=departments.department_id
 order by department_name asc;
 v_reg_empleado empleados%ROWTYPE;
BEGIN
OPEN empleados;
FETCH empleados INTO v_reg_empleado;
    WHILE empleados%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_reg_empleado.employee_id||' Apellido: '|| v_reg_empleado.first_name||' Departamento: '||v_reg_empleado.department_name);
    FETCH empleados INTO v_reg_empleado;
END LOOP;
CLOSE empleados;
END;
--4.-Escribir un procedimiento que reciba una cadena y visualice el nombre y el número de empleado de todos 
--los empleados cuyo nombre contenga la cadena especificada. 
--Al finalizar visualizar el número de empleados mostrados. --> 1.5 punto
SET SERVEROUTPUT ON
DECLARE
CURSOR buscar IS
 SELECT first_name, employee_id FROM employees where first_name like v_escribe;
 v_escribe buscar%ROWTYPE;
BEGIN
    v_escribe:='%'"||&v_escribe||"'%';
OPEN buscar;
FETCH buscar INTO v_escribe;
    WHILE buscar%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_escribe.first_name||' Número: '||v_escribe.employee_id||);
    FETCH buscar INTO v_escribe;
END LOOP;
dbms_output.put_line('Hay '||buscar%ROWCOUNT||' empleados.');
CLOSE buscar;
END;

--5.- Crear un procedimiento que muestre las localizaciones (dirección y ciudad) y el número 
--de departamentos que tiene (incluso si no tiene departamentos). --> 2 puntos
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE LOCALIZACIONES
IS
CURSOR loc IS
SELECT street_address, city, count(department_name) FROM departments, locations where location_id.departments=location_id.locations;
v_loc street_address.%TYPE;
v_dname dept.dname%TYPE;
v_num_emp NUMBER;
BEGIN
OPEN c_depar;
            FETCH c_depar INTO v_deptno, v_dname;
            WHILE c_depar%FOUND LOOP
            v_num_emp:=devolverNumEmpleado (v_deptno); /*LLAMANDO A UNA FUNCIÓN PONIENDO LA VARIABLE*/
            dbms_output.put_line (' el departamento ' ||v_dname|| ' tiene ' ||v_num_emp);
            FETCH c_depar INTO v_deptno, v_dname;
            END LOOP;
            CLOSE c_depar;


--6.- Escribir un programa que visualice el nombre, apellido y el salario de los cuatro empleados que tienen el salario más bajo. --> 2 puntos

--7.-Codificar un programa que visualice los dos empleados que ganan más de cada oficio. 2 puntos