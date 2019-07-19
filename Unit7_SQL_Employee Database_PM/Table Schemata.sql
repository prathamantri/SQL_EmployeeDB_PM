CREATE TABLE departments(
	dept_no VARCHAR (20) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL
);

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	gender VARCHAR (10) NOT NULL,
	hire_date DATE
);

CREATE TABLE dept_emp(
 	dept_no VARCHAR(20) FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(20) FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE
);

CREATE TABLE salaries(
	emp_no INTEGER FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER NOT NULL,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INTEGER FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE
);