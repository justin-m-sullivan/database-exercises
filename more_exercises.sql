# More Exercises for MySQL Review
```
# Employees Database
use employees;
```

## 1. How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
```
use `easley_1270`;

create temporary table mgr_salaries as(
select salary as mgr_salary, d.dept_name
from employees.salaries
join employees.dept_manager as dm using (emp_no)
join employees.departments as d using (dept_no)
where dm.to_date > curdate()
and salaries.to_date > curdate());


create temporary table avg_dept_salary as(select d.dept_name, avg(s.salary) as avg_dept_salary
from employees.departments as d
JOIN employees.dept_emp as de on de.dept_no = d.dept_no
     AND de.to_date > curdate()
JOIN employees.salaries as s on s.emp_no = de.emp_no
     AND s.to_date > CURDATE()
Group By d.dept_name
);

alter table avg_dept_salary modify avg_dept_salary decimal(8,0);

select *
from avg_dept_salary
join mgr_salaries using (dept_name);
```
/*
dept_name	avg_dept_salary	mgr_salary
Marketing	80059	106491
Finance	78560	83457
Human Resources	63922	65400
Production	67843	56654
Development	67658	74510
Quality Management	65442	72876
Sales	88853	101987
Research	67913	79393
Customer Service	67285	58745 */

-- World Database
## What languages are spoken in Santa Monica?
```
select language, percentage
from countrylanguage
where countrycode in ('USA');
```

## How many different countries are in each region?
```
select region, count(name) as num_countries
from country
group by region;
```

## What is the population for each region?
```
select region, sum(population) as population
from country
group by region;
```

## What is the population for each continent?
```
select continent, sum(population) as population
from country
group by continent;
```

## What is the average life expectancy globally?
```
select avg(LifeExpectancy)
from country;
```

## What is the average life expectancy for each region, each continent? Sort the results from shortest to longest
```
select continent, avg(LifeExpectancy)
from country
group by continent asc;

select region, avg(LifeExpectancy)
from country
group by region asc;
```
# Sakila Database
## 1. Display the first and last names in all lowercase of all the actors.
```
select lower(first_name), lower(last_name)
from actor;
```

## 2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
```
select actor_id, first_name, last_name
from actor
where first_name in('Joe');
```

## 3. Find all actors whose last name contain the letters "gen":
```
select *
from actor
where last_name like '%gen%';
```

## 4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
```
select *
from actor
where last_name like '%li%'
order by last_name, first_name;
```

## 5. Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
```
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');
```

## 6. List the last names of all the actors, as well as how many actors have that last name.
```
select last_name, count(last_name)
from actor
group by last_name;
```

## 7. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

## 8. You cannot locate the schema of the address table. Which query would you use to re-create it?
```
show create table address;
```

## 9 Use JOIN to display the first and last names, as well as the address, of each staff member.
```
select first_name, last_name, address
from staff
join address using(address_id);
```

/*
## 10. Use JOIN to display the total amount rung up by each staff member in August of 2005.
List each film and the number of actors who are listed for that film.
How many copies of the film Hunchback Impossible exist in the inventory system?
The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
Use subqueries to display all actors who appear in the film Alone Trip.
You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
Write a query to display how much business, in dollars, each store brought in.
Write a query to display for each store its store ID, city, and country.
List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.) */