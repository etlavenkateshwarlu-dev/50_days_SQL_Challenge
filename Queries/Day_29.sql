--Day 29 
--1. Find the latest salry per employee along with total salary till that point 
-- March ,April ,May ,june 

select * from (
select 
	ce.emp_id,
	ce.emp_name,
	cs.salary,
	cs.salary_date,
	rank() over ( partition by ce.emp_id order by salary_date desc ) as latest_slary_rank,
	sum(cs.salary) over (partition by ce.emp_id order by salary_date asc) as running_total
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id) t where latest_slary_rank=1;

---2 . Rank an employe based one salary and compare with department avergae 

select 
	ce.emp_id,
	ce.emp_name,
	ce.dept_id,
	avg(cs.salary) over (partition by ce.dept_id ) as dept_wise_avg_salary,
	rank() over (partition by ce.dept_id order by cs.salary desc) as rank
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id ;

-- 3 check if slary is incresed or decresed compar with previous salary 

select 
	ce.emp_id,
	ce.emp_name,
	cs.salary_date ,
	cs.salary as current_salary,
	lag(cs.salary) over (partition by ce.emp_id order by cs.salary_date ) as previous_salary,
	case
		when cs.salary >lag(cs.salary) over (partition by ce.emp_id order by cs.salary_date ) then 'Increased'
		when cs.salary <lag(cs.salary) over (partition by ce.emp_id order by cs.salary_date ) then 'Decreased'
		else 'Equal'
	end as salary_trend
from cleaned_employees ce
join cleaned_salaries cs
on ce.emp_id=cs.emp_id ;

