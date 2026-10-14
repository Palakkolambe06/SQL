-- Drop the database if it already exists
DROP DATABASE IF EXISTS CompanyDB;

-- Q1. Create a database and two tables in it.
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Create the Employee table
CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50) NOT NULL,
    City VARCHAR(50)
);
-- Create the Investor table
CREATE TABLE Investor (
    Inv_id INT PRIMARY KEY,
    inv_name VARCHAR(100),
    Investment DECIMAL(10,2),
    Emp_id INT
);

-- Q2. Insert at least 5 rows into both tables.
INSERT INTO Employee (Emp_id, Emp_name, City) VALUES
(1, 'Aarav', 'Pune'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Indore'),
(4, 'Sneha', 'Delhi'),
(5, 'Rohan', 'Nashik');

INSERT INTO Investor (Inv_id, inv_name, Investment, Emp_id) VALUES
(101, 'Amit Sharma', 50000.00, 1),
(102, 'Neha Verma', 75000.00, 2),
(103, 'Karan Patel', 60000.00, 3),
(104, 'Meera Joshi', 90000.00, 4),
(105, 'Ananya Rao', 80000.00, 5);

-- Q3. Display all information in the Employee table.
SELECT * FROM Employee;

-- Q4. Add Age and Salary columns with CHECK constraints.
ALTER TABLE Employee
ADD COLUMN Age INT,
ADD COLUMN Salary DECIMAL(10,2);

-- Add a CHECK constraint to ensure Age is not greater than 50.
ALTER TABLE Employee
ADD CONSTRAINT chk_employee_age CHECK (Age <= 50);

-- Add a CHECK constraint to ensure Salary is at least 10000.

ALTER TABLE Employee
ADD CONSTRAINT chk_employee_salary CHECK (Salary >= 10000);

-- Update the newly added columns with valid values.
UPDATE Employee SET Age = 25, Salary = 25000 WHERE Emp_id = 1;
UPDATE Employee SET Age = 30, Salary = 35000 WHERE Emp_id = 2;
UPDATE Employee SET Age = 28, Salary = 30000 WHERE Emp_id = 3;
UPDATE Employee SET Age = 35, Salary = 45000 WHERE Emp_id = 4;
UPDATE Employee SET Age = 40, Salary = 50000 WHERE Emp_id = 5;

-- Display the Employee table with the new columns.
SELECT * FROM Employee;

-- Q5. Add an Age column to the Investor table.
ALTER TABLE Investor
ADD COLUMN Age INT;

-- Q6. Change inv_name data type from VARCHAR to TEXT.
ALTER TABLE Investor
MODIFY COLUMN inv_name TEXT;

-- Q7. Rename Emp_id to E_id in the Employee table.
ALTER TABLE Employee
RENAME COLUMN Emp_id TO E_id;

-- Display the updated column names.
SELECT * FROM Employee;

-- Q8. Update the city of employee ID 4 to Nagpur.
UPDATE Employee
SET City = 'Nagpur'
WHERE E_id = 4;

-- Verify the updated city.
SELECT * FROM Employee WHERE E_id = 4;

-- Q9. Delete one record from the Investor table.
DELETE FROM Investor
WHERE Inv_id = 105;

-- Display the remaining Investor records.
SELECT * FROM Investor;

-- Q10. Drop the Age column from the Investor table.
ALTER TABLE Investor
DROP COLUMN Age;

-- Verify the table structure.
DESCRIBE Investor;

-- Q11. Drop the CHECK constraint on the Age column from Employee.
ALTER TABLE Employee
DROP CHECK chk_employee_age;

-- Verify the Employee table structure.
DESCRIBE Employee;

-- Q12. Create a foreign key constraint between Employee and Investor.
-- Investor.Emp_id references Employee.E_id.
ALTER TABLE Investor
ADD CONSTRAINT fk_investor_employee
FOREIGN KEY (Emp_id) REFERENCES Employee(E_id);

-- Display the foreign key relationship through table definitions.
SHOW CREATE TABLE Investor;

-- Q13. Display any four columns from the Investor table.
SELECT Inv_id, inv_name, Investment, Emp_id
FROM Investor;

-- Q14. Rename a table.
RENAME TABLE Investor TO Investor_Details;

-- Verify the renamed table.
SHOW TABLES;
SELECT * FROM Investor_Details;

-- Q15. Delete all records using the TRUNCATE command.
-- Temporarily disable foreign key checks to truncate both tables.
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Investor_Details;
TRUNCATE TABLE Employee;
SET FOREIGN_KEY_CHECKS = 1;

-- Verify that both tables contain zero records.
SELECT * FROM Employee;
SELECT * FROM Investor_Details;

-- Q16. Drop both tables from the database.
DROP TABLE Investor_Details;
DROP TABLE Employee;

-- Verify that both tables have been dropped.
SHOW TABLES;