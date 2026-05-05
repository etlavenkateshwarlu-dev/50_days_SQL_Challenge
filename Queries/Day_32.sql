--Day 32: Views : 
--1. create emp view( emp_id,emp_name,dept_id)
create view emp_view as 
select emp_id,emp_name,dept_id,city from cleaned_employees ce ;

--2. select * form emp_view where city=Mumbai
select * from emp_view;

--3. Create salary view 
create view salary_view as
select emp_id,salary,salary_date from cleaned_salaries cs ;
select * from salary_view where emp_id=444;

--4 . creta ejoined view 
-- emp_sal_view (emp_id,emp_name,dept_id,salary ,salary_date)

create view emp_sal_view as 
select
	ce.emp_id,
	ce.emp_name,
	ce.dept_id,
	cs.salary,
	cs.salary_date
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id;
 --use above view for finding data where salary >50k
select * from emp_sal_view where salary>50000;