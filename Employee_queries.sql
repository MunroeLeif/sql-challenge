--Select statement used to view tables
SELECT * FROM Departments; 

--Data analysis questions
--List emp_no, last_name, first_name, sex and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e
LEFT JOIN Salaries as s ON
e.emp_no = s.emp_no

--List the first_name, last_name and hire_date of employees hired in 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--List the manager of each department along with thier dep_no, dept_name, emp_no, last_name and first_name
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM Department_manager as d_m
INNER JOIN Departments as d ON d_m.dept_no = d.dept_no
INNER JOIN Employees as e ON d_m.emp_no = e.emp_no;

--List the dep_no, emp_no, last_name, first_name and dept_name for each employee 
--JOIN Department and Employees and Department_employees Tables
SELECT d_e.dept_no, d_e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Department_employees as d_e
INNER JOIN Departments as d ON d_e.dept_no = d.dept_no
INNER JOIN Employees as e ON d_e.emp_no = e.emp_no;

--List first_name, last_name and sex of employees with first name Hercules and last name begining with B
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List emp_no, last_name and first_name of all Sales dept employees
SELECT emp_no, last_name, first_name
FROM Employees
WHERE emp_no IN
	(SELECT emp_no
	FROM Department_employees
	Where dept_no IN 
		(SELECT dept_no
		FROM Departments
		WHERE dept_name = 'Sales'));

--List emp_no, last_name, first_name and dept_name of all Sales and Development employees
--JOIN Employee, Departments and Dept_employees?
SELECT d_e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Department_employees as d_e
INNER JOIN Employees as e ON d_e.emp_no = e.emp_no
INNER JOIN Departments as d ON d_e.dept_no = d.dept_no 
	WHERE dept_name = 'Sales' OR dept_name = 'Development';


--List the frequency counts, in descending order, of all employee last names
SELECT last_name, COUNT(last_name) As FREQUENCY
FROM Employees
GROUP BY last_name
ORDER BY 
COUNT(last_name) DESC



