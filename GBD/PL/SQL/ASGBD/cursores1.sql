--Ejercicios iniciales de cursores:

--1. Desarrollar un procedimiento que visualice el nombre y apellido de todos los empleados ordenados por número de departamento. --> 1 punto
--3. Realizar un procedimiento que visualice el número y nombre de un empleado, así como el nombre de su departamento, ordenados por nombre de departamento. --> 1 punto
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p_empleado
is
CURSOR c_empleado IS
 SELECT employee_id, first_name, department_name FROM employees e , departments d
  where e.department_id=d.department_id order by department_name asc;
 v_empleado c_empleado%ROWTYPE;
BEGIN
OPEN c_empleado;
FETCH c_empleado INTO v_empleado;
    WHILE c_empleado%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_empleado.employee_id||' Apellido: '|| v_empleado.first_name||' Departamento: '||v_empleado.department_name);
    FETCH c_empleado INTO v_empleado;
END LOOP;
CLOSE c_empleado;
END;
/
EXEC p_empleado()

--2. Desarrollar un procedimiento que encuentre el primer empleado con un sueldo menor de 6.000 €. --> 0.5 puntos

--3. Realizar un procedimiento que visualice el número y nombre de un empleado, así como el nombre de su departamento, ordenados por nombre de departamento. --> 1 punto
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p_empleado
is
CURSOR c_empleado IS
 SELECT employee_id, first_name, department_name FROM employees e , departments d
  where e.department_id=d.department_id order by department_name asc;
 v_empleado c_empleado%ROWTYPE;
BEGIN
OPEN c_empleado;
FETCH c_empleado INTO v_empleado;
    WHILE c_empleado%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('ID Empleado: '||v_empleado.employee_id||' Nombre: '|| v_empleado.first_name||' Departamento: '||v_empleado.department_name);
    FETCH c_empleado INTO v_empleado;
END LOOP;
CLOSE c_empleado;
END;
/
EXEC p_empleado()
--4. Escribir un procedimiento que reciba una cadena y visualice el nombre y el número de empleado de todos los empleados cuyo nombre contenga la cadena especificada. Al finalizar visualizar el número de empleados mostrados. --> 1.5 punto

--5. Crear un procedimiento que muestre las localizaciones (dirección y ciudad) y el número de departamentos que tiene (incluso si no tiene departamentos). --> 2 puntos

--6. Escribir un programa que visualice el nombre, apellido y el salario de los cuatro empleados que tienen el salario más bajo. --> 2 puntos
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE p_salario

CURSOR emp IS
SELECT first_name, last_name, salary FROM employees ORDER BY salary asc;
v_sal emp%ROWTYPE;
v_cantidad number :=1;
BEGIN
OPEN emp;
FETCH emp INTO v_reg_sal;
WHILE emp%FOUND AND v_cantidad<=4 LOOP 
DBMS_OUTPUT.PUT_LINE('El empleado: '||v_sal.first_name||'tiene un salario de '|| v_sal.salary); 
FETCH emp INTO v_reg_sal;
v_cantidad:=v_cantidad+1;
END LOOP;
CLOSE emp;
END;
--7.Codificar un programa que visualice los dos empleados que ganan más de cada oficio. 2 puntos