--Day9 applay joins 
--Find the employees who have valid deparment 
select 
e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
inner join cleaned_departments d
on e.dept_id =d.dept_id ;

-- Find All employes even with out department 

select 
e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
left join cleaned_departments d
on e.dept_id =d.dept_id ;

-- List employe with out department
select 
e.emp_id,e.emp_name,d.dept_name 
from cleaned_employees e
left join cleaned_departments d
on e.dept_id =d.dept_id where d.dept_id is null;


select 
e.emp_id,e.emp_name,s.salary  
from cleaned_employees e
 join cleaned_salaries s
on e.emp_id  =s.emp_id  ;

