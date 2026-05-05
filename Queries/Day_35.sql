
--Day 35 . Index optimization 
-- identify the slwo query and fix it 

--1 . analayz the query before indexing

explain analyze
select 
	ce.emp_name,
	cs.salary 
from  cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ;

--Execution Time: 0.420 ms

--apply index 
create index index_emp on cleaned_employees(emp_id);
create index index_emp_sal on cleaned_salaries(emp_id);

explain analyze
select 
	ce.emp_name,
	cs.salary 
from  cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ;

--Execution Time: 0.243 ms

--2 . composite index .
 -- a)analyz query where  emp_id=101 ,salary_date=2024-01-01
 -- b) create index_emp_saldate
 --c) check after index  


explain analyze
select 
	ce.emp_name,
	cs.salary 
from  cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id 
where cs.emp_id='101' and cs.salary_date='2024-01-01';

create index index_empid_salarydate on cleaned_salaries(emp_id,salary_date);


explain analyze
select 
	ce.emp_name,
	cs.salary 
from  cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id 
where cs.emp_id='101' and cs.salary_date='2024-01-01';

--3 . Analayz who emp who id is 101
explain analyze
select * from cleaned_employees where emp_id='101'