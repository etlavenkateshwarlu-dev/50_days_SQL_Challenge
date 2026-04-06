-- DAY 7 -------------------------
--For select * from cleaned_employees;
--Find the invalid month like remove the moth whihc is > 12 and teh date whihc is >31
update cleaned_employees set hire_date=null 
where cast(split_part(hire_date,'-',2) as integer) >12;

-- Change date formate DD-MM-YYYY to YYYY-MM-DD (ex 27-05-2021  to 2021-01-27)
update cleaned_employees set hire_date=concat(split_part(hire_date,'-',3),'-',split_part(hire_date,'-',2),'-',split_part(hire_date,'-',1))
 where hire_date like '__-__-____';

-- remove invalid date where teh dta eis > 31 
update cleaned_employees set hire_date=null
where cast(split_part(hire_date,'-',3) as integer) >31

---change data type for hire_date
ALTER TABLE cleaned_employees
ALTER COLUMN hire_date TYPE DATE
USING TO_DATE(hire_date, 'YYYY-MM-DD');


-- For cleaned_salaries table
-- Change date formate DD-MM-YYYY to YYYY-MM-DD (ex 27-05-2021  to 2021-01-27)
update cleaned_salaries set salary_date=concat(split_part(salary_date,'-',3),'-',split_part(salary_date,'-',2),'-',split_part(salary_date,'-',1))
 where salary_date like '__-__-____';

-- remove invalid date where teh dta eis > 31 
update cleaned_salaries set salary_date=null
where cast(split_part(salary_date,'-',3) as integer) >31

update  cleaned_salaries set salary_date=null 
where cast(split_part(salary_date,'-',2) as integer) >12;
-- where -change data type for hire_date
ALTER TABLE cleaned_salaries
ALTER COLUMN salary_date TYPE DATE
USING TO_DATE(salary_date, 'YYYY-MM-DD');


-- For cleaned_attendance table
select * from cleaned_attendance;

-- Change date formate DD-MM-YYYY to YYYY-MM-DD (ex 27-05-2021  to 2021-01-27)
update cleaned_attendance set attendance_date=concat(split_part(attendance_date,'-',3),'-',split_part(attendance_date,'-',2),'-',split_part(attendance_date,'-',1))
 where attendance_date like '__-__-____';

-- remove invalid date where teh dta eis > 31 
update cleaned_attendance set attendance_date=null
where cast(split_part(attendance_date,'-',3) as integer) >31

update  cleaned_attendance set attendance_date=null 
where cast(split_part(attendance_date,'-',2) as integer) >12;
-- where -change data type for hire_date
ALTER TABLE cleaned_attendance
ALTER COLUMN attendance_date TYPE DATE
USING TO_DATE(attendance_date, 'YYYY-MM-DD');
