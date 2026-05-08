--Day 39 : Triggers 
--1. Before insert trigger : 

CREATE OR REPLACE FUNCTION before_slary_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF NEW.salary < 0 THEN
         NEW.salary:=0; 
    END IF;

    RETURN NEW;

END;
$$;

create trigger before_slary_insert_trigger
before insert
on cleaned_salaries
for each row 
execute function before_slary_insert();

insert into cleaned_salaries (salary_id,emp_id,salary,salary_date ) values (501,901,-100,'2025-01-01');

select * from cleaned_salaries where emp_id='901';

--2.  after update trigger 

create table new_log_salary (emp_id int,salary int,old_salary int,new_salary int);

CREATE OR REPLACE FUNCTION salarty_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO new_log_salary(
        emp_id,
        old_salary,
        new_salary
    )
    VALUES (
        old.emp_id,
		old.salary,
        new.salary 
    );

    RETURN NEW;

END;
$$;


create trigger salary_update_trigger
after update 
on cleaned_salaries
for each row 
execute function salarty_update();


update cleaned_salaries set salary='70000' where emp_id='463';

select * from new_log_salary;