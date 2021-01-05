## 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
use employees;

select *
from employees
where hire_date in(
     select hire_date
     from employees
     where emp_no = 101010);

## 2. Find all the titles ever held by all current employees with the first name Aamod.

select title
from titles
join employees
     on titles.emp_no = employees.emp_no
where first_name in(
     select first_name
     from employees
     where first_name in ('Aamod')
     AND to_date > CURDATE());

## 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- Answer: 59,900 people no longer with the company

select count(emp_no)
from employees
where emp_no not in(
     select emp_no
     from dept_emp 
     where to_date > CURDATE()
     Group by emp_no);

## 4. Find all the current department managers that are female. List their names in a comment in your code.
-- Answer: current_female_managers
-- Isamu Legleitner
-- Karsten Sigstam
-- Leon DasSarma
-- Hilary Kambil

select concat(first_name, ' ', last_name) as current_female_managers
from employees
where emp_no in(
     select emp_no
     from dept_manager
     where to_date > CURDATE())
AND gender in ('F');

## 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select *
from employees
where emp_no in(
               select emp_no
               from salaries
               where salary > (select avg(salary)
                               from salaries)
               )
  and emp_no in(
               select emp_no
               from salaries
               where to_date > curdate()
               );

## 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

## BONUS

## 1. Find all the department names that currently have female managers.

## 2. Find the first and last name of the employee with the highest salary.

## 3. Find the department name that the employee with the highest salary works in.