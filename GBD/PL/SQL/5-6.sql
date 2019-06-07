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
CREATE OR REPLACE PROCEDURE CONCATENA (v_cadena in VARCHAR2)
DECLARE
CURSOR buscar IS
 SELECT first_name, employee_id FROM employees where first_name like v_escribe;
 v_escribe buscar%ROWTYPE;
BEGIN
    v_escribe VARCHAR2(50):='%'||&m_cadena||'%';
OPEN buscar;
FETCH buscar INTO v_escribe;
    WHILE buscar%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: '||v_escribe.first_name||' Número: '||v_escribe.employee_id);
    FETCH buscar INTO v_escribe;
END LOOP;
dbms_output.put_line('Hay '||buscar%ROWCOUNT||' empleados.');
CLOSE buscar;
END;

--5.- Crear un procedimiento que muestre las localizaciones (dirección y ciudad) y el número 
--de departamentos que tiene (incluso si no tiene departamentos). --> 2 puntos
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE cinco
AS
CURSOR loc IS
SELECT street_address, city, count(department_id) as Departamentos FROM locations l
left join departments d on l.location_id=d.location_id group by street_address. city;
v_street loc%TYPE;

BEGIN
OPEN loc;
            FETCH loc INTO v_street, v_dname;
            WHILE loc%FOUND LOOP
            v_numdept:=cinco (v_deptno); 
            dbms_output.put_line (' el departamento ' ||v_dname|| ' tiene ' ||v_num_emp);
            FETCH c_depar INTO v_deptno, v_dname;
            END LOOP;
            CLOSE c_depar;
           
END;
/
--6.- Escribir un programa que visualice el nombre, apellido y el salario de los cuatro empleados que tienen el salario más bajo. --> 2 puntos
SET SERVEROUTPUT ON
DECLARE
CURSOR emp IS
SELECT first_name, last_name, salary FROM employees ORDER BY salary asc;
v_reg_sal emp%ROWTYPE;
v_contador number :=1;
BEGIN
OPEN emp;
FETCH emp INTO v_reg_sal;
WHILE emp%FOUND AND v_cantidad<=4 LOOP 
DBMS_OUTPUT.PUT_LINE('El empleado: '||v_reg_sal.first_name||'tiene un salario de '|| v_reg_sal.salary); 
FETCH emp INTO v_reg_sal;
v_cantidad:=v_cantidad+1;
END LOOP;
CLOSE emp;
END;
--7.-Codificar un programa que visualice los dos empleados que ganan más de cada oficio. 2 puntos
SET SERVEROUTPUT ON
DECLARE
CURSOR emp IS
SELECT first_name, job_id, salary FROM employees ORDER BY job_title asc, salar desc;
v_reg_emp emp%ROWTYPE;
v_job employees.job_id%TYPE;
v_cantidad NUMBER;
BEGIN
OPEN emp;
v_job:='*';
FETCH emp INTO v_reg_emp;
WHILE emp%FOUND LOOP 
IF v_job <> v_reg_emp.job_id THEN
v_job := v_reg_emp.job_id;
v_cantidad := 1;
END IF;
IF v_cantidad <= 2 THEN
DBMS_OUTPUT.PUT_LINE(v_reg_emp.job_id||' * '
||v_reg_emp.first_name||' * '
||v_reg_emp.salary); 
END IF;
FETCH emp INTO v_reg_emp;
v_cantidad:=v_cantidad+1;
END LOOP;
CLOSE emp;
END;