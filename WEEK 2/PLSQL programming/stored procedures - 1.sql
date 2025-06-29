-- Stored procedures - 1 

/*
Scenario 1: The bank needs to process monthly interest for all savings accounts.
Question: Write a stored procedure ProcessMonthlyInterest that calculates and updates the balance
of all savings accounts by applying an interest rate of 1% to the current balance.
*/
set serveroutput on;

CREATE OR REPLACE PROCEDURE processmonthlyinterest IS
BEGIN
    UPDATE accounts
    SET
        balance = balance + ( balance * 0.01 ),
        lastmodified = sysdate
    WHERE
        accounttype = 'Savings';

    COMMIT;
END;
/

BEGIN
    processmonthlyinterest;
END;
/

SELECT
    *
FROM
    accounts;