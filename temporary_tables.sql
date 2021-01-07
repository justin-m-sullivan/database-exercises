## 1. Using the example from the lesson, re-create the employees_with_departments table.
```
use easley_1270;
create temporary table employees_with_departments as (
select emp_no, first_name, last_name, dept_no, dept_name
from employees.employees
join employees.dept_emp using (emp_no)
join employees.departments using (dept_no)
limit 100);
```

## a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
```
ALTER TABLE employees_with_departments ADD full_name VARCHAR(600);
```

## b. Update the table so that full name column contains the correct data
```
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

select * 
from employees_with_departments;

```

## c. Remove the first_name and last_name columns from the table.
```
Alter table employees_with_departments DROP COLUMN first_name;

Alter table employees_with_departments DROP COLUMN last_name;

```

## d. What is another way you could have ended up with this same table?
```
CREATE TEMPORARY TABLE employees_with_departments_other_way AS
SELECT emp_no, dept_no, dept_name, CONCAT(first_name, ' ', last_name) as full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

```

## 2. Create a temporary table based on the payment table from the sakila database.

CREATE TEMPORARY TABLE sakila_payment AS
SELECT *
from sakila.payment;
##  Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
```
alter table sakila_payment modify amount decimal (7,2);
update sakila_payment set amount = amount * 100;
alter table sakila_payment modify amount int unsigned;

```
## 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries.
## In terms of salary, what is the best department right now to work for? 
Sales is the best department right now because Sales has the largest, positive z-score at 1.48
## The worst? Human resources would be the worst as the zscore is the smallest and at the mean at 0.00

```
use easley_1270; 
```

## Create temp table with all histroical salary data for all departments
```
CREATE TEMPORARY TABLE dept_salaries as 
select e.*, s.salary, d.dept_name, d.dept_no, de.to_date
from employees.employees as e
JOIN employees.salaries as s using(emp_no)
JOIN employees.dept_emp as de using (emp_no)
JOIN employees.departments as d using (dept_no);
```
## Retrieve historical avg salary and historical stdev
```
select avg(salary) as hist_avg_salary, stddev(salary)
from dept_salaries;
```
##  Create temporary table for analyzing current salaries by dept. 
```
CREATE TEMPORARY TABLE curr_dept_salaries as 
select e.*, s.salary, d.dept_name, d.dept_no, s.to_date
from employees.employees as e
JOIN employees.salaries as s using(emp_no)
JOIN employees.dept_emp as de using (emp_no)
JOIN employees.departments as d using (dept_no)
where s.to_date > curdate()
and de.to_date > curdate();
```

# Create temp table to compare current salary data vs historical salary data, by dept.
```
CREATE TEMPORARY TABLE avg_dept_salary as
select dept_name, avg(salary)  as dept_avg_salary
from curr_dept_salaries
group by dept_name;
```

## Select phrase for checking work as I code
```
select *
from avg_dept_salary;
```

## code below inserts salary mean into avg_dept_salary temp table
```
ALTER TABLE avg_dept_salary ADD salary_mean INT signed;

UPDATE avg_dept_salary set salary_mean = (select avg(salary) from dept_salaries);
```
## code below inserts std dev into avg_dept-salary temp table
```
ALTER TABLE avg_dept_salary ADD salary_STD DECIMAL(7,2) signed;

Update avg_dept_salary set salary_STD = (select std(salary) from dept_salaries);
```
## Code below alters table to add in zscores
```
ALTER TABLE avg_dept_salary ADD z_score decimal(8,9) signed;
update avg_dept_salary set z_score = (dept_avg_salary - salary_mean) / salary_STD;
```
## show results of query
```
select *
from avg_dept_salary;
```