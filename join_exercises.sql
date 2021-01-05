## Create a file named join_exercises.sql to do your work in.

## Join Example Database
use `join_example_db`;
## 1. Use the join_example_db. Select all the records from both the users and roles tables.

select *
from users;

select *
from roles;

## 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
select *
FROM users
JOIN roles 
ON users.role_id = roles.id;

select *
from users
left join roles on roles.id = users.id;

select *
from users
right join roles on roles.id = users.id; 

## 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select roles.name as roles, count(users.name) as number_of_users
from roles
left join users on roles.id = users.role_id
group by roles.name;


## Employees Database

## 1. Use the employees database.
use employees;

## 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', last_name) as 'Department Manager'
FROM departments AS d
JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no
JOIN employees as e
     ON e.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE();

## 3. Find the name of all departments currently managed by women.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', last_name) as 'Department Manager'
FROM departments AS d
JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no
JOIN employees as e
     ON e.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
AND e.gender = 'F';

## 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, count(*) as 'Count'
FROM titles as t
JOIN employees_with_departments as e
     ON t.emp_no = e.emp_no
WHERE e.dept_name = 'Customer Service'
AND t.to_date > CURDATE()
GROUP BY t.title;

## 5. Find the current salary of all current managers.
SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', last_name) as 'Department Manager', s.salary
FROM departments AS d
JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no
JOIN employees as e
     ON e.emp_no = dm.emp_no
JOIN salaries as s
     ON e.emp_no = s.emp_no
WHERE dm.to_date > CURDATE()
AND s.to_date > CURDATE();

## 6. Find the number of current employees in each department.

SELECT d.dept_no, d.dept_name, count(*) as num_employees
FROM departments AS d
JOIN dept_emp as de
     ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no;

## 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT d.dept_name, avg(s.salary) as average_salary
FROM departments AS d
     JOIN dept_emp as de
      ON d.dept_no = de.dept_no
JOIN salaries as s
      ON de.emp_no = s.emp_no
WHERE s.to_date = "9999-01-01"
GROUP BY d.dept_name
ORDER BY avg(s.salary) desc
LIMIT 1;

## 8. Who is the highest paid employee in the Marketing department?

SELECT e.first_name, e.last_name
FROM employees as e
JOIN salaries as s 
     ON e.emp_no = s.emp_no
JOIN dept_emp as de
     ON s.emp_no = de.emp_no
JOIN departments as d
     ON de.dept_no = d.dept_no
WHERE de.to_date > CURDATE()
AND d.dept_name IN ('Marketing')
GROUP BY e.emp_no
ORDER BY max(s.salary) desc
LIMIT 1;

## 9. Which current department manager has the highest salary?
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees as e
JOIN salaries as s 
     ON e.emp_no = s.emp_no
JOIN dept_manager as dm
     ON s.emp_no = dm.emp_no
JOIN departments as d
     ON dm.dept_no = d.dept_no
WHERE s.to_date > CURDATE()
AND dm.to_date > CURDATE()
ORDER BY s.salary desc
LIMIT 1;


## 10 Bonus Find the names of all current employees, their department name, and their current managers name.

SELECT CONCAT(e.first_name, '_', e.last_name) as emp_name, dept_name, CONCAT(managers.first_name, ' ', managers.last_name)
FROM employees as e
JOIN dept_emp as de using(emp_no)
JOIN departments as d using(dept_no)
JOIN dept_manager using(dept_no)
JOIN employees as managers on managers.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > now()
AND de.to_date > now();

## 11 Bonus Who is the highest paid employee within each department.
