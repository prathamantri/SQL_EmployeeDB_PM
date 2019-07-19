
Query 1: 
--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	salaries.salary
FROM
	employees
LEFT JOIN
	salaries
ON
	employees.emp_no=salaries.emp_no
;


Query 2:
--List employees who were hired in 1986.
SELECT
	* 
FROM
	employees
WHERE
	EXTRACT (YEAR FROM employees.hire_date) = 1986;


Query 3:
--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	managers.dept_no,
	managers.dept_name,
	managers.emp_no,
	employees.first_name,
	employees.last_name,
	managers.from_date,
	managers.to_date
FROM 
	(SELECT
		departments.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		dept_manager.from_date,
		dept_manager.to_date
	FROM
		dept_manager
	LEFT JOIN
		departments
	ON
		departments.dept_no=dept_manager.dept_no
	) AS managers
	
LEFT JOIN
	employees
ON
	managers.emp_no = employees.emp_no
;


Query 4:
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
	edn.emp_no,
	edn.first_name,
	edn.last_name,
	departments.dept_name
FROM
	departments
LEFT JOIN
	(SELECT
		employees.emp_no,
		employees.first_name,
		employees.last_name,
		dept_emp.dept_no
	FROM 
		employees

	LEFT JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
	) AS edn
	
ON
	edn.dept_no=departments.dept_no
;


Query 5:
--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT
	*
FROM
	employees
WHERE
	employees.first_name = 'Hercules'
	AND
	employees.last_name LIKE 'B%'
;


Query 6:
--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT
	edn.emp_no,
	edn.first_name,
	edn.last_name,
	departments.dept_name
FROM
	departments
LEFT JOIN
	(SELECT
		employees.emp_no,
		employees.first_name,
		employees.last_name,
		dept_emp.dept_no
	FROM 
		employees

	LEFT JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
	) AS edn
	
ON
	edn.dept_no=departments.dept_no

WHERE
	departments.dept_name = 'Sales'
;


Query 7:
--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT
	edn.emp_no,
	edn.first_name,
	edn.last_name,
	departments.dept_name
FROM
	departments
LEFT JOIN
	(SELECT
		employees.emp_no,
		employees.first_name,
		employees.last_name,
		dept_emp.dept_no
	FROM 
		employees

	LEFT JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
	) AS edn
	
ON
	edn.dept_no=departments.dept_no

WHERE
	departments.dept_name IN ('Sales', 'Development')
;


Query 8:
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT
	employees.last_name,
	COUNT(employees.last_name) AS cnt
FROM
	employees
GROUP BY 
	employees.last_name
ORDER BY
	cnt DESC
;
