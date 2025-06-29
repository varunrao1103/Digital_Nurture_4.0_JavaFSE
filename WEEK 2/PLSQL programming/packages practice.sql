set serveroutput on

create or replace PACKAGE customer_pkg AS 
    -- function to get age 
    FUNCTION get_age (
        p_customerid NUMBER
    ) RETURN NUMBER;

    -- procedure to update balance
    PROCEDURE update_balance (
        p_customerid NUMBER,
        p_newbalance NUMBER
    );
        
end customer_pkg;
/

create or replace package body customer_pkg as 
    
    function get_age(p_customerId number) return number is 
        vDob date;
        vAge number;
    begin
        select dob into vDob from customers where customerId = p_customerId;
        vAge := trunc(months_between(sysdate, vDob)/ 12);
        return vAge;
    end;
    
    procedure update_balance(p_customerId number, p_newBalance number)  is
    begin
        update customers
        set balance = p_newBalance
        where customerId = p_customerId;
        
        dbms_output.put_line('balance updated');
    end;
end customer_pkg;
/


-- call the function 
declare
    vAge Number;
begin 
    vAge := customer_pkg.get_age(1);
    dbms_output.put_line('Age is: ' || vAge);
end;
/

-- call the procedure 
begin 
    customer_pkg.update_balance(1,7000);
end;
/