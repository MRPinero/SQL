-- SCHEMA: employee_database

-- DROP SCHEMA employee_database ;

SET search_path to employee_database;

--CREATE SCHEMA employee_database
--AUTHORIZATION postgres;

--LIst of queries
--1. List of each employee: employee number, last name, first name, gender
SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".gender, salaries.salary
FROM "Employees"
JOIN salaries
ON "Employees".emp_no = salaries.emp_no;

--2. List employees who were hired in 1986
SELECT  "Employees".first_name, "Employees".last_name, "Employees".hire_date
FROM "Employees"
WHERE "Employees".hire_date
--SELECT Convert (datetime, '01/01/1986')
--SELECT Convert (datetime, '12/31/1986')
between '01/01/1986' and '12/31/1986';

--3. List manager info: dpto_no, dept_name, manager's emp_no, last_name, first_name, start_date, end_date
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, "Employees".last_name, "Employees".first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN "Employees"
ON dept_manager.emp_no = "Employees".emp_no;

--4. List dept employee info:emp_no, last_name, first_name, dept_name
SELECT dept_emp.emp_no, "Employees".last_name, "Employees".first_name, departments.dept_name
FROM dept_emp
JOIN "Employees"
ON dept_emp.emp_no = "Employees".emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--5. Employees names Hercules and last name w B
SELECT * FROM "Employees"
WHERE "Employees".first_name LIKE '%Hercules%'
AND "Employees".last_name LIKE 'B%';

--6. All employees in Sales Departments: emp_no, last_name, first_name, dept_ name
SELECT dept_emp.emp_no, "Employees".last_name, "Employees"first_name, departments.dept_name
FROM dept_emp
JOIN "Employees"
ON dept_emp.emp_no = "Employees".emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7.List employees in Sales and Development departments with: emp_no, last_name, first_name, dept_name
SELECT dept_emp.emp_no, "Employees".last_name, "Employees".first_name, departments.dept_name
FROM dept_emp
JOIN "Employees"
ON dept_emp.emp_no = "Employees".emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8. Desc order, list the frequency count of employee last names, how many share each last name
SELECT "Employees".last_name
--COUNT ("Employees".last_name) 
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY "Employees".last_name DESC;
--COUNT ("Employees".last_name) DESC;