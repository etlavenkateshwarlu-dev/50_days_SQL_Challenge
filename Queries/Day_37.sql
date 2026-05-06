
--Day 37 : store procedure using if condition 
--1. procedure with if condition (find return message based on salary)
CREATE OR REPLACE PROCEDURE salary_check(emp_id_in INT)
LANGUAGE plpgsql
AS $$
DECLARE
    sal INT;
BEGIN
    SELECT salary
    INTO sal
    FROM cleaned_salaries
    WHERE emp_id = emp_id_in
    LIMIT 1;

    IF sal > 50000 THEN
        RAISE NOTICE 'High Salary';
    ELSE
        RAISE NOTICE 'Low Salary';
    END IF;
END;
$$;

call salary_check(210);


--2 . procedire with case 
 	--- categorize the employe if sal>17000 high if slary > 40000 Medium if sal<40k  then Low 


CREATE OR REPLACE PROCEDURE salary_category(emp_id_in INT)
LANGUAGE plpgsql
AS $$
DECLARE
    sal INT;
BEGIN
    SELECT salary
    INTO sal
    FROM cleaned_salaries
    WHERE emp_id = emp_id_in
    LIMIT 1;

    CASE
        WHEN sal > 70000 THEN
            RAISE NOTICE 'High';
        WHEN sal > 40000 THEN
            RAISE NOTICE 'Medium';
        ELSE
            RAISE NOTICE 'Low';
    END CASE;
END;
$$;
call salary_category(210);

-- Store procedure using aggregation 
--3. toatal salary for employee
CREATE OR REPLACE PROCEDURE emp_total_sal_report()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN 
        SELECT emp_id, SUM(salary) AS total_salary
        FROM cleaned_salaries
        GROUP BY emp_id
    LOOP
        RAISE NOTICE 'Emp: %, Total Salary: %', rec.emp_id, rec.total_salary;
    END LOOP;
END;
$$;

call emp_total_sal_report()