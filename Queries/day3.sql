--update emp_name for empty and null values 

select * from cleaned_employees where emp_id ='13';

update cleaned_employees set emp_name='Un Known' where emp_name is null or emp_name='';

update cleaned_employees set city='Delhi' where emp_id ='13';

update cleaned_employees set city='Delhi NCR' where city is null or city='';

update cleaned_performance set  rating_2023='0' where  rating_2023 is null or rating_2023='';

--Find duplicate values for employees

select emp_id,emp_name,city,count(*) from cleaned_employees 
group by emp_id ,emp_name ,city having count(*)>1;

--Find duplicate values for cleaned_attendance

select 
 emp_id ,attendance_date ,count(*) 
from cleaned_attendance 
group by  emp_id ,attendance_date having count(*)>1;

--Find duplicate values for cleaned_salaries

select emp_id,salary,salary_date ,count(*)
from cleaned_salaries 
group by emp_id,salary,salary_date  having count(*)>1;

--Find duplicate values for cleaned_performance

select emp_id,rating_2022,rating_2023,rating_2024   ,count(*)
from cleaned_performance 
group by emp_id,rating_2022,rating_2023,rating_2024 having count(*)>1 ;



