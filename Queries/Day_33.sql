

--Day 33 : advance View query 
--1. updat emp data using view 
 --- create view and update view data

create view emp_basic as
select emp_id, emp_name,city from cleaned_employees;
select * from emp_basic;

-- update city to Mumbai of emp whos id is 110
select * from emp_basic where emp_id=110;
update emp_basic set city='Mumbai' where emp_id=110;

--2 . create view for high salary for employee
   --  if salary > 50k
   --- use thios view to fecth all the details  of emp

create view highest_sal_view as 
select 
	ce.emp_id,
	ce.emp_name,
	cs.salary
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id=cs.emp_id where cs.salary>50000

select * from highest_sal_view;


--3 . Work on multi table view 
-- compibe emp , dept,slary data

create view emp_dept_sal_view as
select 
	ce.emp_id ,ce.emp_name ,cd.dept_name ,cs.salary
from cleaned_employees ce 
join cleaned_departments cd 
	on ce.dept_id  =cd.dept_id 
join cleaned_salaries cs 
	on ce.emp_id=cs.emp_id ;

select * from emp_dept_sal_view;

-- 4  , get high slary emp data with dept_names
create view hr_dashboard AS
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_name,
	cs.salary
from cleaned_employees  ce
join cleaned_salaries cs
	on ce.emp_id=cs.emp_id
join cleaned_departments  cd
	on ce.dept_id=cd.dept_id
where cs.salary>50000;

select * from hr_dashboard;

