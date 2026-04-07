--Removing of elad and trail spacess 
-- Handling Data type
---Day 8 -----------
update cleaned_employees set emp_name=trim(emp_name);

---change data types for cleaned_performance columns

ALTER TABLE cleaned_performance
ALTER COLUMN rating_2022 TYPE INTEGER
using rating_2022::INTEGER;

ALTER TABLE cleaned_performance
ALTER COLUMN emp_id TYPE INTEGER
using emp_id::INTEGER;

ALTER TABLE cleaned_performance
ALTER COLUMN rating_2023 TYPE INTEGER
using nullif(rating_2023,'')::INTEGER;

ALTER TABLE cleaned_performance
ALTER COLUMN rating_2024 TYPE INTEGER
using rating_2024::INTEGER;


---change data types for cleaned_salaries columns

ALTER TABLE cleaned_salaries
ALTER COLUMN salary_id TYPE INTEGER
using salary_id::INTEGER;

ALTER TABLE cleaned_salaries
ALTER COLUMN emp_id TYPE INTEGER
using emp_id::INTEGER;

ALTER TABLE cleaned_salaries
ALTER COLUMN salary TYPE INTEGER
using salary::INTEGER;

ALTER TABLE cleaned_salaries
ALTER COLUMN salary_date TYPE date
using salary_date::date;



---change data types for cleaned_attendance columns

ALTER TABLE cleaned_attendance
ALTER COLUMN attendance_id TYPE INTEGER
using attendance_id::INTEGER;

ALTER TABLE cleaned_attendance
ALTER COLUMN emp_id TYPE INTEGER
using emp_id::INTEGER;

ALTER TABLE cleaned_attendance
ALTER COLUMN attendance_date TYPE date
using attendance_date::date;

ALTER TABLE cleaned_attendance
ALTER COLUMN status TYPE varchar(100)
using status::varchar;

---change data types for cleaned_departments columns

ALTER TABLE cleaned_departments
ALTER COLUMN dept_id TYPE INTEGER
using dept_id::INTEGER;

ALTER TABLE cleaned_departments
ALTER COLUMN dept_name TYPE varchar(100)
using dept_name::varchar;

---change data types for cleaned_employees columns
ALTER TABLE cleaned_employees
ALTER COLUMN emp_id TYPE INTEGER
USING emp_id::INTEGER;

ALTER TABLE cleaned_employees
ALTER COLUMN emp_name TYPE varchar(100)
using emp_name::varchar;

ALTER TABLE cleaned_employees
ALTER COLUMN age TYPE INTEGER
USING emp_id::INTEGER;

ALTER TABLE cleaned_employees
ALTER COLUMN city TYPE varchar(100)
using city::varchar;

ALTER TABLE cleaned_employees
ALTER COLUMN dept_id TYPE INTEGER
using dept_id::INTEGER;

ALTER TABLE cleaned_employees
ALTER COLUMN hire_date TYPE date
using hire_date::date;



