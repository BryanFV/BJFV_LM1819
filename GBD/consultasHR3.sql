--1.- Listar el nombre de los departamentos en los que alguno de los salarios sea superior a 2000.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (select DEPARTMENT_ID from EMPLOYEES where SALARY > 2000);
--2.- Listar el nombre de los departamentos que tengan algún empleado que gane más de 33000 al año. (Recuerda que el salario es mensual).
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENTS_ID > (SELECT DEPARTMENTS_ID FROM EMPLOYEES WHERE SALARY * 12 > 33000);
--3.- Listar todos los empleados que trabajen en el departamento con nombre Shipping .
SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Shipping');
--4.-Mostrar todos los datos de los empleados que trabajen en un departamento cuyo nombre contenga una l.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE '%l%');
--5.- Muestra los empleados que ganan más que Alexander Hunold.
SELECT first_name FROM EMPLOYEES WHERE salary > (select salary from employees where last_name = 'Hunold');
--6.- Listar aquellos empleados que han entrado a trabajar en la empresa antes que Bruce Ernst.
select first_name from EMPLOYEES WHERE HIRE_DATE < (SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Ernst');
--7.- Muestra los empleados del mismo departamento que Alexander Hunold.
SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE last_name = 'Hunold');
--8.- Muestra los empleados que trabajan en un departamento ubicado en Seattle.
SELECT FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS WHERE CITY =  'Seattle'));
--9.- Muestra nombre y salario de los empleados del departamento Executive.
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Executive' );
--10.- Muestra el nombre, el salario y la comisión de los empleados que trabajan en el mismo departamento que Bruce Ernst.
SELECT FIRST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME = 'Ernst');
--11.- Muestra el nombre del departamento donde trabaja el empleado más antiguo la empresa.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEES));
--12.- Muestra los nombres de los departamentos en los que trabaja alguien que gane menos que Bruce Ernst.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >(SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME ='Ernst'));
--13.-Muestra todos los datos de los Programmer del Departamento 60.
Select * from employees where department_id = '60' and job_id in (Select job_id from jobs where job_title like 'Programmer');
--14.- Obtener el sueldo medio de los empleados que trabajan en Seattle.
Select avg(salary) from EMPLOYEES where DEPARTMENT_ID in (Select DEPARTMENT_ID from DEPARTMENTS where location_id in (Select location_id from locations where city like 'Seattle'));
--15.- Muestra la cantidad de empleados que trabajan en el departamento Shipping.
Select count(first_name) from EMPLOYEES where department_id in (Select department_id from departments where DEPARTMENT_NAME like 'Shipping');
