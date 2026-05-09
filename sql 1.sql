show databases;
create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);
select * from product;
select * from orders;
use sakila;
desc actor;

GROUP BY and joins practice.pdf
PDF

SQL BATCH - L 3 - 2025/10/09 09:53 GMT+05:30 – Recording
Video


Post by REGex Software
REGex Software
Created 8 Oct 20258 Oct 2025
8th oct - subquery
SQL BATCH - L 3 - 2025/10/08 09:50 GMT+05:30 – Recording
Video


Post by REGex Software
REGex Software
Created 7 Oct 20257 Oct 2025 (Edited 7 Oct 2025)
-- self join example (query)
drop database if exists regex123;

create database regex1231;
use regex1231;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);


INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- CEO
(2, 'Bob', 1),            -- VP of Sales
(3, 'Carol', 1),          -- VP of Engineering
(4, 'David', 2),          -- Sales Manager 1
(5, 'Eve', 2),            -- Sales Manager 2
(6, 'Frank', 3),          -- Engineering Manager 1
(7, 'Grace', 3),          -- Engineering Manager 2
(8, 'Heidi', 4),          -- Salesperson under David
(9, 'Ivan', 4),           -- Salesperson under David
(10, 'Judy', 5),          -- Salesperson under Eve
(11, 'Mallory', 6),       -- Engineer under Frank
(12, 'Niaj', 6),          -- Engineer under Frank
(13, 'Olivia', 7),        -- Engineer under Grace
(14, 'Peggy', 7),         -- Engineer under Grace
(15, 'Trent', 3);         -- Tech Lead under Carol (no direct reports)


select * from employees;

CREATE DATABASE companny_db;
USE companny_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Riya', 'Mumbai'),
(3, 'Rahul', 'Jaipur'),
(4, 'Sneha', 'Delhi');
select * from customers;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products VALUES
(1, 'Mobile', 10000),
(2, 'Laptop', 50000),
(3, 'Headphones', 2000);
select * from products;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders VALUES
(101, 1, 1, 500, '2024-01-10'),
(102, 1, 2, 700, '2024-01-12'),
(103, 2, 1, 300, '2024-01-15'),
(104, 3, 3, 900, '2024-01-20'),
(105, 1, 2, 400, '2024-01-25'),
(106, 2, 3, 800, '2024-01-28');
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');
select * from orders;
select * from products;
select p.product_name,sum(o.amount) from products as p
 join orders as o on o.product_id= p.product_id group by product_name;
 select *  from departments;
 select * from orders;
 -- group by department
 -- sum 
 select dp.department_name,sum(o.amount) from orders as o
 join products as p on p.product_id = o.product_id
 join departments dp
    ON p.department_id = dp.department_id
 group by dp.department_name;
 SELECT dp.department_name, SUM(o.amount)
FROM orders AS o
JOIN products AS p 
    ON p.product_id = o.product_id
JOIN departments dp
    ON p.department_id = dp.department_id
GROUP BY dp.department_name;
select * from products;
select * from orders;
select * from departments;
select * from customers;
create database jain;
use jain;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    join_date DATE
);
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi', '2022-01-10'),
(2, 'Riya', 'Mumbai', '2022-03-15'),
(3, 'Rahul', 'Delhi', '2023-05-20'),
(4, 'Sneha', 'Kolkata', '2021-11-25'),
(5, 'Karan', 'Mumbai', '2023-02-14');
select * from customers;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders VALUES
(101, 1, '2023-01-10', 500, 'Delivered'),
(102, 2, '2023-01-12', 700, 'Pending'),
(103, 1, '2023-02-05', 300, 'Delivered'),
(104, 3, '2023-02-10', 900, 'Cancelled'),
(105, 4, '2023-03-01', 1200, 'Delivered'),
(106, 2, '2023-03-15', 400, 'Delivered'),
(107, 5, '2023-04-01', 800, 'Pending'),
(108, 3, '2023-04-05', 650, 'Delivered');
select * from orders;
select * from customers;
select c.customer_name ,sum(o.amount) from customers as c
 join orders as o on c.customer_id = o.customer_id group by c.customer_name order by  sum(o.amount) desc
 limit 3;
 select c.customer_name ,count(o.order_id) from customers as c
 join orders as o on c.customer_id = o.customer_id group by c.customer_name having count(o.order_id)>2;
 
 select  * from orders;
 select * from customers;
 select  c.customer_name,sum(o.amount) from customers as c
 join orders as o on  c.customer_id = o.customer_id 
 where  status ='delivered'
 group by c.customer_name
 HAVING SUM(o.amount) > 1000;
