
-- Day 26 
--1. FInd the rank of employees with in each department based on salary 
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_id ,
	cd.dept_name,
	cs.salary,
	dense_rank() over (partition by cd.dept_id order by cs.salary  desc) as emp_salary_rank
from cleaned_employees as ce
join cleaned_departments as cd
	on ce.dept_id=cd.dept_id
join cleaned_salaries as cs
	on ce.emp_id=cs.emp_id;

--2 . compare each employe salary with thair deprtment avg slary 
-- if sal is > avg -above average , if sla<avg then below the average



select 
	ce.emp_id ,
	ce.emp_name,
	ce.dept_id ,
	cd.dept_name ,
	cs.salary,
	avg(cs.salary) over (partition by ce.dept_id) as dept_wise_avg_slary,
	case
		when cs.salary>avg(cs.salary ) over (partition by ce.dept_id) then 'Above Avergae'
		when cs.salary<avg(cs.salary) over (partition by ce.dept_id) then 'Belwo Avererage'
		else 'Equal'
	end	as salay_comparision
from cleaned_employees ce 
join cleaned_departments cd 
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ;


-- Fine top 3 highest paid employe for each deparment 

select * from(
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_name ,
	cs.salary,
	dense_rank() over (partition by ce.dept_id order by cs.salary ) dept_wise_salry_rank
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ) t where t.dept_wise_salry_rank <=3;


--4 . find lowest emp slary for each department 

select * from(
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_name ,
	cs.salary,
	dense_rank() over (partition by ce.dept_id order by cs.salary ) dept_wise_salry_rank
from cleaned_employees ce
join cleaned_departments cd
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ) t where t.dept_wise_salry_rank =1;
