-- Day 28
--1. FInd top 2 highest paid  employes for each department 
select * from (
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_name,
	cs.salary,
	dense_rank() over (partition by cd.dept_id order by cs.salary desc) salary_rank	
from cleaned_employees ce
join cleaned_departments cd
	on ce.dept_id=cd.dept_id
join cleaned_salaries cs
	on ce.emp_id=cs.emp_id)t where salary_rank <=2;


--2. Find the slary gap (diff between current slary and previous slary )

select
	ce.emp_id ,
	ce.emp_name ,
	cs.salary_date ,
	cs.salary  as current_salary,
	coalesce(lag(cs.salary) over (partition by ce.emp_id order by cs.salary_date ),0) as previous_slary,
	cs.salary -coalesce(lag(cs.salary) over (partition by ce.emp_id order by cs.salary_date ),0) as salary_gap
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ;

-- 3 find performance gap ( chnage in performance between years )

select 
	ce.emp_id ,
	ce.emp_name ,
	cp.rating_2022-cp.rating_2023 as first_rating,
	cp.rating_2023-cp.rating_2024 as secound_rating
from cleaned_employees ce 
join cleaned_performance cp 
	on ce.emp_id =cp.emp_id ;


--4. rank filtering (top performence base don thair slary)

select * from (
select 
	ce.emp_id ,
	ce.emp_name ,
	cs.salary ,
	rank() over (partition by ce.emp_id  order by cs.salary desc) rank_based_on_salry
from cleaned_employees ce   
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ) t where rank_based_on_salry=1;