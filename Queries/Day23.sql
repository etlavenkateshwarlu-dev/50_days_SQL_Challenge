-- Day 23 
--1.Find out current salary along with previous salary 

select  
	ce.emp_id,
	ce.emp_name,
	cs.salary_date ,
	cs.salary as current_slaary,
	lag(cs.salary) over (partition by ce.emp_id order by salary_date asc) as previous_salary
from cleaned_employees as ce
join cleaned_salaries as cs
	on ce.emp_id=cs.emp_id;

--2 . Differnece between current salary and previous salary 

select  
	ce.emp_id,
	ce.emp_name,
	cs.salary_date ,
	cs.salary as current_slaary,
	lag(cs.salary) over (partition by ce.emp_id order by salary_date asc) as previous_salary,
	cs.salary -lag(cs.salary) over (partition by ce.emp_id order by salary_date asc) as salary_diff
from cleaned_employees as ce
join cleaned_salaries as cs
	on ce.emp_id=cs.emp_id;

-- 3 . Attendence trend (check if attendence improved or decline )


select * from cleaned_attendance;
Absent
WFH
Present

with emp_score_based_on_status_cte as(
select 
	emp_id,
	attendance_date ,
	status,
	case when status in ('Present','WFH') then 1
		 when status in ('Absent') then 0
	end as attendenct_score
from cleaned_attendance),
emp_attendence_trend_cte as(
select 
	e.emp_id,
	e.attendance_date,
	e.attendenct_score as cuurent_score,
	lag(e.attendenct_score) over (partition by e.emp_id order by e.attendance_date ) as previous_score
from emp_score_based_on_status_cte as e
)
select 
      emp_id,
      attendance_date,
      case
	    when previous_score is null then 'First Record'
      	when cuurent_score > previous_score then 'Immproved'
      	when cuurent_score < previous_score then 'Declined'
      	else 'NO change'
      end as emp_final_attendence_trend
from emp_attendence_trend_cte order by emp_id , attendance_date;





