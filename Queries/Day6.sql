--Identify the Outliners 

----Day Identify the Outliners 

alter table cleaned_salaries 
alter column salary TYPE INTEGER
using salary::INTEGER;

select  min(salary) minumum_salry ,
max(salary) minumum_salry,
avg(salary) avg_salry
from cleaned_salaries where salary>0;

alter table cleaned_salaries 
alter column salary TYPE INTEGER
using salary::INTEGER;

alter table cleaned_salaries add column in_outlier  INTEGER;

select  min(salary) minumum_salry ,
max(salary) minumum_salry,
avg(salary) avg_salry
from cleaned_salaries where salary>0;

update cleaned_salaries set in_outlier = case when salary <20000 or salary >200000 
											then 1 
											else 0
											end;
                                             