--Day 21 : 
--1 . Rank employee by salary 

select e.emp_id,e.emp_name,s.salary,
rank() over (order by s.salary desc) as salary_rank
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;

--2. Departent wise ranking (rank employee inside each department)

select e.emp_id,e.emp_name,d.dept_name,s.salary,
dense_rank() over (partition by e.dept_id order by s.salary desc) as dept_wise_salary_rank
from cleaned_employees e
join cleaned_departments d
on e.dept_id =d.dept_id 
join cleaned_salaries s
on e.emp_id =s.emp_id ;

-- 3. Find the top performence of employee (caluclate avg rating)

select es.emp_id, es.emp_name ,(cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 as average_rarting,
dense_rank() over (order by (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 desc) performence_rank
from cleaned_employees es
join cleaned_performance cp 
on es.emp_id =cp.emp_id ;

-- 4 .Salary ranking for top 3 employes

select * from (
select es.emp_id, es.emp_name ,(cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 as average_rarting,
dense_rank() over (order by (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 desc) performence_rank
from cleaned_employees es
join cleaned_performance cp 
on es.emp_id =cp.emp_id ) t where t.performence_rank>=3;
