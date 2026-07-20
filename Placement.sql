-- ============================-- 
-- Phase : 1 

drop database placement;
CREATE DATABASE placement;
SHOW DATABASES;

USE placement;


CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    branch VARCHAR(50) NOT NULL,
    campus VARCHAR(40) NOT NULL,
    status VARCHAR(30) DEFAULT 'Active'
);
SHOW TABLES;
DESC subjects;

RENAME TABLE subjects TO details;
SHOW TABLES;
DESC details;


DROP TABLE details;


CREATE TABLE details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    branch VARCHAR(50) NOT NULL,
    campus VARCHAR(40) NOT NULL,
    status VARCHAR(30) DEFAULT 'Active',
    email VARCHAR(100),
    joining_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    salary DECIMAL(10,2),
    marks FLOAT(5,2),
    descriptions TEXT,
    entry_time TIME DEFAULT (CURTIME())
);

DESC details;


INSERT INTO details
(name, branch, campus, email, salary, marks, descriptions)
VALUES
(
'Tabish',
'CSE',
'BBSR',
'mdtabish@gmail.com',
34000.00,
98.00,
'Hii, This is Tabish Firoz and I am learning MySQL'
);

SELECT * FROM details;


CREATE TABLE department (
    dep_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
DESC department;
show tables;


INSERT INTO department
VALUES
(101,'CSE'),
(102,'ECE'),
(103,'ME');

SELECT * FROM department;


ALTER TABLE details ADD dep_id INT;

DESC details;


ALTER TABLE details
ADD CONSTRAINT fk_department
FOREIGN KEY (dep_id)
REFERENCES department(dep_id);

desc details;

UPDATE details
SET dep_id = 101
WHERE id = 1;

SELECT * FROM details;



SELECT
d.id,
d.name,
d.branch,
dept.department_name
FROM details d
JOIN department dept
ON d.dep_id = dept.dep_id;

create table projects(
project_id int primary key auto_increment,
project_name varchar(100) not null,
employee_id int,
foreign key (employee_id) 
references details(id)
);

alter table projects add employee_name varchar(100) not null;
select * from projects;

alter table projects drop column emloyee_name;

show tables;
desc projects;
insert into projects(project_name, employee_id, employee_name) values 
("CRM System", 1, "Tabish");

CREATE TABLE salary (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (employee_id)
    REFERENCES details(id)
);

alter table salary modify basic_salary bigint check(basic_salary>0);
desc salary;

INSERT INTO salary (employee_id,basic_salary,bonus)
VALUES
(1,34000,5000.00);
 
select * from salary;


-- ============================-- 
-- Phase 2 


create database companyDB;
use companyDB;

create table Employee(
id int primary key auto_increment,
name varchar(30),
department varchar(30),
salary decimal(10,2),
city varchar(30)
);

desc Employee;

insert into Employee(name, department, salary, city) values
("Tabish","IT",23000.00,"Bihar"),
("Tabish","AI",23000.00,"Bihar");

select * from Employee;
select department from employee;  -- We can also select idividual
select name , salary from Employee;
select distinct salary from Employee;


update Employee SET salary= 42000.1 where id = 1;
select * from Employee;

update Employee Set name = "Tabish", department = "Health", salary = 39000.2, city = "Iran" where id =2;


delete from Employee where id = 1;
delete from Employee;

truncate table Employee;
-- By using drop command you everything will delete like roe data and table structure as well you will loss using drop command 
drop table Employee;
drop database companyDB;

-- Alter use for modifying existing table  
desc Employees;
Alter  table Employee add phone varchar(10);
alter table Employee drop column phone;
alter table Employee rename column name to first_name;
alter table Employee add unique(id);

alter table Employee rename to Employees;

-- ============================-- 
-- Phase: 3 ---


CREATE TABLE Employee(
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

insert into Employee(name, department, salary, city) values
("Tabsih Firoz", "IT", 45000.23, "Banglore"),
("Firoz", "Frontend", 35000.23, "Bihar"),
("Tabsih ", "Backend", 55000, "Patna"),
("Akhil ", "Full Stack", 85000.23, "Delhi");
select * from Employee;

select distinct name from Employee;
select * from Employee where emp_id =1;
select * from Employee where department = "IT";

insert into Employee(name, department, salary, city) values(
"Tabish Firoz", "IT", 23000, "Dubai"
);

select * from Employee where salary>35000;
select * from Employee where salary=35000.23;
select * from Employee where salary<>35000.23;
select * from Employee where salary!=35000.23;
select * from Employee where salary>=35000.23;
select * from Employee where salary<=35000.23;


select * from Employee order by salary;  -- default order ascending
select * from Employee order by salary asc;
select * from Employee order by salary desc;
select * from Employee order by emp_id asc, salary desc;

select * from Employee;
select * from Employee limit 3;
select * from Employee limit 2 ,4;
select * from Employee order by salary desc limit 2;

select * from Employee where name like 'T%'; -- Start With
select * from Employee where name like '%z'; -- end with
select * from Employee where name like '%ih%'; -- between
select * from Employee where name like '___i%'; -- skip first three char and start with import table from

select * from Employee where salary between 30000 and 40000;
select * from Employee where emp_id between 3 and 5;

select department from Employee where department in ('IT',"Frontend");
select * from Employee where department not in ('IT',"Frontend");
select * from Employee where salary in (23000.00,55000.23);

select * from Employee where salary = 23000.00 or salary = 55000.23;
select * from Employee where department = "Backend" or department = "IT";

select * from Employee where emp_id is  null;
select * from Employee where emp_id is not null;

-- Aliases (AS) give temporary name to a column or table
select name as emp_name , department as dep_name from Employee ;

select t.name , t.department from Employee t;

select distinct  name , salary from  Employee where salary between 35000.23 and 45000.23 and department in ('IT', 'Frontend', 'Backend')  order by salary desc;


-- ============================-- 
-- Phase 4 

-- 1. 	Aggregate Functions 
-- 2.	String Functions 
-- 3.	Date & Time Functions 
-- 4.	Mathematical Functions 

use companydb;
create table Student(
std_id int primary key unique auto_increment,
std_name varchar(30) not null,
std_dep varchar(30),
batch varchar(30),
joining_date date default (curdate())
);

select * from Student;
show tables;
drop table Student;
insert into  Student(std_name, std_dep, batch  ) 
values ("Tabish Firoz", "CSE", "2023"),
(" Firoz", "EEE", "2024"),
("Tabish ", "ECE", "2025"),
("Akhil", "ME", "2026"),
("Akhil Firoz ", "CSE", "2022");
  
alter table Student modify joining_date date default (curdate());

-- Aggregate Functions
-- •	COUNT() 
-- •	SUM() 
-- •	AVG() 
-- •	MAX() 
-- •	MIN() 

select count(*) from Student; 
select count(*) from Student where std_dep = "ME"; 
select sum(std_id) from Student; 

alter table Student add column salary decimal(10 ,2);
desc Student;
update Student set salary = 47300.00 where std_id =6;
select sum(salary) from Student where std_dep = "ME";
select avg(salary) from Student where std_dep = "CSE";
select max(salary) from Student ;
select min(salary) from Student;

select * from Student order by salary desc limit 3;  


-- String Functions
-- UPPER()`
-- LOWER()`
-- LENGTH()
-- CONCAT()
-- SUBSTRING()
-- REPLACE()
-- TRIM()

select upper(std_name) from Student;
select lower(std_name) from Student;
select length(std_name) from Student limit 3;
select length(std_name) from Student where std_id = 2;
select concat(std_name, " works in " , std_dep) from Student limit 3;

select substr(std_name, 1, 6) from Student;
select replace(std_name , "Firoz" , "Akhil" ) from Student where std_id = 3; 
select trim("Tabish") from Student where std_id = 2;	
select * from Student;

-- Date & Time Func 
select curdate();
select current_time();
select curtime();
select now();
select current_timestamp();
select current_user();
select year(batch) from Student ;

select datediff('2004-11-27' , '2026-07-19');


-- Mathematical Functions
select round(98.788, 1);
select ceil(98.9898);
select floor(98.99);
select abs(-98);
select mod(12,9);

select sqrt(4);
select pow(10, 3);
select power(10,3);

select rand(2);

















































































































































































































