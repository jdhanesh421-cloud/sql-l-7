create  database dd;
use dd;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Rahul', 'HR', 25000),
(2, 'Aman', 'IT', 40000),
(3, 'Neha', 'Finance', 35000),
(4, 'Pooja', 'Marketing', 30000),
(5, 'Rohit', 'IT', 45000),
(6, 'Simran', 'HR', 28000),
(7, 'Karan', 'Finance', 50000),
(8, 'Anjali', 'Marketing', 32000),
(9, 'Vikas', 'IT', 38000),
(10, 'Priya', 'HR', 27000);
-- 1. Highest salary wale employee ka data nikalo
select * from employees;
select * from employees where salary = (select max(salary) from employees);
-- 2 2. Lowest salary wale employee ka naam nikalo
select emp_name from employees where salary = (select min(salary) from employees);
-- 3. Second highest salary nikalo
select max(salary) from employees where salary< (select  max(salary) from employees);
-- Second lowest salary nikalo
select min(salary) from employees;
select min(salary) from employees where salary> (select  min(salary) from employees);
-- Average salary se jyada salary wale employees dikhao
select emp_name from employees where salary >(select avg(salary) from employees);
-- Average salary se kam salary wale employees dikhao
select emp_name from employees where salary <(select avg(salary) from employees);

select * from employees;
-- Highest salary wale employee ka naam aur department dikhao
select emp_name,department from employees where salary = (select max(salary) from employees);
-- Aman ki salary se jyada salary wale employees dikhao
select salary from employees where emp_name ='aman';
select emp_name from employees where salary>(select salary from employees where emp_name ='aman');
-- Rahul ki salary se kam salary wale employees dikhao
select emp_name from employees where salary<(select salary from employees where emp_name ='rahul');
--  Finance department ki average salary se jyada earn karne wale employees dikhao
select emp_name from employees where salary<(select avg(salary)from employees where department ='finance');
-- . Maximum salary ke equal salary wale employees dikhao
select emp_name from employees where salary=(select max(salary)from employees );
-- Minimum salary ke equal salary wale employees dikhao
select emp_name from employees where salary=(select min(salary)from employees );
-- Above average salary employees
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
-- . HR department ki minimum salary
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
    WHERE department = 'HR'
);

    




