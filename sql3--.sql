create database qqq;
use qqq;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
select * from employees;
select avg(salary) from employees; -- 74285.7143
select salary from employees where emp_id=101;
select * from employees where salary>(select salary from employees where emp_id=101);
select department from employees where salary=(select min(salary) from employees);
select * from employees
where department in (select department from employees where name='alice' or name='bob');
select salary from employees where emp_id=103 or emp_id=107;
select * from employees where salary >any (select salary from employees where emp_id=103 or emp_id=107);
select * from employees where salary <any (select salary from employees where emp_id=103 or emp_id=107);
select salary from employees where department='hr';
select * from employees where salary >any(select salary from employees where department='hr');
select * from employees where salary >all(select salary from employees where department='hr');
select salary from employees where department='it';
select * from employees where salary >any(select salary from employees where department='it');
select * from employees where salary >all(select salary from employees where department='it');
select * from employees where salary >any(select salary from employees where department='hr');
select * from employees where salary >all(select salary from employees where department='hr');
-- q1
select name from employees where department='it';
select salary from employees where emp_id=101;
select * from employees where department='it' and salary >(select salary from employees where emp_id=101);
-- q2
select salary from employees where department='it' or department='hr';
select name from employees where salary>all(select salary from employees where department='it' or department='hr');
-- q3
select * from employees;
select salary from employees where manager_id=101;
select emp_id,name from employees where salary >any (select salary from employees where manager_id=101);
-- q4 
select max(salary) from employees;
select max(salary) from employees where salary < (select max(salary) from employees);
SELECT MAX(salary)
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);








