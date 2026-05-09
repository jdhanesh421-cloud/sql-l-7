use mysql_employees;
select * from employee;
use joinpractice;
select * from departments;
select * from employees;
-- Display employee names along with their department names.
select e.emp_name,d.dept_name from employees  as e join departments as d on e.dept_id=d.dept_id;
-- 
-- Display all employees and their department names, including employees without departments.
select e.emp_name,d.dept_name from employees  as e left join departments as d on e.dept_id=d.dept_id;
-- Find the number of employees in each department.
select count(e.emp_id),d.dept_name from employees  as e join departments as d on e.dept_id=d.dept_id group by d.dept_name;
select * from employees;
-- Display all departments and the total salary paid in each department.

select * from departments;
select m.emp_name,count(*) from employees as e join employees as m
 on e.manager_id=m.emp_id group by m.emp_name ;
 SELECT m.emp_name AS manager_name,
       COUNT(e.emp_id) AS total_employees
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;
-- Display average salary department-wise where average salary is greater than 60000.
use sakila;
select * from actor;
select *  from film_actor;

select * from film;
-- select actor_id,actor ka full name also the film id

select a.actor_id,concat(first_name,last_name),film_id from actor as a join film_actor as f on a.actor_id=f.actor_id ;
--
SELECT f.film_id,f.title, fa.actor_id FROM film AS f JOIN film_actor AS fa ON f.film_id = fa.film_id;
select * from film;
-- find the actor_id, actor_name,and the move has work
SELECT a.actor_id,
CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
f.title AS movie_name FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;