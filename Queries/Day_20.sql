--Day 20 : Window function
--1. Latest salary 

select t.emp_id,t.emp_name ,t.salary_date  from (
select ce.emp_id ,ce.emp_name,cs.salary_date,
row_number() over (partition by ce.emp_id  order by cs.salary_date desc)
from cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ) t where t.row_number =1;

--2. Find the employee first slary 
select t.emp_id,t.emp_name ,t.salary_date as emp_first_salary_date  from (
select ce.emp_id ,ce.emp_name,cs.salary_date,
row_number() over (partition by ce.emp_id  order by cs.salary_date asc)
from cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ) t where t.row_number =1;

-- 3 .Ranking the each employe based on salary

select t.emp_id,t.emp_name ,t.salary_date ,t.salary ,t.rank_number  as emp_first_salary_date  from (
select ce.emp_id ,ce.emp_name,cs.salary_date,cs.salary,
row_number() over (partition by ce.emp_id  order by cs.salary  desc) as rank_number
from cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id )t;

-- 4. Get emp detail whos Top 2 slary records per employ 

select t.emp_id,t.emp_name ,t.salary_date ,t.salary ,t.rank_number  as emp_first_salary_date  from (
select ce.emp_id ,ce.emp_name,cs.salary_date,cs.salary,
row_number() over (partition by ce.emp_id  order by cs.salary  desc) as rank_number
from cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id )t where t.rank_number <=2;