-- Database create (optional)
CREATE DATABASE practice_db;
USE practice_db;

-- 1. Customers Table
create database rrr;
use rrr;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert data into Customers
INSERT INTO customers VALUES
(1, 'Aman', 'Jaipur'),
(2, 'Ravi', 'Delhi'),
(3, 'Neha', 'Mumbai'),
(4, 'Pooja', 'Jaipur'),
(5, 'Karan', 'Delhi');
select * from customers;
--------------------------------------------------

-- 2. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into Orders
INSERT INTO orders VALUES
(101, 1, '2023-01-10', 500, 'delivered'),
(102, 2, '2023-02-15', 1200, 'pending'),
(103, 1, '2023-03-05', 700, 'delivered'),
(104, 3, '2023-03-20', 1500, 'delivered'),
(105, 4, '2023-04-01', 800, 'cancelled'),
(106, 5, '2023-04-10', 2000, 'delivered'),
(107, 2, '2023-05-12', 900, 'delivered'),
(108, 3, '2023-06-18', 1100, 'pending'),
(109, 1, '2023-07-22', 400, 'delivered'),
(110, 4, '2023-08-05', 1300, 'delivered');
select * from orders;
select * from customers;
select c.city,sum(o.amount)from customers as c join orders as o on c.customer_id=o.customer_id group by city;
select c.customer_name,sum(o.amount) from customers as c join orders as o on c.customer_id=o.customer_id 
group by c.customer_name having sum(o.amount)>2000; 
select c.customer_name,count(o.customer_id)from customers as c join orders as o on c.customer_id=o.customer_id
 group by c.customer_name ;
 select c.customer_name,sum(o.amount)from customers as c join orders as o on c.customer_id=o.customer_id
 where status ='delivered'
 group by c.customer_name ;
 select * from customers;
 select * from orders;
 select month(o.order_date),SUM(o.amount) from customers as c
 join orders as o on c.customer_id=o.customer_id 
 group by month(o.order_date);
 select c.customer_name,sum(o.amount) from customers as c join orders as o on c.customer_id=o.customer_id 
group by c.customer_name order by sum(o.amount) desc
limit 3;
 select * from orders;
  select * from customers;
  create database rrrr;
  use rrrr;
  CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Neha', 'Mumbai'),
(3, 'Aman', 'Jaipur'),
(4, 'Priya', 'Pune'),
(5, 'Rohit', 'Delhi'),
(6, 'Sneha', 'Mumbai');
select * from customers;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount INT,
    order_date DATE,
    status VARCHAR(20)
);
INSERT INTO orders VALUES
(101, 1, 2000, '2026-03-25', 'delivered'),
(102, 2, 1500, '2026-03-20', 'pending'),
(103, 1, 3000, '2026-02-15', 'delivered'),
(104, 3, 2500, '2026-01-10', 'cancelled'),
(105, 4, 4000, '2026-03-05', 'delivered'),
(106, 5, 1200, '2026-02-28', 'delivered'),
(107, 6, 1800, '2026-03-15', 'pending'),
(108, 2, 2200, '2026-02-10', 'delivered'),
(109, 3, 2700, '2026-03-01', 'delivered'),
(110, 4, 3500, '2025-12-20', 'delivered');
select * from orders;
 
 select order_id from orders
 where order_date>=date_sub(now(),interval 7 day);
 select current_user;
  -- kon konsw data base h
