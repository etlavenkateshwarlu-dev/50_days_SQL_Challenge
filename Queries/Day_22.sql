--Day 22
--1. Department avg slary ( Show for each employe with avg slary of thair deparment)

select ce.emp_id, ce.emp_name ,cd.dept_id ,cd.dept_name,cs.salary ,
avg(cs.salary ) over (partition by ce.dept_id ) as dept_wise_average_salary
from cleaned_employees ce
join cleaned_departments cd 
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs
on ce.emp_id =cs.emp_id ;

-- 2. Total salary of each deprtment (empid dept+id .salry)
select ce.emp_id, ce.emp_name ,cd.dept_id ,cd.dept_name,cs.salary ,
sum(cs.salary ) over (partition by ce.dept_id ) as dept_wise_total_salary
from cleaned_employees ce
join cleaned_departments cd 
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs
on ce.emp_id =cs.emp_id ;

--3 . To get the avg performence of each deprtment (emp_id,dept_id)

select ce.emp_id, ce.emp_name ,cd.dept_id ,cd.dept_name,cp.rating_2022 ,cp.rating_2023 ,cp.rating_2024 ,
avg((cp.rating_2022 +cp.rating_2023 +cp.rating_2024)/3) over (partition by ce.dept_id ) as dept_wise_avg_ratings
from cleaned_employees ce
join cleaned_departments cd 
on ce.dept_id =cd.dept_id 
join cleaned_performance cp
on ce.emp_id =cp.emp_id ;