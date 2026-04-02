--Remove duplicates from cleaned_employees

with emp_cte as (
select emp_id,
row_number() over (partition by emp_id ,emp_name ,city order by emp_id ) as rowNumber
from cleaned_employees
) 
delete from cleaned_employees where emp_id in (select emp_id from emp_cte where rowNumber>1)

--Remove duplicates from cleaned_salaries

with delete_cleaned_salaries_cte as (
select *,row_number() over (partition by emp_id,salary_id) as rowNumber from cleaned_salaries
)
delete from cleaned_salaries where salary_id in (select salary_id from delete_cleaned_salaries_cte where rowNumber>1);


--Remove duplicates from cleaned_performance

with delete_cleaned_performance as(
select *,
row_number() over(partition by emp_id,rating_2022,rating_2023,rating_2024 order by emp_id ) as rowNumber
from cleaned_performance
)
delete from cleaned_performance where emp_id in (select emp_id from delete_cleaned_performance where rowNumber>1);

--correct the data inconsistency for cleaned_employees table 

update cleaned_employees set city=coalesce(concat(UPPER(left(TRIM(city),1)),LOWER(substr(TRIM(city),2))),'Not Avilable') ;

update cleaned_employees set city =case  when city in ('Dlhi','New delhi') then 'Delhi'
                                    when city in ('Hydbd') then 'Hyderabad'
                                    when city in ('Bangalore') then 'Bengalore'
                                    else city end;

