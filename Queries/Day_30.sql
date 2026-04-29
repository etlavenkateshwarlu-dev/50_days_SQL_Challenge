--Day 29 : use of cte 
-- 1 .Create temp table 

with slary_cte as (
select * from 
cleaned_salaries
)
select * from slary_cte where emp_id='62';


--2 . comnile emp table and salary table using CTE

with emp_sal_cte as (
select ce.emp_id,
	ce.dept_id,
	cs.salary
from cleaned_employees ce 
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
)
select * from  emp_sal_cte;

-- 3 how to comibine the cte with aggregate function 

with dept_avg as (
select  ce.dept_id ,
		avg(cs.salary )
from cleaned_employees ce 
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
group by ce.dept_id 
)
select * from dept_avg;

--- CTE with filternation : fin the employees salary more than depat avg 

with dept_avg as (
select  ce.dept_id ,
		avg(cs.salary ) as dept_avg_sal
from cleaned_employees ce 
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
group by ce.dept_id 
)
select 
	ce.emp_id ,
	ce.emp_name ,
	cs.salary ,
	da.dept_avg_sal 
from cleaned_employees ce 
join cleaned_salaries cs
	on ce.emp_id=cs.emp_id
join dept_avg da
	on ce.dept_id =da.dept_id 
where cs.salary  > da.dept_avg_sal ;