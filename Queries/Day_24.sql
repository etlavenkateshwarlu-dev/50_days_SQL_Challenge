
-- Day 24 
--1. Compare employee current salry and next salary based on date 

select 
	ce.emp_id ,
	ce.emp_name,
	cs.salary_date ,
	cs.salary as current_salary,
	lead(cs.salary) over (partition by ce.emp_id order by cs.salary_date) as next_salary
from cleaned_employees ce
join cleaned_salaries cs
	on ce.emp_id=cs.emp_id;

--2 . Grouth analasys (compare our current salary with next slaary )

select 
	ce.emp_id ,
	ce.emp_name,
	cs.salary_date ,
	cs.salary as current_salary,
	lead(cs.salary) over (partition by ce.emp_id order by cs.salary_date) as next_salary,
	case 
		when cs.salary-coalesce(lead(cs.salary) over (partition by ce.emp_id order by cs.salary_date),0) <=0 then 'No Grouth'
		when cs.salary-coalesce(lead(cs.salary) over (partition by ce.emp_id order by cs.salary_date),0) =cs.salary then 'No Grouth'
		when cs.salary-coalesce(lead(cs.salary) over (partition by ce.emp_id order by cs.salary_date),0) >0 then 'Grouth'
	end as grouth_no_grouth
from cleaned_employees ce
join cleaned_salaries cs
	on ce.emp_id=cs.emp_id;

--3 . attendence Trend predict (today vs next day) 

select
	ce.emp_id,
	ce.emp_name, 
	ca.attendance_date,
	ca.status as current_status,
	lead(ca.status) over(partition by ce.emp_id order by ca.attendance_date) as next_status
from cleaned_employees ce 
join  cleaned_attendance ca
	on ce.emp_id=ca.emp_id;
	