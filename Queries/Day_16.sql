
--Day 16 caluculations 

--1. Find the total salary per employee

select ce.emp_id,ce.emp_name,sum(cs.salary) as total_salary
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id 
group by ce.emp_id ,ce.emp_name order  by ce.emp_id ;

--2.Find the avg salary per employee ()
select ce.emp_id ,ce.emp_name ,avg(cs.salary ) as average_salry
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id  
group by ce.emp_id ,ce.emp_name ;

---3 . Count of salary record 

select ce.emp_id,count(*) as number_of_salary_records
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id=cs.emp_id
group by ce.emp_id;

-- 4 . Max salary for employee

select ce.emp_id,max(cs.salary ) as max_salary_of_emp
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id=cs.emp_id
group by ce.emp_id;