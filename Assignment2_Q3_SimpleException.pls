--- =========================================================================================================
--- Question:
/*
Write and Implement PL/SQL code to find Length when Area and breadth of a Rectangle is given.
If breadth is zero, it should throw an exception (zero_divide).
*/
--- =========================================================================================================

DECLARE
area number;
breadth number;
length number;
invalid_id exception;
customer_rec customer%rowtype;
BEGIN
area := 25;
breadth := 10;
length := (2*area)/breadth;
dbms_output.put_line('Length of rectangle : '||length);
EXCEPTION 
WHEN zero_divide THEN
dbms_output.put_line('breadth should not be zero');
END;
