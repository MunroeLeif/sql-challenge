--Drop the tables 
DROP TABLE Titles CASCADE;
DROP TABLE Employees CASCADE;
DROP TABLE Departments CASCADE;
DROP TABLE Department_employees, Department_manager, Salaries CASCADE;


--Create tables in order (so they reference one another)
CREATE TABLE Titles(
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

CREATE TABLE Employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);
--Change the datestyle
ALTER DATABASE "Employee_data" SET datestyle to "ISO,MDY";


CREATE TABLE Departments(
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Department_employees(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Department_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries(
	emp_no INT NOT NULL,
	salary MONEY,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);



