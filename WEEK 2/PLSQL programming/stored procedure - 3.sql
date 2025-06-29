-- Stored procedure 3 
/*
Scenario 3: Customers should be able to transfer funds between their accounts.
Question: Write a stored procedure TransferFunds that transfers a specified amount from 
one account to another, checking that the source account has sufficient balance before making the transfer.
*/

SELECT
    *
FROM
    accounts;

set serveroutput on;

CREATE OR REPLACE PROCEDURE transferfunds (
    p_sourceaccountid NUMBER,
    p_targetaccountid NUMBER,
    p_amount          NUMBER
) IS
    v_sourcebalance NUMBER;
BEGIN
    SELECT
        balance
    INTO v_sourcebalance
    FROM
        accounts
    WHERE
        accountid = p_sourceaccountid;

    IF v_sourcebalance < p_amount THEN
        raise_application_error(-20001, 'Insufficient balance in source account');
    END IF;
    UPDATE accounts
    SET
        balance = balance - p_amount
    WHERE
        accountid = p_sourceaccountid;

    UPDATE accounts
    SET
        balance = balance + p_amount
    WHERE
        accountid = p_targetaccountid;

    COMMIT;
    dbms_output.put_line('transfer of amount '
                         || p_amount
                         || 'from '
                         || p_sourceaccountid
                         || 'to '
                         || p_targetaccountid
                         || 'is successfully completed');

EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20002, 'One or both account IDs not found');
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20003, 'error in transaction');
END;
/

BEGIN
    transferfunds(2, 1, 100);
END;
/

SELECT
    *
FROM
    accounts;