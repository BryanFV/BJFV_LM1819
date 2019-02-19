


1. Mostrar el apellido, fecha de alta y número de departamento de cada empleado.+
Select last_name, hire_date, department_id from EMPLOYEES;

2. Mostrar el número, nombre y localización de cada departamento. 
Select department_id, department_name, location_id from DEPARTMENTS;

3. Mostrar todos los datos de todos los empleados.
Select * from EMPLOYEES;

4. Datos de los empleados ordenados por apellido. 
Select * from EMPLOYEES order by last_name;

5. Datos de los empleados ordenados descendentemente por número de departamento. 
Select * from EMPLOYEES order by department_id DESC;

6. Datos de los empleados ordenados descendentemente por número de departamento y dentro de cada departamento ordenados ascendentemente por apellido. 
Select * from EMPLOYEES order by department_id DESC, last_name ASC;

7. Mostrar los datos de los empleados cuyo salario esté comprendido entre 10000 y 30000, ordenados por salario. 
Select * from EMPLOYEES where salary BETWEEN 10000 and 30000 order by salary;

8. Mostrar los datos de los empleados cuyo salario sea mayor que 20000. 
Select * from EMPLOYEES where salary > 20000;

9. Mostrar los datos de los empleados cuyo oficio sea programador. 
Select * from EMPLOYEES where job_id = 'IT_PROG';

10. Seleccionar el apellido y oficio de los empleados del departamento número 20. 
Select last_name, job_id from EMPLOYEES where department_id = '20';

11. Mostrar los apellidos de los empleados en orden ascendente. 
Select last_name from EMPLOYEES order by last_name ASC;

12. Seleccionar los empleados cuyo oficio  sea marketing manager. Mostrar los datos
ordenados por apellido.
Select * from EMPLOYEES where job_id = (Select job_id from JOBS where job_title = 'Marketing Manager') order by last_name;

13. Mostrar los empleados cuyo departamento sea 100 y cuyo oficio sea accountant. Ordenar el resultado por apellido; 
Select * from EMPLOYEES where department_id = '100'and job_id = (select job_id from JOBS where job_title ='Accountant') order by last_name;

14. Mostrar los empleados que tengan un salario mayor que 200000 o que pertenezcan al departamento número 20. 
Select * from EMPLOYEES where salary > '20000' or department_id = '20';

15. Ordenar los empleados por oficio, y dentro de oficio por apellido. 
Select * from EMPLOYEES order by job_id = (select job_id from JOBS order by job_title) order by last_name;

16. Seleccionar los empleados cuyo apellido empiece por ‘S’.
Select * from EMPLOYEES where last_name like 'S%';

17. Seleccionar los empleados cuyo apellido termine en 'n'. 
Select * from EMPLOYEES where last_name like '%n';

18. Seleccionar de la tabla empleados aquellas filas cuyo apellido empiece por ‘A’ y el email tenga una ‘E’ en cualquier posición. 
Select * from EMPLOYEES where last_name like 'A%' and email like '%E%';

19. Seleccionar los empleados cuyo salario esté entre 10000 y 17000. Utilizar el operador BETWEEN. 
Select * from EMPLOYEES where salary BETWEEN 10000 and 17000;

20. Obtener los empleados que tengan una comisión superior a 600. 
Select * from EMPLOYEES where commission_pct > '600';
21. Seleccionar los datos de los empleados ordenados por número de departamento, y dentro de cada departamento ordenados por apellido. 
Select * from EMPLOYEES order by department_id , last_name ASC;

22. Número y apellidos de los empleados cuyo email termine en ‘h’ y tengan un salario superior a 2000. 
Select * from EMPLOYEES where email like '%h' and salary > '2000';

23. Datos de los departamentos cuya localización empiece por ‘B’. 
Select * from DEPARTMENTS where location_id like 'B%';

24. Datos de los empleados que tengan un salario superior a 200 y pertenezcan al departamento número 10. 
Select * from EMPLOYEES where salary > 200 and department_id = '10';

25. Mostrar los apellidos de los empleados que no tengan comisión. 
Select last_name from EMPLOYEES where commission_pct is null;

26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido empiece por ‘J’. 
Select last_name from EMPLOYEES where commission_pct is null and last_name like 'J%';

27. Seleccionar el apellido, salario y número de departamento de los empleados cuyo salario sea mayor que 200000. 
Select last_name, salary, department_id from EMPLOYEES where salary > 20000;

28. Obtener los apellidos de todos los empleados en minúscula. 
Select lower(last_name) from EMPLOYEES;

29. En una consulta concatena el apellido de cada empleado con su oficio. 
Select CONCAT(last_name, job_id) from EMPLOYEES;

30. Mostrar el apellido y la longitud del apellido (función LENGTH) de todos los empleados, ordenados por la longitud de los apellidos de los empleados descendentemente. 
Select last_name, LENGTH(last_name) from EMPLOYEES order by LENGTH(last_name) DESC;

31. Obtener el año de contratación de todos los empleados (función TO_CHAR). 
Select TO_CHAR(hire_date) from EMPLOYEES;

32. Mostrar los datos de los empleados que hayan sido contratados en el año 2004. 
Select * from EMPLOYEES where hire_date like'%/%/04';

33. Mostrar los datos de los empleados que hayan sido contratados en el mes de febrero de cualquier año. 
Select * from EMPLOYEES where hire_date like '%/02/%';

34. Mostrar los datos de los empleados cuyo apellido empiece por 'S' y hayan sido contratados en el año 2006. 
Select * from EMPLOYEES where last_name like 'S%' and hire_date like '%/%/06';