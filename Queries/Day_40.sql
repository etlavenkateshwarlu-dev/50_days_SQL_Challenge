
--Day 40 : tem table 
--1. create temp table for employe salary summery 
	create temporary table emp_sal_temp (emp_id int ,total_sal int);
--2 insert data into temp table 

insert into emp_sal_temp (emp_id,total_sal)
select 
	emp_id,
	sum(salary)
from cleaned_salaries ce 
group by emp_id;

select * from emp_sal_temp;

--3. join this temp table with emp_table

select 
	ce.emp_id ,
	ce.emp_name,
	t.total_sal
from cleaned_employees ce 
join emp_sal_temp t
	on ce.emp_id=t.emp_id;


--4 . Drop temp table
drop  table emp_sal_temp;
