-- Stored procedure - 2

/*
Scenario 2: The bank wants to implement a bonus scheme for employees based on their performance.
Question: Write a stored procedure UpdateEmployeeBonus that updates the salary of employees in a 
given department by adding a bonus percentage passed as a parameter.
*/

SELECT
    *
FROM
    employees;

set serveroutput on;

CREATE OR REPLACE PROCEDURE updateemployeebonus (
    p_department      VARCHAR2,
    p_bonuspercentage NUMBER
) IS
BEGIN
    FOR emp IN (
        SELECT
            employeeid,
            name,
            salary
        FROM
            employees
        WHERE
            department = p_department
    ) LOOP
        UPDATE employees
        SET
            salary = emp.salary + ( emp.salary * ( p_bonuspercentage / 100 ) )
        WHERE
            employeeid = emp.employeeid;

        dbms_output.put_line('updated salary of employee : ' || emp.name);
    END LOOP;

    COMMIT;

END;
/

set serveroutput on;

BEGIN
    updateemployeebonus('CEO', 10);
END;
/

SELECT
    *
FROM
    employees;