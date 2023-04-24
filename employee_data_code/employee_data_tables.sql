-- Database: employee_data

-- DROP DATABASE IF EXISTS employee_data;

CREATE DATABASE employee_data
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Create Table: employees

--DROP TABLE if exists employees;
CREATE TABLE employees (
	emp_no INT not null primary key,
	emp_title_id VARCHAR(50) not null, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(50)NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(50)NOT NULL,
	hire_date DATE not null 
	);
-- use psql to import table data
-- display table
select * from employees;


--Create table: titles
-- DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	title_id VARCHAR(20) NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL
	);
select * from titles;

-- Create Table: departments
-- DROP TABLE if exists departments;
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR not null
	);
select * from departments;



--create table: department_employees
-- DROP TABLE IF EXISTS department_employees;
CREATE TABLE department_employees (
Emp_no INT NOT NULL,
Dept_no VARCHAR(50) NOT NULL,
PRIMARY KEY (Emp_no, Dept_no),
FOREIGN KEY (Emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (Dept_no) REFERENCES departments(dept_no)
);
SELECT * FROM department_employees;


-- create table: department_managers
-- DROP TABLE IF EXISTS department_managers;
CREATE TABLE department_managers (
Dept_no VARCHAR(50) NOT NULL,
Emp_no INT NOT NULL,
PRIMARY KEY (Dept_no, Emp_no),
FOREIGN KEY (Dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (Emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM department_managers;


-- create table: salaries
-- DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
Emp_no INT NOT NULL,
Salary INT NOT NULL,
PRIMARY KEY (Emp_no),
FOREIGN KEY (Emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salary;
