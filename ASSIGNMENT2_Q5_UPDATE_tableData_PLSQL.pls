--- ======================================================================================================
--- Question:
/*
Write and Implement PL/SQL code to raise the salary of a given employee (empid) by 10 %.If no data found it should throw exception (NO_Data_found).
If the salary is null , it will raise_application_error(-20101, &#39;Salary is missing&#39;).
*/
--- ======================================================================================================

--- Create Table
CREATE TABLE employee(
empid number,
name varchar(50),
salary varchar(3) NULL
);

--- insert data using "INSERT ALL"
INSERT ALL
INTO employee(empid, name, salary) VALUES(1,'Abhi',100)
INTO employee(empid, name, salary) VALUES(2,'Bbhi',200)
INTO employee(empid, name, salary) VALUES(3,'Cbhi',300)
INTO employee(empid, name, salary) VALUES(4,'Dbhi','')
SELECT *FROM dual;

--- Logic Code

DECLARE
employee_rec employee%rowtype;
missing_salary exception;
salary varchar(3);
id_n number;
BEGIN

id_n:=1;

select * into employee_rec from employee where empid = id_n;

IF employee_rec.salary is null THEN
raise missing_salary
END IF;

dbms_output.put_line('Employee with empid '||id_n||' current salary is '||employee_rec.salary);

UPDATE employee
SET salary=salary+(10/100)*salary
WHERE empid = id_n;

select * into employee_rec from employee where empid = id_n;
dbms_output.put_line('Employee with empid '||id_n||' new salary is '||employee_rec.salary);
EXCEPTION
WHEN missing_salary THEN
dbms_output.put_line('Salary information is missing');
WHEN no_data_found THEN
dbms_output.put_line('No employee with given employee id');
END;
