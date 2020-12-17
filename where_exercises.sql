-- 1 Start
use employees;
describe employees;

-- 2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya');

	-- results: 709 records


-- 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead  of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

select *
from employees
where (first_name = 'Irena' 
	or first_name = 'Vidya' 
	or first_name = 'Maya');

	-- results: 709 records 

-- 4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

select *
from employees
where (first_name = 'Irena' 
	or first_name = 'Vidya' 
	or first_name = 'Maya')
and (gender = 'M');

	-- 441 records returned

-- 5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.


select *
from employees
where last_name LIKE 'E%';
	-- 7330 records returned

-- 6A Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 

select *
from employees
where last_name like 'e%' or last_name like '%e';

	-- 30723 records returned
	
-- 6B How many employees have a last name that ends with E, but does not start with E?

select count(*)
from employees
where last_name like '%e'
and last_name not like 'e%';

	-- 23393 records returned
	
-- 7A Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. 

select *
from employees
where last_name like 'e%' and last_name like '%e';

	-- shortcut
	select *
	from employees
	where last_name like 'e%e';

	-- 899 records returned

-- 7B How many employees' last names end with E, regardless of whether they start with E?

select count(*)
from employees
where (last_name like '%e');

	-- 24292 records returned

-- 8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT *
FROM employees
WHERE hire_date LIKE '199%';	

	-- 135214 records returned
	
-- 9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
select *
from employees
where birth_date like '%-12-25';
	
	-- 842 records returned


-- 10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
select *
from employees
where birth_date like '%-12-25'
and hire_date like '199%';
	-- 362 records returned

-- 11 Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

select *
from employees
where last_name like '%q%' ;

	-- 1873 records returned

-- 12vFind all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
select *
from employees
where last_name like '%q%'
and last_name not like '%qu%';

	-- 547 records returned
