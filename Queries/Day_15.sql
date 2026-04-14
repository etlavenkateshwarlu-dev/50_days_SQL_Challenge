 --Day 15  sub-quries , exists 
-- 1. find the employe with salary record 

select e.emp_id,e.emp_name
from cleaned_employees e
where exists (select 1 from cleaned_salaries s where s.emp_id=e.emp_id);

--2. To get the employess with out salary 

select e.emp_id ,e.emp_name 
from cleaned_employees e
where not exists (select * from cleaned_salaries s where s.emp_id=e.emp_id);

-- 3 Get teh employees with attendence 

select ce.emp_id ,ce.emp_name 
from cleaned_employees ce
where exists (select 1 from cleaned_attendance ca where ce.emp_id =ca.emp_id );

-- 4 Employe with out attendence 
select ce.emp_id ,ce.emp_name 
from cleaned_employees ce
where not exists (select 1 from cleaned_attendance ca where ce.emp_id =ca.emp_id );
