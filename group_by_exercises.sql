-- 1. Create a new file named group_by_exercises.sql
use employees;


-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

select count(distinct title)
from titles;
	-- There have been 7 unique titles

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
select last_name
from employees
where last_name like 'e%e'
group by last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
select concat(first_name,' ', last_name) as full_name, count(*)
from employees
where last_name like 'e%e'
group by full_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
select last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
group by last_name;

    -- Chleq, Lindqvist, Qiwen

-- 6. Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
select last_name, count(*)
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
group by last_name
order by last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
select first_name,
		gender, count(*)
from employees
where first_name in ('irena', 'vidya', 'maya')
group by first_name, gender;
-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
select  lower(
		concat(
			substr(first_name, 1, 1),
			substr(last_name, 1, 4),
			'_',
			substr(birth_date, 6, 2),
			substr(birth_date, 3, 2)	
				)
			) as username, count(*) as duplicate_count
from employees
group by username
HAVING duplicate_count > 1
ORDER BY duplicate_count desc;

