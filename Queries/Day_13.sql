
--Day 13 using sunqueries 

--1. To find the employes who are erning more than average salary 

select e.emp_id ,e.emp_name ,s.salary 
from cleaned_employees e 
join cleaned_salaries s
on e.emp_id =s.emp_id 
where s.salary >(select avg(salary)
from cleaned_salaries);

-- 2. employees with salary equal to maximum salary 
select e.emp_id ,e.emp_name ,s.salary 
from cleaned_employees e 
join cleaned_salaries s
on e.emp_id =s.emp_id 
where s.salary = (select max(salary)
from cleaned_salaries);

-- 3. employees earning avg salary 
select e.emp_id ,e.emp_name ,s.salary 
from cleaned_employees e 
join cleaned_salaries s
on e.emp_id =s.emp_id 
where s.salary < (select avg(salary)
from cleaned_salaries);

-- 4 . employees with minumum salary 
select e.emp_id ,e.emp_name ,s.salary 
from cleaned_employees e 
join cleaned_salaries s
on e.emp_id =s.emp_id 
where s.salary = (select min(salary)
from cleaned_salaries);