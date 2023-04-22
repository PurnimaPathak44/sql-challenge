-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
ON emp.emp_no = sal.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date desc;

-- List the manager of each department along with their department number, department name, employee number,
--last name, and first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager 
JOIN departments ON departments.dept_no = dept_manager.dept_no

JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees

inner JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

inner JOIN departments ON dept_emp.dept_no = departments.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
from employees
where first_name = 'Hercules'
AND last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees

JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

JOIN departments ON dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
ORDER BY employees.emp_no;



-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees

JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

JOIN departments ON dept_emp.dept_no = departments.dept_no
where departments.dept_name in ('Sales', 'Development')
ORDER BY employees.emp_no;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name,count (last_name)
FROM employees

group by last_name
ORDER BY count (last_name) DESC;

