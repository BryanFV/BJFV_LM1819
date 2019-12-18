-----1-----

create or replace PROCEDURE p_salario
AS
v_emp employees%rowtype;
v_job jobs%rowtype;
CURSOR c_salary IS
SELECT sum(salary),job_id
FROM employees GROUP BY job_id;
BEGIN
FETCH c_salary INTO v_emp.salary,v_emp.job_id;
WHILE c_salary%FOUND LOOP
IF v_emp.salary > 6000 AND v_emp.salary < 20000 THEN
SELECT job_title INTO v_job.job_title FROM jobs WHERE job_id LIKE v_emp.job_id;
dbms_output.put_line('La suma de los trabajadores del trabajo' || v_job.job_title || ' es de ' ||
v_emp.salary ||' euros.');
END iF;
FETCH c_salary INTO v_emp.salary,v_emp.job_id;
END LOOP;
CLOSE c_salary;
END P_SUM_SALARY;

create or replace PROCEDURE SUMA_SUELDO AS
CURSOR c_emple IS
SELECT sum(e.salary),d.department_name
FROM employees e inner join departments d
ON e.department_id=d.department_id
group by d.department_name;
v_empleado employees%rowtype;
v_depart departments%rowtype;
BEGIN
OPEN c_emple;
FETCH c_emple into v_empleado.salary,v_depart.department_name;
WHILE c_emple%FOUND and v_empleado.salary >7000 and v_empleado.salary<100000 LOOP
DBMS_OUTPUT.PUT_LINE( 'la suma del departamento'||v_depart.department_name||' es de' ||
v_empleado.salary);
DBMS_OUTPUT.PUT_LINE( '...............................................................................');
FETCH c_emple into v_empleado.salary,v_depart.department_name;
END LOOP;
CLOSE c_emple;
END SUMA_SUELDO;

---2----
CREATE OR REPLACE TRIGGER EXTRI1 
BEFORE DELETE OR UPDATE ON JOBS
FOR EACH ROW
DECLARE e_job EXCEPTION;
v_emps number;
BEGIN
  SELECT count(employee_id) into v_emps FROM employees WHERE job_id LIKE :old.job_id;
  if v_emps is not null then
  raise e_job;
  end if;
  exception
  when e_job then 
  raise_application_error(-20000, 'El trabajo tiene asociado'||v_emps|| ' empleado.');

END EXTRI1;

----3-----




