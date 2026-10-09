CREATE DATABASE company;
SHOW DATABASES;
USE company;
DROP DATABASE company;

CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

SHOW TABLES;
DESC employee;
DROP TABLE employee;
TRUNCATE TABLE employee;
RENAME TABLE employee TO employees;

ALTER TABLE employees ADD email VARCHAR(100);
ALTER TABLE employees DROP COLUMN email;
ALTER TABLE employees MODIFY age BIGINT;
ALTER TABLE employees CHANGE name full_name VARCHAR(100);
ALTER TABLE employees RENAME TO staff;

CREATE TABLE staff (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO staff (name, age, salary, department)
VALUES ('Tabish', 22, 50000, 'IT');

INSERT INTO staff (name, age, salary, department)
VALUES
('Aman', 24, 60000, 'HR'),
('Sara', 26, 70000, 'IT');


SELECT * FROM staff;
SELECT name, salary FROM staff;
SELECT DISTINCT department FROM staff;

SELECT * FROM staff WHERE age > 22;
SELECT * FROM staff WHERE salary >= 50000;
SELECT * FROM staff WHERE department = 'IT';

SELECT * FROM staff WHERE salary BETWEEN 30000 AND 70000;
SELECT * FROM staff WHERE department IN ('IT','HR');
SELECT * FROM staff WHERE name LIKE 'T%';
SELECT * FROM staff WHERE name LIKE '%sh';
SELECT * FROM staff WHERE name LIKE '_a%';
SELECT * FROM staff WHERE department IS NULL;
SELECT * FROM staff WHERE department IS NOT NULL;