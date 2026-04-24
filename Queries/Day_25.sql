
-- Day 25 
--1. Salary Running total (cumulative slary for each employee over a time )


select 
	ce.emp_id,
	ce.emp_name,
	cs.salary as current_slary,
	COALESCE(sum(cs.salary) over (partition by ce.emp_id order by cs.salary_date rows between unbounded preceding and current row),0) as running_salary
from cleaned_employees ce 
join cleaned_salaries cs 
	on ce.emp_id=cs.emp_id;


--2.  attendence running total (find total atteendence count over the time )


select 
	ce.emp_id ,ce.emp_name ,ca.attendance_date,
	count(ca.attendance_id) over (partition by ce.emp_id order by ca.attendance_date) as running_total_attendance 
from cleaned_employees ce 
join cleaned_attendance ca
	on ce.emp_id =ca.emp_id ;