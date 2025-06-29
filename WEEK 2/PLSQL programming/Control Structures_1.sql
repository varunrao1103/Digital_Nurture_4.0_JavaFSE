declare 
    cursor senior_cursor is
        select c.customerId
        from customers c
        where months_between(sysdate, c.dob)/12 > 60 ;
begin
    for cust in senior_cursor loop
        update loans
        set INTERESTRATE = INTERESTRATE - 1
        where customerId = cust.customerId;
        dbms_output.put_line('applied discount for customer id: ' || cust.customerId);
    end loop;
    commit;
end;