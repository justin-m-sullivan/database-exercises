## 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
```
use employees;

select *, IF(to_date = '9999-01-01', true, false) AS still_employed
from dept_emp; 
```
-- The above query returns more employee records than the num of individuals that actually worked for the company. To solve this, we need to filter by max(to_date) and emp_no to remove duplicate people who changed departments and also changed emp_no. See Faith's solution in the Easley Exercise repo. 

## 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
```
select first_name, last_name, case
     when last_name like 'A%' then 'A-H'
     when last_name like 'B%' then 'A-H'
     when last_name like 'C%' then 'A-H'
     when last_name like 'D%' then 'A-H'
     when last_name like 'E%' then 'A-H'
     when last_name like 'F%' then 'A-H'
     when last_name like 'G%' then 'A-H'
     when last_name like 'H%' then 'A-H'
     when last_name like 'I%' then 'I-Q'
     when last_name like 'J%' then 'I-Q'
     when last_name like 'K%' then 'I-Q'
     when last_name like 'L%' then 'I-Q'
     when last_name like 'M%' then 'I-Q'
     when last_name like 'N%' then 'I-Q'
     when last_name like 'O%' then 'I-Q'
     when last_name like 'P%' then 'I-Q'
     when last_name like 'Q%' then 'I-Q'  
     else 'R-Z'
     end as alpha_group
from employees
;
```
-- There is an easier solution for this one! when left(last_name, 1) in A, B, C

## 3. How many employees (current or previous) were born in each decade?

-- Answer: 117,138 born in the 60s. 182,886 born in the 50s.

use `easley_1270`;
create temporary table dob_by_decades as
select birth_date
from employees.employees;

select (sum(
           (select IF(birth_date like '196%', true, false) as 60s)
           )) as born_in_60s 
           , 
       (sum(
           (select IF(birth_date like '195%', true, false) as 50s)
           )) as born_in_50s 
from dob_by_decades;

/* BONUS

What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
*/
-- Solution that Faith presented which is easier than trying to create a temp table as I was attempting
select dept_name,
          CASE 
               WHEN dept_name in('research', 'development') then 'R&D'
               WHEN dept_name in('production', 'quality management') then 'Prod & QM'
               WHEN dept_name in('Makrketing', 'sales') then 'Sales & Marketing'
               WHEN dept_name in('finance','human resources') then 'Finance & HR'
               else 'Customer Service'
               end as grouped_dept_name,
           AVG(Salary) as average salary     

from employees_with_departments as ewd
JOIN salaries as s on s.emp_no
;