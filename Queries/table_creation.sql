
create table departments (dept_id varchar(40),dept_name varchar(40));
create table attendance(attendance_id varchar(40),emp_id varchar(40),attendance_date varchar(40),status varchar(40));
create table  performance(emp_id varchar(40),rating_2022 varchar(40),rating_2023 varchar(40),rating_2024 varchar(40))
create table  salaries(salary_id varchar(40),emp_id varchar(40),salary varchar(40),salary_date varchar(40));
create table employees(
emp_id varchar(40),
emp_name varchar(40),
age varchar(40),
city varchar(40),
dept_id varchar(40),
hire_date varchar(40)
);

Day2 :Cleaned table creation 
==============================================================


create  table  cleaned_departments 
as 
select * from departments ;

create table cleaned_employees
as
select * from employees;

create table cleaned_performance
as
select * from performance p ;

create table cleaned_salaries
as
select * from salaries ;

create table cleaned_attendance
as
select * from attendance ;