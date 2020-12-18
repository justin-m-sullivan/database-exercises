use `employees`;

-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
           
-- 2.Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select *
from employees
where first_name in('irena','vidya','maya')
order by first_name; 

	-- First returned record: Irena Reutenauer
	-- Last return record: Vidya Simmen
	
	

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select *
from employees
where first_name in('irena','vidya','maya')
order by first_name, last_name; 
	
	-- First returned record: Irena Acton
	-- Last return record: Vidya Zweizig
	
	
-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

select *
from employees
where first_name in('irena','vidya','maya')
order by last_name, first_name; 
	
	-- First returned record: Irena Acton
	-- Last return record: Maya Zyda

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

select *
from employees
where last_name like 'e%e'
order by emp_no;

	-- No. of employees returned = 899
	-- First record returned: em_no = 10021, Ramzi Erde
	-- Last Record returned: em_no = 499648, Tadahiro Erde
	

-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.

select *
from employees
where last_name like 'e%e'
order by hire_date desc;

	-- No. of employees returned = 899
	-- Newest Employee: Teji Eldridge
	-- Oldest Employee: Erde Sergi

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.

select *
from employees
where hire_date like '199%'
	AND birth_date like '%-12-25'
order by birth_date asc, hire_date desc;

	-- No of employees returned: 362
	-- Name of oldest employee most recently hired: Khun Bernini
	-- Name of youngest employee hired first: Douadi Pettis

