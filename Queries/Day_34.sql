
-- Day 34 : Create index 
--1. Index on emp_id

create index index_emp_id
on cleaned_employees(emp_id);

select 
	* 
from cleaned_employees ce
where  ce.emp_id =101;

--2 .create index on dept_id
create index index_dept_id
on cleaned_employees(dept_id);

--3. compoiste index (emp_id,slary_date)
create index index_emp_salary_date
on cleaned_salaries(emp_id,salary_date);

select
	*
from cleaned_salaries cs 
where cs.emp_id =101 and cs.salary_date ='2024-01-01';


