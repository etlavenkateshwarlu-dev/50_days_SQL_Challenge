
--Day 14 : usage of co-related sub query 

-- 1. get the employees earning more than department salary 

select e1.emp_id ,e1.emp_name ,s1.salary 
from cleaned_employees e1
join cleaned_salaries s1
on e1.emp_id =s1.emp_id 
where salary >(
select avg(s.salary)
from cleaned_salaries s
join cleaned_employees e
on e.emp_id =s.emp_id 
where e.dept_id=e1.dept_id);

--- 2. higest salary for department 

select e1.emp_id ,e1.emp_name ,s1.salary 
from cleaned_employees e1
join cleaned_salaries s1
on e1.emp_id =s1.emp_id 
where salary =(
select max(s.salary)
from cleaned_salaries s
join cleaned_employees e
on e.emp_id =s.emp_id 
where e.dept_id=e1.dept_id);

--- 3. list all those employees who salary equal to the  lowest salary each deparment 
select e1.emp_id ,e1.emp_name,e1.dept_id  ,s1.salary  
from cleaned_employees e1
join cleaned_salaries s1
on e1.emp_id =s1.emp_id 
where s1.salary =(
select min(cs.salary )
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id
where ce.dept_id =e1.dept_id); 







