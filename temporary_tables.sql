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

##  Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
```
alter table sakila_payment modify amount int;
```
## 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?