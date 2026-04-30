

-- Day 31  : nested CTE
--1 . Finding teh employees whos total slary >100000

with toatal_sal_cte as(
select 
	ce.emp_id,
	sum(cs.salary) total_sal
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
group by ce.emp_id 
),
emp_cte as  (
select * from toatal_sal_cte where total_sal>100000
)
select * from emp_cte;

---2 . show emp slary along with dept avg slary 

with dept_avg_slary as (
select 
	ce.dept_id,
	avg(cs.salary) dept_wise_avg_sal
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
group by ce.dept_id 
)
select 
	ce.emp_id,
	ce.emp_name,
	cs.salary as emp_salary,
	ds.dept_wise_avg_sal as department_wise_toatal_slary
from cleaned_employees ce 
join cleaned_salaries cs
	on ce.emp_id  =cs.emp_id 
join dept_avg_slary ds
	on ce.dept_id =ds.dept_id;


---3 . find the dpertment with hiest slary 
      --  a. toatl salary per department b.maximum slary 


with dept_total_salary as (
select 
	ce.dept_id,
	sum(cs.salary) total_sal_dept
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id
group by ce.dept_id 
)
select * from dept_total_salary where total_sal_dept=(select max(total_sal_dept) from  dept_total_salary);

