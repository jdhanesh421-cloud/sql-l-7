-- dcl 
select * from mysql.user;
create user ishan identified by '123';
select current_user();
create database testdb4;
use testdb4;
create table emp(id int,name varchar(20));
insert into emp values(11,'raj'),(21,'sanjay');
create table emp1(id int,name varchar(20));
insert into emp1 values(22,'raju'),(23,'amit');
select * from emp;
select * from emp1;
REVOKE DELETE ON emp FROM ishan;
show grants for ishan;
grant select on testdb4.emp to ishan;
grant delete on testdb4.* to ishan;
GRANT SELECT, INSERT
ON emp TO ishan;
GRANT SELECT, INSERT
ON emp1 TO ishan;
GRANT SELECT ON emp1 to ishan;
create table emp1(id int,name varchar(20),age int);
ALTER TABLE emp1 ADD age testdb4;
commit;