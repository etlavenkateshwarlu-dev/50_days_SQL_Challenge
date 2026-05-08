--Day 38 : Trigger
--1. Create before update trigger (prevent negative salary)


CREATE OR REPLACE FUNCTION validate_salary()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF NEW.salary < 0 THEN
         NEW.salary:=OLD.salary; 
    END IF;

    RETURN NEW;

END;
$$;

create trigger prevent_negative_salary 
before update 
on cleaned_salaries
for each row
EXECUTE FUNCTION validate_salary();

select * from cleaned_salaries where emp_id='164';
update cleaned_salaries set salary='-100' where  emp_id='164';

---2 after insert trigger (attendence login)

create table attendance_logs (emp_id int ,attendance_date date ,message varchar(100));

select * from attendance_logs;

CREATE OR REPLACE FUNCTION attendance_logs()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO attendance_logs(
        emp_id,
        attendance_date,
        message
    )
    VALUES (
        NEW.emp_id,
		CURRENT_TIMESTAMP,
        TG_OP
        
    );

    RETURN NEW;

END;
$$;


create trigger attendance_insert_logs
after insert 
on cleaned_attendance
for each row 
EXECUTE FUNCTION attendance_logs();

insert into cleaned_attendance values (202601,101,'2026-08-06','WFH');

select * from attendance_logs;