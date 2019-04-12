--1)Muestra el nombre y apellido de los empleados  y su departamento, que su trabajo tenga un max-salary mayor o igual a 5000 y su min_salary sea menos o igual a 3000.
SELECT DISTINCT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
INNER JOIN JOBS J
ON J.JOB_ID = E.JOB_ID AND J.MAX_SALARY >= 5000 AND J.MIN_SALARY <= 3000;
...........
select DISTINCT e.first_name, e.last_name d.deparment_name from deparments d 
inner join EMPLOYEES e on d.deparment_id = e.deparment_id inner join jobs j
on j.job_id = e.job_id and j.max_salary >= 5000 and j.min_salary

--2)Muestra los departamentos de Americas o Europe, que el nombre del departamento tenga una I.
SELECT D.*, R.* FROM DEPARTMENTS D 
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
INNER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID
JOIN REGIONS R
ON REGION_NAME LIKE 'Americas' OR REGION_NAME LIKE 'Europe'
WHERE D.DEPARTMENT_NAME LIKE '%i%';
...............
select d.*, r.* from deparments d inner join locations l
 on d.location_id = l.location_id
inner join countries c on l.country_id = c.country_id
join regions r on region_name like 'Americas' or region_name like 'Europe'
 where d.deparment_name like '%I%';
...................................................................................................................................................
--3)Muestra los países y el número de departamentos que hay en estos paises siempre que tenga dos o más departamentos.
SELECT C.COUNTRY_NAME, D.DEPARTMENT_NAME
FROM COUNTRIES C INNER JOIN LOCATIONS L
ON C.COUNTRY_ID = L.COUNTRY_ID
INNER JOIN DEPARTMENTS D
ON L.LOCATION_ID = D.LOCATION_ID

...................................................................................................................................................

select c.country_name d.deparment_name
from countries c INNER join locations l 
on c.country_id = l.country_id
inner join deparments d 
on l.location_id = d-location_id

--4)Muestra el nombre y apellido del empleado y su departamento que tenga la máxima comisión de su departamento.
SELECT DISTINCT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.COMMISSION_PCT = (SELECT MAX(COMMISSION_PCT) FROM EMPLOYEES)

...................................................................................................................................................
select DISTINCT e.first_name, e.last_name, d.deparment_name from employees e
inner join departments d on e.deparment_id = d.deparment_id
where e.commission_pct = (select max(commission_pct)from employees);


--5)Muestra el nombre y el apellido y el pais del empleado que tenga el sueldo mínimo de la empresa(De todos los empleados).
SELECT DISTINCT E.FIRST_NAME, E.LAST_NAME, C.COUNTRY_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
RIGHT JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID
WHERE E.SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);
...................................................................................................................................................
--6)Muestra los nombres de departamento que su sueldo mínimo supere el sueldo medio del departamento 80.
SELECT DISTINCT D.DEPARTMENT_NAME FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
INNER JOIN JOBS J
ON J.JOB_ID = E.JOB_ID
WHERE J.MIN_SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80)
