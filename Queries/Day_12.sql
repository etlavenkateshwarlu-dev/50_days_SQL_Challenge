  
--Day 12 ,havingb,aggreation 
--1. average salary department(each department) wise 

select d.dept_name,avg(s.salary)  as dept_wise_average_salry
from cleaned_employees e
 join cleaned_departments d
on e.dept_id =d.dept_id 
join cleaned_salaries s
on e.emp_id =s.emp_id 
group by d.dept_name ;

--2.How many days each employe pracent  
select e.emp_id,e.emp_name ,count(ca.attendance_id) as attendency_count
from cleaned_employees e
join cleaned_attendance ca 
on  e.emp_id =ca.emp_id 
group by e.emp_id ,e.emp_name ;
;

--- 3. which emplaye belongs to same department 

select d.dept_name ,count(*)
from cleaned_employees e
join departments d 
on e.dept_id=d.dept_id  
group by d.dept_name ;


select d.dept_name,STRING_AGG(e.emp_name,',')  as dept_wise_average_salry
from cleaned_employees e
 join cleaned_departments d
on e.dept_id =d.dept_id 
group by d.dept_name having count(*) >1;

--4 whihc employe has more than one salary record

select e.emp_id,e.emp_name ,count(s.salary_id ) as salary_records
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name
having count(s.salary_id ) >1;