show databases;
use sakila;
show tables;
show tables;
select * from customer;
select * from actor;
use sakila;
show tables;
select * from customer;
select first_name,customer_id from customer where first_name ='lisa';
select * from customer where  customer_id  between 2 and 5;
use sakila;
select * from customer;
select first_name,concat_ws('><','mrs',first_name,'sharma' )from customer;
select first_name,email from customer;
select first_name,substr(first_name,1,2)from customer;
select first_name,replace(first_name,'A','p')from customer;

SELECT first_name,
       LOWER(REPLACE(first_name, 'A', 'x')) AS new_name
FROM customer;
select first_name,substr(first_name,-2,2) from customer;
select first_name from customer where first_name like 'R%N';
select first_name from customer where first_name like '%A%' and  first_name like '_____';
select first_name from customer where first_name like '_A%';
use sakila;
select * from customer;
select * from customer
where year(create_date) =2005;
select first_name,create_date,month(create_date) from customer where first_name like'N%' and month(create_date)>=1 and month(create_date)<=6;
select upper(first_name),create_date,month(create_date) from customer where year(create_date)=2005;
use sakila;
select payment_date,extract(month from payment_date) from payment;
select now();
select * from payment;
create database rjj;
use rjj;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(50),
job_title VARCHAR(60),
salary DECIMAL(10,2),
hire_date DATE,
birth_date DATE,
phone VARCHAR(20),
city VARCHAR(50),
country VARCHAR(50),
is_active CHAR(1)
);
INSERT INTO employees VALUES
(1, 'Alice', 'Smith', 'alice.smith@gmail.com', 'IT', 'Software Engineer', 85000.00,'2019-03-15','1990-06-20','555-1001','New York','USA','Y'),
(2, 'Bob', 'Johnson', 'bob.j@yahoo.com', 'HR', 'HR Manager', 72000.00,'2020-07-01','1985-11-05','555-1002','Chicago','USA','Y'),
(3, 'Carol', 'Williams', 'carol.w@gmail.com', 'Finance', 'Accountant', 65000.00,'2018-01-10','1992-03-14','555-1003','Houston','USA','Y'),
(4, 'David', 'Brown', 'david.b@outlook.com', 'IT', 'DevOps Engineer', 90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles','USA','Y'),
(5, 'Emma', 'Jones', 'emma.j@gmail.com', 'Marketing', 'Marketing Lead', 78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix','USA','Y'),
(6, 'Frank', 'Garcia', 'frank.g@yahoo.com', 'Sales', 'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia','USA','N'),
(7, 'Grace', 'Martinez', 'grace.m@gmail.com', 'IT', 'QA Engineer', 68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio','USA','Y'),
(8, 'Henry', 'Davis', 'henry.d@outlook.com', 'Finance', 'Financial Analyst', 76000.00,'2019-06-15','1989-04-17','555-1008','San Diego','USA','Y'),
(9, 'Isla', 'Wilson', 'isla.w@gmail.com', 'HR', 'Recruiter', 60000.00,'2021-10-05','1995-08-22','555-1009','Dallas','USA','Y'),
(10, 'Jack', 'Moore', 'jack.m@yahoo.com', 'Marketing', 'SEO Specialist', 58000.00,'2023-01-09','1997-01-15','555-1010','San Jose','USA','Y'),
(11, 'Karen', 'Taylor', 'karen.t@gmail.com', 'Sales', 'Sales Manager', 82000.00,'2016-04-20','1984-05-30','555-1011','Austin','USA','Y'),
(12, 'Liam', 'Anderson', 'liam.a@outlook.com', 'IT', 'Data Scientist', 95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville','USA','Y'),
(13, 'Mia', 'Thomas', 'mia.t@gmail.com', 'Finance', 'Tax Consultant', 71000.00,'2022-06-01','1993-06-15','555-1013','Columbus','USA','Y'),
(14, 'Noah', 'Jackson', 'noah.j@yahoo.com', 'IT', 'System Admin', 80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte','USA','N'),
(15, 'Olivia', 'White', 'olivia.w@gmail.com', 'HR', 'HR Assistant', 50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis','USA','Y'),
(16, 'Paul', 'Harris', 'paul.h@outlook.com', 'Marketing', 'Content Writer', 52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn', 'Clark', 'quinn.c@gmail.com', 'Sales', 'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle','USA','Y'),
(18, 'Rachel', 'Lewis', 'rachel.l@yahoo.com', 'Finance', 'Budget Analyst', 73000.00,'2019-12-01','1991-01-30','555-1018','Denver','USA','Y'),
(19, 'Sam', 'Robinson', 'sam.r@gmail.com', 'IT', 'Cloud Architect', 105000.00,'2017-05-22','1986-07-19','555-1019','Nashville','USA','Y'),
(20, 'Tina', 'Walker', 'tina.w@outlook.com', 'HR', 'Training Manager', 69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore','USA','Y'),
(21, 'Uma', 'Hall', 'uma.h@gmail.com', 'Marketing', 'Brand Manager', 77000.00,'2018-10-17','1990-08-25','555-1021','Louisville','USA','N'),
(22, 'Victor', 'Young', 'victor.y@yahoo.com', 'Sales', 'Sales Director', 98000.00,'2015-02-10','1980-03-07','555-1022','Portland','USA','Y');
select * from employees;
select emp_id,upper(first_name),lower(last_name),salary from employees where emp_id in(3,8,13,18);
select emp_id,first_name,last_name,department,job_title from employees where department in ('IT','finance');
select emp_id,concat(first_name ,' ',last_name) as full_name,length(concat(first_name ,' ',last_name)) as full_name_length,department from employees where department='marketing';
select * from employees;
select emp_id,first_name,last_name,year(hire_date),hire_date,year(now())-year(hire_date) from employees;
-- 11
select emP_id,first_name,last_name,email from employees WHERE email LIKE '%@outlook.com';
-- 12
SELECT emp_id, first_name, last_name, hire_date,DATEDIFF('2026-04-28', hire_date)
FROM employees
WHERE DATEDIFF('2026-04-28', hire_date) >2000 ;
SELECT emp_id, first_name, last_name,substr(email,1,instr(email,'@')-1)as username,email from employees; 
select concat(first_name,' ',last_name)as full_name,department,salary from employees where department not in ('it') and salary<60000 or salary >80000;
select * from employees;
SELECT CONCAT(first_name,' ',last_name) AS full_name, department, salary
FROM employees
WHERE department NOT IN ('IT', 'Finance')
AND (salary < 60000 OR salary > 80000;
use rrj;
select concat(first_name,' ',last_name)as full_name,department,salary from employees
 where department not in ('IT','Finance') and (salary<60000 or salary>80000);
 -- 11
 select emp_id,first_name,last_name,datediff(now(),hire_date)-1,hire_date from employees
 where datediff(now(),hire_date)-1>2000;
 -- 12
 select first_name,last_name ,emp_id,email,substr(email,1,instr(email,'@')-1 ) as username from employees;
 -- 14
  select emp_id, first_name,last_name ,email,
  upper(substr(email,1,instr(email,'@')-1 )) as username,
  char_length(substr(email,1,instr(email,'@')-1 ) )as username_length from employees where char_length(substr(email,1,instr(email,'@')-1 ) )>6;
 -- 15
 select * from employees;
 select emp_id,concat(first_name,' ',last_name)as full_name,birth_date,
 department,salary,year(now())-year(birth_date)-1 as age
 from employees where year(now())-year(birth_date)-1 between 30 and 38 and salary>65000;
 -- 1
 select emp_id,first_name,last_name ,department,salary from employees where salary between 65000 and 85000;
 select* from employees;
 -- 2
 select emp_id,first_name,last_name ,department,job_title from employees 
 where department in('it','finance');
 -- 8
 select emp_id,first_name,last_name,hire_date,year(hire_date) ,year(now())-year(hire_date)  from employees;
 -- 9
 select emp_id,first_name,last_name,salary,
 round(salary,-4)as rounded_salary,
 round(salary,-4)-salary as arounded_salary from employees;
 SELECT TRUNCATE(123.4567,1);
  select ROUND(1255, -2);
  -- order by
 
  select first_name,department,salary from employees
 order by department,salary;
 select salary,hire_date,year(hire_date) from employees
 order by year(hire_date) ,salary desc;
 select distinct 
 department from employees;
 select distinct department,salary from employees;
 select count(*),count(department) from employees;
 use sakila;
 select count(distict),count(addess_id),count(address2) from address;
  --
  use rjj;
  select * from employees;
  select max(salary),min(salary),avg(salary) from employees;
  select count(department),count(distinct department) from employees;
  use rjj;
  select sum(salary) from employees where department='it';
  select sum(salary),count(salary)  from employees where department='finance';
  -- group by 
  select department from employees group by department;
  select department ,count(department)  from employees group by department;
  select distinct department from employees;
select department ,sum(salary)  from employees group by department;
select *  from employees where job_title='marketing lead';
use sakila;
select * from payment;
-- form this payment tabel find the total amount and the average amount
select sum(amount),avg(amount)from payment;
-- from this paymnet table find the  total number of tanjection  customer id1
select count(amount)from payment where customer_id=1;
-- find the total number of tranjecttion customer id=2 and cus5
select count(amount) from payment where customer_id in(2,5) group by customer_id;
select count(amount)from payment where customer_id=5;

select * from payment;
select avg(amount) from payment where year(payment_date)=2005;
-- 1 find now also get total tranjection and total amount spent after the customer_id =3;
select customer_id,count(amount),sum(amount) from payment 
where customer_id not in (1,2,3) group by customer_id;
-- 2 find the accreens each amount values
select amount,count(amount) from payment group by amount;
use rjj;
use sakila;
select * from payment;
-- find the total amount given in your data
select sum(amount) from payment;
-- get the average amount spent by each staff
select staff_id,avg(amount) from payment group by staff_id;
-- get the  total amount spent and each month
select sum(amount),month(payment_date) from payment  group by month(payment_date) order by month(payment_date);
-- get the total amount spent for each month of each year
select sum(amount),month(payment_date),year(payment_date) from payment  group by month(payment_date),year(payment_date); 
use rjj;
select * from employees;
use sakila;
select * from payment;
select customer_id from payment where customer_id>=3 group by customer_id;
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);
INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');
select * from sales;
select sum(amount) from sales;
select sum(amount) as total_sales from sales where product='mobile';
--  but for the product  la\
select sum(amount),avg(amount) from sales where region='north' and product in('laptop','mobile');
select * from sales;
-- unit to find out  the maxiumumn and minimum amount and maxiumum amount fearbuary month ka
select max(amount),min(amount) from sales where month(sale_date)=2;
-- 1
select * from sales;
use rjj;
select sales_person,sum(amount) from sales group by sales_person;
-- 2 
select sales_person,avg(amount) from sales group by sales_person;

-- 3
select sales_person,sum(amount),count(amount) from sales where sales_person not in ('amit') group by sales_person;
-- 4
select sales_person,count(amount) from sales where amount >10000 group by sales_person;
-- 5
select * from sales;
select count(amount),day(sale_date) from sales where day(sale_date) ;
-- 6
select product,region,sum(amount),avg(amount),max(amount) from sales group by product,region;

-- 7
select sum(amount),count(amount),product from sales where count(amount)>12  group by  product;
create database rr;
use rr;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);
INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);
select * from orders;
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select category,sum(ordervalue) from orders group by category order by sum(ordervalue) desc;
-- Q2. Count the total number of orders placed in each Category.
select * from orders;
select count(orderID),category from orders group by category;
-- Q3. Find the highest (maximum) single OrderValue within each Category.
select max(ordervalue),category from orders group by category order by max(ordervalue) desc ;
-- List all unique product Categories that appear in the Sales_Data table.
select * from orders;
SELECT DISTINCT Category
FROM Orders;
-- List all unique CustomerIDs who have placed at least one order.
select distinct customerid,orderid from orders where orderid>1;
-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
SELECT DISTINCT CustomerID, Category
FROM Orders;
-- LEVEL 3 — MEDIUM GROUP BY with Multiple Columns
-- Hint: Group records by more than one column simultaneously to create multi-dimensional summaries.
select * from orders;
select orderid,customerid,category from orders group by orderid,customerid,category;
SELECT
CustomerID,
Category,
SUM(OrderValue) AS Total_Revenue
FROM Sales_Data
GROUP BY CustomerID, Category
ORDER BY CustomerID, Category;
use rjj;
select * from  sales;
use sakila;
select category,sum(ordervalue) from orders group by category order by sum(ordervalue) desc;
-- 
 select count(amount),sales_person from sales group by sales_person having count(amount)>8;
 select count(amount),sales_person from sales group by sales_person order by sum(amount) desc;
 select sales_person,product,count(amount)
 from sales group by sales_person ,product;
 select * from payment;
 select year(payment_date),month(payment_date),sum(amount) from payment
 group by year(payment_date),month(payment_date);
 use sakila;
 create database sakila1;
 use sakila1;
 CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);
INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),


(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');
 
select * from orders;
-- How many orders were placed in each city? (Sort by city A–Z)
select city,count( price) as total_orders from orders  
group by city order by city;
-- What is the total revenue (price × quantity) earned from each category? (Sort by
-- total_revenue DESC)
select * from orders;
select category,sum(price*quantity) as total_revenue from orders
 group by category order by total_revenue desc;
 -- How many orders belong to each category? (Sort by category A–Z)
 select * from orders;
 select category,count(price) from orders group by category order by category;
 -- Q4. What is the average price of orders in each city? Round to 2 decimal places. (Sort by
  select * from orders;
select city,round(avg(price),2),count(price) from orders group by city order by city;
-- What is the maximum price of a product in each category? (Sort by category A–Z)
select category,max(price) from  orders group by category order by category;
-- What is the minimum price of a product ordered in each city?
select * from orders;
select city,min(price) from orders group by city order by city;
use sakila1;
select * from orders;
-- Q7. What is the total quantity of items sold per category? (Sort by total_quantity DESC)
select sum(quantity),category from orders group by category;
-- Q8. List each city along with the total number of items ordered (sum of quantity). (Sort by
-- total_items DESC)
select * from orders;
select count(price),city,sum(quantity) as total_item from orders group by city order by total_item desc;
-- Q9. Find cities that have more than 3 orders. Show city and order count. (Sort by
-- order_count DESC)
select * from orders;
select city,count(price) as order_count from orders group by city having order_count >3 order by order_count desc;
-- Q10. Find categories where the total revenue (price × quantity) is more than 50000. (Sort by
-- total_revenue DESC)
select category,sum(price*quantity) as total_revenue from orders group by category
 having total_revenue>50000 order by total_revenue desc;
 
 -- Q11. Which cities have an average order price greater than 10000? Show city and
-- avg_price. (Sort by avg_price DESC)
select * from orders;

select avg(price) as avg_price,city from orders group by city
 having avg_price>10000 order by avg_price desc;
 -- Q12. Find the total revenue per city, but only include orders from the 'Electronics' category.
-- (Sort by total_revenue DESC)
select * from orders;
select city, sum(price) as total_revenue from orders 
where category='electronics' group by city order by total_revenue desc;
-- Q13. Find categories where the total quantity sold is greater than 8. (Sort by total_qty
-- DESC)
select * from orders;
select category,sum(quantity) as total_qty from orders group by category
 having total_qty>8 order by total_qty desc;
 -- Q14. Find the number of distinct cities from which each category received orders. (Sort by
-- category A–Z)
select * from orders;
select category,count(distinct city) from orders group by category order by category;
SELECT category, COUNT(DISTINCT city) AS distinct_cities
FROM orders
GROUP BY category
ORDER BY category ASC;
-- Q15. List cities where the minimum order price is less than 2000. Show city and min_price.
-- (Sort by min_price ASC)
select * from orders;
select min(price)as min_price,city from orders
 group by city having min_price<2000 order by min_price ;
 -- Q16. Find each city's total revenue (price × quantity). Show only cities where total revenue
-- is between 30000 and 100000. (Sort by total_revenue DESC
select * from orders;

use rr;
select city,sum(price*quantity) as total_revenue from orders group by city
 having total_revenue between 30000 and 100000 order by total_revenue desc;
 -- Q17. For each combination of city and category, find the total revenue. Show only
-- combinations where total revenue > 20000. (Sort by total_revenue DESC)
select * from orders;
select city,category,sum(price) as total_revenue from orders
group by city,category
having total_revenue>2000  order by  total_revenue desc;
use sakila;
select * from payment;
select * from employees;
-- if(condition ,truestatement,false statement)
select first_name ,department,salary,if(department='it',true,false)from employees;
select first_name ,department,salary,if(department='it',salary*1.1,salary*1.05)from employees;
select first_name ,department,salary,if(department='it',salary)from employees;
select first_name,department,salary,
case
    when department='it' then true 
    else 'non it'
end 
from employees;
select first_name,department,salary,
case
    when department='it' or department='hr' then 'a category' 
    else 'b category'
end 
from employees;
select first_name,department,salary,
case
    when department='it' then salary*1.1
	when department='hr' then salary*1.05
    else salary
end as new_salary
from employees;
select * from employees;
select department,job_title,
case 
    when year(hire_date)<2020  then concat('senior',job_title)
    when year(hire_date)=2021 then  concat('assocate',job_title)
    else job_title
end
from employees;  
select * from employees;
select salary,
case 
    when salary>100000  then 'strim high salary'
    when salary>85000 then 'high_salary'
    when salary >70000 then'avg_salary'
    else salary
end as new_salary
   from employees;
select job_title,count(job_title),
case 
    when count(job_title)=1 then concat(job_title,'position have',count(job_title),'person')
     when count(job_title)>1 then concat(job_title,'position have',count(job_title),'person')
    else job_title
end 
    from employees group by job_title;
    create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');
select * from customers;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');
select * from orders;
select customers.customer_id,customers.customer_name,orders.product_name from customers
join orders where customers.customer_id=orders.customer_id;
create database tushardb;
use tushardb;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50),
    EnrollmentYear INT
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



-- Students Table
INSERT INTO Students VALUES
(1, 'Aditi Sharma', 'Computer Science', 2022),
(2, 'Rohan Patel', 'Mechanical', 2023),
(3, 'Sara Khan', 'Computer Science', 2022),
(4, 'Michael Brown', 'Civil', 2023),
(5, 'Neha Gupta', 'Mechanical', 2024),
(6, 'David Miller', 'Civil', 2022),
(7, 'Priya Verma', 'Computer Science', 2023);

-- Courses Table
INSERT INTO Courses VALUES
(101, 'Data Structures', 'Computer Science', 4),
(102, 'Thermodynamics', 'Mechanical', 3),
(103, 'Fluid Mechanics', 'Civil', 4),
(104, 'DBMS', 'Computer Science', 3),
(105, 'Machine Design', 'Mechanical', 4),
(106, 'Structural Analysis', 'Civil', 3),
(107, 'Operating Systems', 'Computer Science', 4);

-- Enrollments Table
INSERT INTO Enrollments VALUES
(1, 1, 101, '2025-01-10'),
(2, 1, 104, '2025-01-12'),
(3, 2, 102, '2025-01-11'),
(4, 2, 105, '2025-01-15'),
(5, 3, 101, '2025-01-13'),
(6, 3, 107, '2025-01-17'),
(7, 4, 103, '2025-01-16'),
(8, 5, 102, '2025-01-18'),
(9, 6, 103, '2025-01-19'),
(10, 7, 104, '2025-01-20'),
(11, 7, 107, '2025-01-21');
select * from students;
select * from enrollments;
select * from courses;
use regexjoin;
select * from customers;
select customers.customer_id,customers.customer_name,orders.product_name,orders.customer_id from customers
left join orders on customers.customer_id=orders.customer_id where product_name is null;
INSERT INTO orders
VALUES (106,11,'ice cream');
select * from orders;

select customers.customer_id,customers.customer_name,orders.product_name,orders.customer_id from customers
right join orders on customers.customer_id=orders.customer_id;

-- natural join 
select customer.customer_id,customer.customer_id;
create database dj;
use dj;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO employees (emp_id, emp_name, dept_id)
VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'Diana', 10),
(5, 'Edward', NULL);
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name)
VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');
use dj;
select * from employees;
select * from departments;
-- Q1: List the names of all employees along with their department names. Show only
-- employees who belong to a department.
-- Hint: You need only rows where both sides match.
-- employeename
-- departmet name
select e.emp_name ,d.dept_name from employees as e inner join departments as d on e.dept_id= d.dept_id;
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
-- Q2: List ALL employees with their department names. If an employee has no department,
-- show NULL for department nam
SELECT e.emp_name, d.dept_name
FROM employees e
left JOIN departments d
ON e.dept_id = d.dept_id;
-- Q3: Show all departments and the number of employees in each. Include departments with
-- ZERO employees.
-- all deoartment
-- number of employee
select * from employees;
select * from departments;
select d.dept_name,count(e.emp_id) from departments as d left join employees as e ON e.dept_id = d.dept_id group by d.dept_name;

SELECT d.dept_name,
COUNT(e.emp_id) AS employee_count
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);
select * from employees;
select e.emp_id,e.emp_name,e.manager_id,mngr.emp_id,mngr.emp_name from employees as e join employees as mngr
where e.manager_id=mngr.emp_id;
select e.emp_id,e.emp_name,e.manager_id,E.DEPARTMENT,Mngr.DEPARTMENT,mngr.emp_id,mngr.emp_name from employees as e join employees as mngr
where e.manager_id=mngr.emp_id and E.DEPARTMENT=Mngr.DEPARTMENT;
select e.emp_name,E.salary,Mngr.salary from employees as e join employees as mngr
where e.manager_id=mngr.emp_id  and E.salary>Mngr.salary;
select e.emp_name,E.salary,Mngr.emp_name,mngr.salary from employees as e join employees as mngr
where e.manager_id=mngr.emp_id ;
use joindb;
select e.emp_name, mngr.emp_name,gm.emp_name from employees as e join employees as mngr
on e.manager_id=mngr.emp_id JOIN employees gm
ON mngr.manager_id = gm.emp_id;
select * from employees;
select e.emp_name, mngr.emp_name,e.emp_id,mngr.emp_id from employees as e join employees as mngr
on e.manager_id = mngr.emp_id where e.emp_id=mngr.emp_id;


















    
    






    
  
  
  
  
  
  
  
  











    
  
  
  
  
  
  
  
  
  
  
  
 
 
 