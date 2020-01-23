--- ========================================================================
--- Question:
/*Write and Implement PL/SQL code to display customer name and address of a given
customer from customer table. If the customer Id is not present in the table, it should throw an
exception (‘no such customer’).*/
--- ========================================================================

--- Create A Table
create table customer(
customer_id number,
customer_name varchar(50),
address varchar(50)
);

---Inserting values using "INSERT ALLL"
INSERT ALL
INTO customer(customer_id, customer_name, address) VALUES(2,'Vani Sharma','S-402 Pune')
INTO customer(customer_id, customer_name, address) VALUES(3,'Vani Juneja','S-403 Pune')
INTO customer(customer_id, customer_name, address) VALUES(4,'Meghna Joshi','S-404 Pune')
INTO customer(customer_id, customer_name, address) VALUES(5,'Naman Shamra','S-405 Pune')
INTO customer(customer_id, customer_name, address) VALUES(6,'Jpyleen Sharma','S-406 Pune')
SELECT *from dual;


---Inserting value using "INSERT INTO"
INSERT INTO customer(customer_id, customer_name, address) VALUES(1,'BShreya_Sharma','S-401 Pune')

---Logic of Code
DECLARE
id_n number;
customer_rec customer%rowtype;
BEGIN
id_n :=3;

SELECT * into customer_rec FROM customer WHERE customer_id = id_n;

dbms_output.put_line('Customer id: '||customer_rec.customer_id|| ' ,Name : '||customer_rec.customer_name||' ,Address: '||customer_rec.address);

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 

END;
