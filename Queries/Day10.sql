
--Day10 join concepts 

--1. performence ratings of each employe 
select e.emp_id,e.emp_name ,p.rating_2022 ,p.rating_2023 ,p.rating_2024 
from cleaned_employees e
inner join cleaned_performance p
on e.emp_id=p.emp_id ;

--2.Whihc employe dont have any salary record 

select e.emp_id,e.emp_name ,s.salary_id 
from cleaned_employees e
left  join cleaned_salaries s
on e.emp_id=s.emp_id
where s.emp_id  is null;

--3. Whihc employe do n't have attendency record 

select e.emp_id,e.emp_name from cleaned_employees e
left join cleaned_attendance a
on e.emp_id = a.emp_id  where a.emp_id  is null;

--4. what is teh employe name ,dept ,salary togather 
select e.emp_id ,e.emp_name ,d.dept_name,s.salary  
from cleaned_employees e 
inner join cleaned_departments d
on e.dept_id  =d.dept_id 
inner join cleaned_salaries s
on e.emp_id=s.emp_id;