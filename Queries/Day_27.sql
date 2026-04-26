--Day 29 
--1.Compare each employee slary with avergae slary 

with emp_sal_cte as(
select 
	ce.emp_id,
	ce.emp_name,
	cs.salary as emp_salary,
	avg(cs.salary) over() emp_overall_average_salary
from cleaned_employees as ce
join cleaned_salaries as cs
	on ce.emp_id=cs.emp_id),
final_emp_sal_cte as (
select 
	*,
	case
		when emp_salary>emp_overall_average_salary then 'Aobove Average'
		when emp_salary<emp_overall_average_salary then 'Below Avergae'
		else 'Equal'
	end as salary_comparision
from emp_sal_cte)
select * from final_emp_sal_cte ;

--2 . compare employee slary with total salary of all employees( saum(salary)*10% -- High contributionj

select 
	ce.emp_id,
	ce.emp_name,
	cs.salary as emp_salary,
	sum(cs.salary * 0.10) over() ten_percent_of_total_salary,
	case 
		when cs.salary > sum(cs.salary) over()* 0.10 then 'High contribution'
		else 'Low contribution'
	end as salary_contribution
from cleaned_employees as ce
join cleaned_salaries as cs
on ce.emp_id =cs.emp_id ;

-- 3. compare department salary overall total with overall total sal(dept total slary > sum(slary)30% total slalry --> High mPaying department)
with emp_dept_wise_sal_cte as(
select 
	ce.emp_id,
	ce.emp_name,
	cd.dept_id,
	cd.dept_name,
	sum(cs.salary) over (partition by cd.dept_id) as dept_overal_total_salary,
	sum(cs.salary) over ()*0.30 as overall_30percent_total_slary
from cleaned_employees as ce
join cleaned_departments cd 
on ce.emp_id =cd.dept_id 
join cleaned_salaries as cs
on ce.emp_id =cs.emp_id ),
department_pay_sal_cte as (
select 
	*,
	case 
		when dept_overal_total_salary>overall_30percent_total_slary then 'High Paying Department'
		when dept_overal_total_salary<overall_30percent_total_slary then 'Low paying Department'
	end
from emp_dept_wise_sal_cte )
select * from department_pay_sal_cte;