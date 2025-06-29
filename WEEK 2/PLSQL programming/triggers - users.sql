-- triggers 

set serveroutput on;

create table employees (
    id number primary key,
    name varchar2(100),
    createdAt date
);

-- example 1 : before update trigger 

create or replace trigger set_created_at
    before insert on employees
    for each row
    begin
        :New.createdAt := sysdate;
    end;
/

INSERT INTO employees (id, name)
VALUES (1, 'Varun');

-- example 2 : after update trigger 

create table employees_audit (
    empId number,
    oldName varchar2(100),
    newName varchar2(100),
    changedOn date
);

create or replace trigger log_employee_updates 
    after update on employees
    for each row
    begin 
        insert into employees_audit (empId, oldName, newName, changedOn)
        values(:old.id, :old.name, :new.name, sysdate);
    end;
/

UPDATE employees
SET name = 'Varun Kumar'
WHERE id = 1;

SELECT * FROM employees_audit;

-- example 3 - statement level trigger

create or replace trigger before_delete_employee
    before delete on employees
    begin
        dbms_output.put_line('a delete operation is about to happend !');
    end;
/

DELETE FROM employees WHERE id = 1;


