create database windowsdb;
use windowsdb;
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);
  select * from employees;
create database qqqqqqq;
use qqqqqqq;
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);
INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);
select *,lag(sale_date,1) over() from sales;
select *,lead(sale_date,1) over() from sales;
select *,lag(sale_date,1,0) over(order by amount desc) from sales;
-- running sum
select *,sum(amount) over (rows between unbounded preceding and current row) from sales; 
select *,sum(amount) over (rows between 1 preceding and current row) from sales; 
select *,sum(amount) over (rows between unbounded preceding and 1 following) from sales;
select *,sum(amount) over (rows between current row and  1 following) from sales;
create database qqqqqqqq;
use qqqqqqqq;
CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);
INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);
select * from employees_sales;
select * from employee_attendance;

-- Find total sales by each department.
SELECT employee_name,
department,
sales_amount,
SUM(sales_amount) OVER(PARTITION BY department) AS total_department_sales
FROM employees_sales order by employee_name asc;
-- Find average sales per employee.
select * from employees_sales;
select employee_name,avg(sales_amount) over(partition by employee_name) from employees_sales;
-- Rank employees by sales within each department.
select department,employee_name,
sales_amount,rank() OVER(PARTITION BY department order by sales_amount desc) 
FROM employees_sales ;
-- 




