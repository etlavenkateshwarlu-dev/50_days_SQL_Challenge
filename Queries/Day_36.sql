
--- Day 36 : Stored procedure
--1 create procedure to get emp data 
CREATE OR REPLACE FUNCTION get_all_emp()
RETURNS SETOF cleaned_employees
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM cleaned_employees;
END;
$$;

select get_all_emp();

--2 store a procedue with input perameter
-- find employee by employee id 

DROP PROCEDURE IF EXISTS get_emp_by_id(INT);

CREATE OR REPLACE PROCEDURE get_emp_by_id(IN emp_id_in INT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Just display data (procedures don't return result sets)
    RAISE NOTICE '%',
        (SELECT row_to_json(e)
         FROM cleaned_employees e
         WHERE emp_id = emp_id_in);
END;
$$;

CALL get_emp_by_id(101);


--3. procedure with join (emp and salary details)

CREATE OR REPLACE PROCEDURE get_emp_by_salary()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Just display data (procedures don't return result sets)
    RAISE NOTICE '%',
        (SELECT *
         FROM cleaned_employees ce
		 join cleaned_salaries cs
		on  ce.emp_id = cs.emp_id);
END;
$$;

call get_emp_by_salary();

--4 procedue for slary report (generate report for high salary >50000)
CREATE OR REPLACE PROCEDURE get_high_salary_report_proc()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE '%',
        (SELECT json_agg(ce)
         FROM cleaned_employees ce
	     join cleaned_salaries cs
		 on ce.emp_id=cs.emp_id
         WHERE salary > 50000);
END;
$$;

call get_high_salary_report_proc();


