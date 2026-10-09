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

ALTER TABLE employee ADD salary VARCHAR(100);
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

SELECT * FROM staff ORDER BY salary ASC;
SELECT * FROM staff ORDER BY salary DESC;

SELECT * FROM staff LIMIT 2;
SELECT * FROM staff LIMIT 5 OFFSET 10;

UPDATE staff
SET name = "Akhil"
WHERE id = 2;

DELETE FROM staff WHERE id = 2;
DELETE FROM staff;

SELECT COUNT(*) FROM staff;
SELECT SUM(salary) FROM staff;
SELECT AVG(salary) FROM staff;
SELECT MIN(salary) FROM staff;
SELECT MAX(salary) FROM staff;

SELECT department, COUNT(*)
FROM staff
GROUP BY department;

SELECT department, AVG(salary)
FROM staff
GROUP BY department
HAVING AVG(salary) > 50000;

-- PRIMARY KEY
-- FOREIGN KEY
-- UNIQUE
-- NOT NULL
-- CHECK
-- DEFAULT
-- AUTO_INCREMENT

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

SELECT e.name, d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;

SELECT *
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id;

SELECT *
FROM employee e
RIGHT JOIN department d
ON e.dept_id = d.dept_id;

SELECT *
FROM employee
CROSS JOIN department;

SELECT a.name, b.name
FROM employee a
JOIN employee b
ON a.manager_id = b.emp_id;

SELECT *
FROM employee
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
);

SELECT *
FROM department d
WHERE EXISTS (
    SELECT 1
    FROM employee e
    WHERE e.dept_id = d.dept_id
);

SELECT name,
CASE
    WHEN salary >= 70000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS salary_level
FROM employee;

CREATE VIEW employee_view AS
SELECT name, salary
FROM employee;

SELECT * FROM employee_view;

DROP VIEW employee_view;

CREATE INDEX idx_name
ON employee(name);

DROP INDEX idx_name ON employee;

START TRANSACTION;
UPDATE employee
SET salary = salary + 5000
WHERE emp_id = 1;

COMMIT;

ROLLBACK;

SELECT UPPER(name) FROM staff;
SELECT LOWER(name) FROM employee;
SELECT LENGTH(name) FROM employee;
SELECT CONCAT(name,' Employee') FROM employee;
SELECT SUBSTRING(name,1,3) FROM employee;
SELECT REPLACE(name,'a','@') FROM employee;
SELECT TRIM('  SQL  ');

SELECT ROUND(45.678,2);
SELECT CEIL(45.2);
SELECT FLOOR(45.9);
SELECT ABS(-20);
SELECT MOD(10,3);

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
SELECT DATEDIFF('2026-12-31','2004-11-27');

WITH HighSalary AS (
    SELECT *
    FROM employee
    WHERE salary > 50000
)
SELECT *
FROM HighSalary;

SELECT name,
       ROW_NUMBER() OVER(ORDER BY salary DESC)
FROM employee;

