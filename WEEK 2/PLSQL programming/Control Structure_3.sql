--INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
--VALUES (2, 2, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 1));

BEGIN
    FOR loan_rec IN (
        SELECT
            l.loanid,
            l.customerid,
            l.enddate,
            c.name
        FROM
                 loans l
            JOIN customers c ON l.customerid = c.customerid
        WHERE
            l.enddate BETWEEN sysdate AND sysdate + 61
    ) LOOP
        dbms_output.put_line('reminder - Loan Id: '
                             || loan_rec.loanid
                             || ' of customer : '
                             || loan_rec.name
                             || ' is due on '
                             || to_char(loan_rec.enddate, 'DD-MM-YYYY'));
    END LOOP;
END;