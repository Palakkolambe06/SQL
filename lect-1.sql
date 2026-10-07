-- create a database named CompanyDB--
CREATE DATABASE CompanyDB;
-- Select the CompanyDB database
USE CompanyDB;
-- Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10,2),
    JoinDate DATE
);
SHOW TABLES;
-- Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);
-- Add Email column to Employees table
ALTER TABLE Employees
ADD Email VARCHAR(100);
-- Add dept_location column to Departments table
ALTER TABLE Departments
ADD dept_location VARCHAR(100);
DESC Departments;
-- Add NOT NULL constraint to phone column
ALTER TABLE Employees
ADD phone VARCHAR(15);
ALTER TABLE Employees
MODIFY phone VARCHAR(15) NOT NULL;
-- Change the size of EmpName from VARCHAR(50) to VARCHAR(100)
ALTER TABLE Employees
MODIFY EmpName VARCHAR(100);
-- Craete a foreign key constraints between two tables 
ALTER TABLE Employees
ADD DeptID INT;
ALTER TABLE Employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (DeptID)
REFERENCES Departments(DeptID);
-- Drop the Primary key constraint from the departments--
ALTER TABLE Employees
DROP FOREIGN KEY fk_employee_department;
ALTER TABLE Departments
DROP PRIMARY KEY;
-- Rename EmpName to EmployeeName--
ALTER TABLE Employees
RENAME COLUMN EmpName TO EmployeeName;
Show Tables;
-- Permanently delete the Departments table
DROP TABLE Departments;
Show Tables;
INSERT INTO Employees
(EmpID, EmployeeName, Salary, JoinDate, Email, Phone, DeptID)
VALUES(101, 'Rahul', 45000, '2026-01-15', 'rahul@gmail.com', '9876543210', 1);
show tables;
INSERT INTO Employees
(EmpID, EmployeeName, Salary, JoinDate, Email, Phone, DeptID)
VALUES(102, 'Priya', 30000, '2025-02-20','priyarane@gmail.com', '9179079589', 2);
show tables;