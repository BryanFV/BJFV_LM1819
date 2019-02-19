--1.- Listar el salario medio de los empleados.
select avg(salary) from employees;
--2.- Listar el id y apellidos de aquellos empleados que tengan un  salario anual superior a 40000 (recordar que el salario de la BD es mensual).
select employee_id, last_name, from employees where (salary * 12) > 40000;
--3.- Listar id y salario, incrementado en un 10%, de los empleados que ganen menos de 100000 euros al año.
select employee_id, salary from employees
--4.- Muestra el número de empleados que ganan más de 1400
select  count(employee_id) from employees where salary > 1400;
--5.- Muestra los apellidos y oficio de los empleados, ordenados por salario.
select last_name, job_id from employees order by salary asc;
--6.-Muestra el gasto de personal total de la empresa, sumando salarios y comisiones.
select sum(salary + commission_pct) from employees;
--7.-Muestra los apellidos de los empleados y su salario (ordenado por el salario) con el siguiente formato:
--apellido1........ salario1
--apellidon.........salarion
select rpad(last_name, 12, '.'), salary from employees order by salary asc;
--8.-Muestra el número de trienios completos de cada empleado.
select first_name, trunc(months_between(sysdate, hire_date)/36) as trienios from employees;
--9.- Muestra el total de dinero ganado por el empleado desde que se incorporó a la empresa suponiendo que el salario no ha cambiado en todo ese tiempo.
select first_name, salary*(trunc(months_between(sysdate, hire_date))) from employees;
--10.- Muestra con dos decimales el salario diario de cada trabajador suponiendo que los meses tienen 30 días.
select first_name, round(salary/30,2) from employees;
--11.- Muestra los empleados que tengan en su apellido al menos dos letras 'a'.
select first_name, last_name from employees where instr(last_name,'a', 1, 2)<>0;
--12.- Muestra los datos de los empleados cuyo apellido tenga mas de cinco letras.
select first_name from employees where last_name in (select last_name from employees where length(first_name)>5);
--13.- Muestra un mensaje de saludo a cada empleado con el formato 'Hola apellido_empleado'.
select concat('Hola ', last_name) from employees;
--14.- Muestra el apellido de cada empleado junto con el nombre del mes en el que entró en la empresa.
select last_name, to_char(hire_date, 'MONTH') from employees;
--15.- Muestra el apellido del primer empleado por orden alfabético.
select min(last_name) from employees;
--16.-. Muestra el número de directores que hay en la empresa.
select count(distinct(manager_id))from employees;
--17.- Muestra los empleados que llevan más de 6 años en la empresa.
select first_name from employees where months_between(sysdate,hire_date)>72;
--18.- Muestra los empleados que fueron dados de alta entre el 01/03/1988 y el 30/06/1989.
select ename
from emp
where hiredate>to_date(’01/03/1988′,’dd/mm/yyyy’) and hiredate<to_date('30 06="" 1989)