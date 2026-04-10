--Day 11 
--1. what is the employe name , department,performance rating 

select 
e.emp_id,e.emp_name,d.dept_name,p.rating_2022, p.rating_2023 ,p.rating_2024 
from cleaned_employees e
join cleaned_departments d 
on e.dept_id=d.dept_id
join cleaned_performance p
on e.emp_id=p.emp_id;

--2. What is the complete profile of each employee (dept,salary,perfomence)

select 
e.emp_id,e.emp_name,d.dept_name,s.salary ,p.rating_2022, p.rating_2023 ,p.rating_2024 
from cleaned_employees e
join cleaned_departments d 
on e.dept_id=d.dept_id
join cleaned_salaries s
on e.emp_id =s.emp_id 
join cleaned_performance p
on e.emp_id=p.emp_id;

--3 how many salary records does each employee have 
select e.emp_name,e.emp_id,s.salary_id ,count(*) as toatal_salary_record
from cleaned_employees e
left join cleaned_salaries s
on e.emp_id =s.emp_id 
group by e.emp_name,e.emp_id  ,s.salary_id ;

-- 4 what is toatlary paid for each employe 

select e.emp_name,e.emp_id,s.salary_id ,sum(s.salary) as toatal_salary_record
from cleaned_employees e
left join cleaned_salaries s
on e.emp_id =s.emp_id 
group by e.emp_name,e.emp_id  ,s.salary_id ;