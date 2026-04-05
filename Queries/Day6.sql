--Identify the Outliners 

----Day Identify the Outliners 

alter table cleaned_salaries 
alter column salary TYPE INTEGER
using salary::INTEGER;

select  min(salary) minumum_salry ,
max(salary) minumum_salry,
avg(salary) avg_salry
from cleaned_salaries where salary>0;