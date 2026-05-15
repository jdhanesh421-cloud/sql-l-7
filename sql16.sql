create database qqqqq;
use qqqqq;
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
create table departments (dept_id int,dept_name varchar(20),location varchar(20));
INSERT INTO departments
VALUES
(10, 'hr', 'mumbai'),
(20, 'it', 'banglore'),
(30, 'finance', 'delhi');
insert into departments values(10,'hr','mumbai'),(20,'it','banglore'),(30,'finance' ,'delhi');
select * from departments;
use qqqqq;
select * from employees;
-- where department=select dept_name  from departments where location in('banglore','delhi'));
select avg(salary) from employees where department='it';
select * from employees as e where salary>(select avg(salary) from 
employees where department=e.department);
use qqqqq;
select max(salary) from employees  where department='it';

select * from employees as e where salary=(select max(salary) from employees  where department=e.department);
select salary ,department from employees where salary>70000 and department='it';

select * from employees as e where 70000 <all(select salary from employees where department=e.department);

select * from employees as e where 50000 <=all(select salary from employees where department=e.department);
use qqqqq;
select * from employees;
select emp_id,name,salary,avg(salary) over(),salary-avg(salary) over()  from employees;
select emp_id,name,salary,avg(salary) over()  from employees;
select emp_id,name,salary,avg(salary) over(),salary-avg(salary) over(),min(salary) over()  from employees;
select emp_id,name,salary,sum(salary) over(),concat(round(salary/sum(salary) over() )*100,'%')
from employees;
select emp_id,name,salary,sum(salary) over(order by salary) from employees;
-- what is running sum 
select emp_id,name,salary,department,sum(salary) over(order by department) from employees;














