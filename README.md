# Data Modeling, Analysis, and Engineering in SQL

# Overview

For this project, I was assigned to model, analyze, and engineer employee data that was created for the fictional company Pewlet Hackard. Using SQL, I 
created a database and tables to track the data in .csv files that were provided when this project was assigned (see folder marked 'data'). Then, I coded
a series of queries to parse information about the employees, their departments, and their positions at the company. The table schemata and queries have 
been split into two separate files and are available in the folder marked 'employee_data_code'. 

# Functionality
This code is designed to import tables, then query and join these tables to answer the following questions:
  -List the employee number, last name, first name, sex, and salary of each employee
  
  -List the first name, last name, and hire date for the employees who were hired in 1986 
  
  -List the manager of each department along with their department number, department name, employee number, last name, and first name 
  
  -List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
  -List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
  
  -List each employee in the Sales department, including their employee number, last name, and first name 
  
  -List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
  
  -List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
  
Many of these queries work from a primary key set in the table 'employees', which is the employee number (emp_no) of each person included in the employee
data. Several of the tables share the employee number (emp_no) column, including department_employees and department_managers. In turn, departments sets 
the primary key for the alphanumerical key for each department (dept_no). These keys are necessary to determine which employee works in which department,
and which employee number references which employee. For example, the following code equates the employee numbers in 'employees' and 'department_employees',
then the department numbers in 'department_employees' and 'departments', and finally matches employees by their individual numbers and department numbers to
their correct department:

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
 
 (Note that this code also uses abbreviations for each table. Although the code would have worked the same without the abbreviations, I used them to limit
 typos and human error. The abbreviations are set by placing them after the full table names in the middle three lines of code.)
 
 # Use of pSQL to import .csv files
 
 Although pgAdmin 4, which I used to complete this project, has an import/export function for tables in a database, I used pSQL to import the .csv data,
 instead. Multiple errors, despite repeated troubleshooting, led me to believe pSQL would be a more reliable way to import the data for this project,
even if it is slower and somewhat less efficient. I included the pSQL commands I used to import this data in a .txt file, in this repository, but I advise
all potential users to download the data onto their local machine, then import it from there into the tables. I further advise users to attempt to use the
built-in 'import/export' function first; if it doesn't work, then use my pSQL script as a guide, replacing the file path with the one corresponding to their
own machine.

#Acknowledgements

The Entity Relationship Diagram (ERD) included in this repository was created using https://app.quickdatabasediagrams.com/ .

Data was provided by the Data Visualization & Analytics Boot Camp at The Ohio State University.

#Author

Daniel Adamson
