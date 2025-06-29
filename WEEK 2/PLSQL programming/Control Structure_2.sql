--Alter table customers
--add isVIP varchar(5);


BEGIN
    FOR cust IN (
        SELECT
            customerid,
            balance
        FROM
            customers
    ) LOOP
        IF cust.balance > 10000 THEN
            UPDATE customers
            SET
                isvip = 'True'
            WHERE
                customerid = cust.customerid;

            dbms_output.put_line('VIP assigned to customerId: ' || cust.customerid);
        END IF;
    END LOOP;

    COMMIT;
END;