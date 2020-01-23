--- =======================================================================================================
--- Question:
/*
Write and Implement PL/SQL code to display first name and last name of student whose marks are greater than 200.
When multiple records are selected, it should throw an exception (TOO_MANY_ROWS).
*/
--- =======================================================================================================

--- Create Table
create table student(
first_name varchar(25),
last_name varchar(25),
marks varchar(3)
);

--- insert data using "INSERT ALL"
INSERT ALL
INTO student(first_name, last_name, marks) VALUES('Shreya','Sharma','150')
INTO student(first_name, last_name, marks) VALUES('BShreya','Sharma','120')
INTO student(first_name, last_name, marks) VALUES('Random','Sharma','250')
INTO student(first_name, last_name, marks) VALUES('Joyleen','Sharma','150')
INTO student(first_name, last_name, marks) VALUES('Shreya','Kulkarni','75')
SELECT *from dual;

--- insert data using "INSERT INTO"

INSERT INTO student(first_name, last_name, marks) VALUES('BShreya','Kulkarni','175')

--- Code Logic
DECLARE
student_rec student%rowtype;
BEGIN
SELECT * into student_rec from student WHERE marks > 200;
dbms_output.put_line(student_rec.first_name||' '||student_rec.last_name);
EXCEPTION
WHEN TOO_MANY_ROWS THEN
dbms_output.put_line('Too many values in row type');
END;
