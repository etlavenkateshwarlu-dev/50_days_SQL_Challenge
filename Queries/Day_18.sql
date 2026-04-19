 --Day 18
--1. Find employee who avg salary perfomance rating >3

select e.emp_id,e.emp_name,cd.dept_name,(p.rating_2022 +p.rating_2023 +p.rating_2024 )/3 as avg_rating
from cleaned_employees e
join cleaned_departments cd on e.dept_id  =cd.dept_id 
join cleaned_performance p on e.emp_id=p.emp_id
where (p.rating_2022 +p.rating_2023 +p.rating_2024 )/3 >4;

--2. Find employees with more than 10 pracent days

select ce.emp_id ,ce.emp_name , count(ca.attendance_id) as attendence_count
from cleaned_employees ce 
join cleaned_attendance ca 
on ce.emp_id =ca.emp_id 
where ca.status ='Present'
group by ce.emp_id ,ce.emp_name having count(ca.attendance_id) >2;

--3. find the  deprtmnet where total slary grater than >200000

select cd.dept_id ,cd.dept_name,sum(cs.salary) total_salary_dept_wise  
from cleaned_employees ce 
join cleaned_departments cd on ce.dept_id =cd.dept_id 
join cleaned_salaries cs on ce.emp_id =cs.emp_id 
group by cd.dept_id ,cd.dept_name having sum(cs.salary)  >200000;

--4. Employees whos total salary > departmnet avg slary 

select ce.emp_id ,ce.emp_name ,sum(cs.salary ) total_salary
from cleaned_employees ce 
join cleaned_salaries cs 
on ce.emp_id=cs.emp_id 
group by ce.emp_id ,ce.emp_name ,ce.dept_id   having sum(cs.salary ) > 
(select avg(cd1.salary) 
from cleaned_employees ce1
join cleaned_salaries cd1 
on ce1.emp_id  =cd1.emp_id  
and ce1.dept_id =ce.dept_id 
);
