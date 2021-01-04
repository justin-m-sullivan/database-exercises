## Create a file named join_exercises.sql to do your work in.

## Join Example Database

## 1. Use the join_example_db. Select all the records from both the users and roles tables.

select *
from users;

select *
from users;

## 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
select *
from users
left join roles on roles.id = users.id;

select *
from users
right join roles on roles.id = users.id; 

## 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
select roles.name, count(*) as number_of_users
from roles
left join users on roles.id = users.role_id
group by roles.id;


## Employees Database

## 1. Use the employees database.

## 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', last_name) as 'Department Manager'
FROM departments AS d
JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no
JOIN employees as e
     ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01';

## 3. Find the name of all departments currently managed by women.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', last_name) as 'Department Manager'
FROM departments AS d
JOIN dept_manager as dm
     ON d.dept_no = dm.dept_no
JOIN employees as e
     ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01'
AND e.gender = 'F';

## 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, count(*) as 'Count'
FROM titles as t
JOIN employees_with_departments as e
     ON t.emp_no = e.emp_no
WHERE e.dept_name = 'Customer Service'
AND t.to_date = '9999-01-01'
GROUP BY t.title;

## 5. Find the current salary of all current managers.