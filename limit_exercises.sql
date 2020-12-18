use employees;

-- 1. Create a new SQL script named limit_exercises.sql.

-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order.

select distinct last_name
from employees
order by last_name desc
limit 10; 

/*Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker */

-- 3. 
	-- a.Find all previous or current employees hired in the 90s and born on Christmas. 

select *
from employees
where  hire_date like '199%'
	and birth_date like '%-12-25';
	
	-- b.Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 	5 records. Write a comment in your code that lists the five names of the employees returned.es
select *
from employees
where  hire_date like '199%'
order by hire_date
limit 5;	
	
	-- 24751	1953-01-24	Aiman	Hainaut	M	1990-01-01
	-- 21865	1964-10-24	Lillian	Stiles	M	1990-01-01
	-- 18199	1953-02-25	Teruyuki	Sridhar	M	1990-01-01
	-- 18873	1961-03-05	Sashi	Demeyer	F	1990-01-01
	-- 28869	1961-01-08	Tomofumi	Rattan	M	1990-01-01


-- 4a. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
select *
from employees
where  hire_date like '199%'
order by hire_date
limit 5 offset 45;


-- 4b. LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?

       -- Offset/Limit + 1 = Page Number (This is because page 1 is limit x, offset 0)