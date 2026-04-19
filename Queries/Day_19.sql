--Day 19
--1 . Salary catergory as low ,med, high 
-- if slary below 30k mark it as low 
-- if salary between 3k and 60k mark it as medium
-- if salary above 60k mark it as high 

select ce.emp_id ,ce.emp_name ,cs.salary  ,
case 
	when cs.salary<30000 then 'LOW'
	when cs.salary between 30000 and 60000 then 'MEDIUM'
	else  'HIGH'
end as slary_catergoery
from cleaned_employees ce
join cleaned_salaries cs 
on ce.emp_id =cs.emp_id ;

-- 2 . Based on the rating , if avg rating >=4 the Good 
   --  If avg rating >=3 Average  else Poor 

select ce.emp_id ,ce.emp_name ,
case 
	when (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 >=4 then 'Good' 
	when (cp.rating_2022+cp.rating_2023+cp.rating_2024)/3 >=3 then 'Average'
	else 'Poor'
end as emp_rating
from cleaned_employees ce
join cleaned_performance cp 
on ce.emp_id =cp.emp_id ;

-- 3. Attendency status catergory : Id status is Present labele them as Active 
    -- if status is showing any thing active mark them as Inactive 

select ce.emp_id ,ce.emp_name ,
case 
	when ca.status='Present' then 'ACTIVE'
	else 'IN ACTIVE'
end as attendence_category
from cleaned_employees ce 
join cleaned_attendance ca 
on ce.emp_id =ca.emp_id ;

--- 4.  Experiance catergory 
   --   if ecx is <2 then Fresher , if exp is between 2 and 5 is Midlevel , if exp is >5 Experiance


select ce.emp_id,ce.emp_name,extract(year from current_date)-extract(year from ce.hire_date) as yrs_exp,
case 
	when extract(year from current_date)-extract(year from ce.hire_date) <2 then 'Fresher'
	when extract(year from current_date)-extract(year from ce.hire_date) between 2 and 5 then 'Midlevel'
	else 'Experianced'
end as exp_category
from cleaned_employees ce;
