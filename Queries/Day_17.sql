
--Day 17  
--1.Finding the employees wih more than 2 salary record

select emp_id,count(*)
from cleaned_salaries cs 
group by emp_id 
having count(*)>1;

--2. find out the deprment with more than 3 employees  
select dept_id ,count(*) 
from cleaned_employees 
group by dept_id 
having count(*) >3;

--3. employee with total salry > 100000
select e.emp_id ,sum(s.salary)
from cleaned_employees e
join cleaned_salaries s
on e.emp_id =s.emp_id 
group by e.emp_id having sum(s.salary)>100000;

--4. department with high avg salary (>50000)

select ce.dept_id,avg(cs.salary)  from 
cleaned_employees ce 
join cleaned_departments cd 
on ce.dept_id =cd.dept_id 
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id
group by ce.dept_id having avg(cs.salary)>50000;