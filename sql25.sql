CREATE DATABASE IF not exists datatypedb;
use datatypedb;
-- numeric
create table test1(id tinyint);
insert into test1 values(-1),(10);
insert into test1 values(-129); -- out of range(1 byte =>8bit =>2**8(-128 to 127)
select * from test1;
-- small int -->2byte  medium int-->3byte
-- int --> 4byte
-- big int -->8 byte
create table test2(age tinyint unsigned);
insert into test2 values(250);
select * from test2;

create table test3(salary float,salary2 double);
insert into test3 values (1989.9301934,1989.9301934);
select * from test3;
create table test4(price double(6,2)); -- total is 6 ,2 is decimal value, 4 are the value before only 2 decimal values 
insert into test4 value(0.7326);
insert into test4 value(11.7326);
insert into test4 value(999.7326);
insert into test4 value(9876.7326);
insert into test4 value(98776.7326);-- total is 6 ,2 is decimal value, 4 are the value before only 2 decimal values(error reason)

select * from  test4;

create table test5(countrycode char(3));
insert into test5 values('ind');
insert into test5 values('india'); -- give me error char(3) fixed ker diye isliye
insert into test5 values('he      ');
select *,char_length(countrycode) from test5;

create table test6(countrycode varchar(3));
insert into test6 values('ind');
insert into test6 values('india'); -- give me error char(3) fixed ker diye isliye
insert into test6 values('he      ');
select *,char_length(countrycode) from test6;

