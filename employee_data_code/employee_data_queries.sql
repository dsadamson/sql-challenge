-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no AS employee_number,
	e.last_name AS last_name,
	e.first_name AS first_name,
	e.sex AS sex,
	s.salary AS salary
FROM
employees e
	JOIN salary s ON e.emp_no = s.Emp_no
ORDER BY e.emp_no ASC;

	

--Find first name, last name and hire date of employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_DATE(hire_date, 'MM/DD/YYYY') BETWEEN '1986-01-01' AND '1986-12-31';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
  dm.dept_no AS department_number, 
  d.dept_name AS department_name, 
  dm.emp_no AS employee_number, 
  e.last_name AS last_name, 
  e.first_name AS first_name
FROM 
  department_managers dm 
  JOIN departments d ON dm.dept_no = d.dept_no 
  JOIN employees e ON dm.emp_no = e.emp_no
GROUP BY 
  dm.dept_no, 
  d.dept_name, 
  dm.emp_no, 
  e.last_name, 
  e.first_name;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no,
       e.last_name,
       e.first_name,
       d.dept_name,
       de.dept_no
FROM employees e
INNER JOIN department_employees de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
GROUP BY de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
ORDER BY de.dept_no, e.emp_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name
FROM employees e
INNER JOIN department_employees de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007'AND d.dept_name = 'Sales'
GROUP BY 
	e.emp_no, 
	e.last_name, 
	e.first_name
ORDER BY e.emp_no;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN department_employees de ON e.emp_no = de.emp_no 
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE (d.dept_no = 'd007' AND d.dept_name = 'Sales')
   OR (d.dept_no = 'd005' AND d.dept_name = 'Development')
GROUP BY 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
ORDER BY e.emp_no;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).+
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;