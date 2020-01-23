--- ====================================================================================================
--- Question:
/*
Write and Implement PL/SQL code to display customer name and address of a given customer from customer table.
When customer id is less than or equal to zero, it should throw user defined exception (‘Id must be greater than 0’).
*/
--- ====================================================================================================

--- Table Creation
create table customer(
customer_id number,
customer_name varchar(50),
address varchar(50)
);

--- insert data using "INSERT INTO"
INSERT INTO customer(customer_id, customer_name, address) VALUES(1,'BShreya_Sharma','S-401 Pune')

--- insert data using "INSERT ALL"
INSERT ALL
INTO customer(customer_id, customer_name, address) VALUES(2,'Vani Sharma','S-402 Pune')
INTO customer(customer_id, customer_name, address) VALUES(3,'Vani Juneja','S-403 Pune')
INTO customer(customer_id, customer_name, address) VALUES(4,'Meghna Joshi','S-404 Pune')
INTO customer(customer_id, customer_name, address) VALUES(5,'Naman Shamra','S-405 Pune')
INTO customer(customer_id, customer_name, address) VALUES(6,'Jpyleen Sharma','S-406 Pune')
SELECT *from dual;

--- Code Logic for user defined exception

DECLARE
id_n number;
invalid_id exception;
customer_rec customer%rowtype;
BEGIN
id_n :=0;

IF (id_n<=0) THEN
raise invalid_id;
END IF;

SELECT * into customer_rec FROM customer WHERE customer_id = id_n;

dbms_output.put_line('Customer id: '||customer_rec.customer_id|| ' ,Name : '||customer_rec.customer_name||' ,Address: '||customer_rec.address);
EXCEPTION 
WHEN invalid_id THEN
dbms_output.put_line('Id must be greater than 0');
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 

END;
