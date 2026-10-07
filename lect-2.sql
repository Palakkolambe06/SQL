/* DML commands */ 
use collage;
show databases ;
create table Employees (EmpID int, FirstName varchar(10),
LastName varchar(10), EmpAge int, Empzone varchar(10));
desc Employees;
insert into Employees
 values(1,'Rita','Zade',20,'West');
select * from Employees;

insert into Employees(EmpID, FirstName, LastName, EmpAge, EmpZone)
 values(2,'Null','Joshi',22,'North') ,
	   (2, 'Ram','Joshi',24,'North'),
       (3, 'Ram',Null, 25, Null);
       
INSERT INTO Employees(EmpID, FirstName, LastName, EmpAge, EmpZone)
VALUES
(5, 'Geeta', 'Rao', NULL, NULL),
(6, NULL, 'Garg', NULL, NULL);       

show tables;
select * from Employees;

update Employees set Firstname = 'Sita' where EmpAge=24;
USE collage;
SELECT * FROM Employees;

/* update Multiple field value */
update Employees SET LastName = 'Sharma', EmpZone = 'South'
where EmpID = 3; -- update multiple fields 
select * from Employees;

update Employees SET FirstName = 'Mahima', EmpAge = 23 , EmpZone = 'South'
where EmpID = 6; -- update multiple fields 
select * from Employees;

/*update Employees SET EmpID = '5'
where Name = Mahima; -- update multiple fields 
select * from Employees;-*/

delete from Employees where EmpID = 2 ;
select * from Employees;

-- truncate - delete the rows from the table
truncate table Employees;
select * from Employees;

/* SQL Constraint Primary Key, NOT NULL, Unique,
Foreign key and check Constraint*/
/* The following constraints are commonly used in SQL:
NOT NULL - Ensures that a column cannot have a NULL value.
UNIQUE - Ensures that all values in a column are unique (different)
A table can have multiple unique value 
Primary key - A combination of a NOT NULL and UNIQUE.
Uniquely identifies each row in a table.
Foreign key constraint - Prevents actions that colud destory links between the table.
check - Ensures that values in  a column satifies a: specific condition.


	-- Not null constraints*/
Drop database company_db;
Create database company_db;
use company_db;

create table Employees(EmpID int NOT NULL, FirstName varchar(50),
LastName varchar(10), EmpAge int);
drop table Employees;

DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;

USE company_db;
CREATE TABLE Employees (
    EmpID INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(10),
    EmpAge INT
);

INSERT INTO Employees
VALUES (23, 'Riya', 'Rao', 20);
SELECT * FROM Employees;

/* unique key constraints */
create table Employee1(EmpID int NOT NULL, FirstName varchar(50), LastName varchar(10), EmpAge int , unique(EmpID));
desc Employee1;

insert into Employee1 values(1, 'Ravi', 'Kumar',22); 
insert into Employee1 values(2, 'Ravi', 'kumar',23);
select * from Employee1;
Desc Employee1;

create table Employee2(EmpID int NOT NULL, FirstName varchar(50), LastName varchar(10), EmpAge int , check(EmpAge>20));
desc Employee2 ;
insert into Employee2 values(1,'Geets','kuamri',15); -- gives error
insert into Employee2 values(1, 'Ravi','Kumar',22);
select * from Employee2;

-- check constraint using alter command 
Alter table Employee2 Add column Salary int;
Alter table Employee2 add check(salary >=5000);
desc Employee2;
select * from Employee2;

update Employee2 set salary=20000;
desc Employee2;
select * from Employee2;

/* check constraint on multiple rows */
create table Employee3(EmpID int Primary Key, FirstName varchar(10), LastName varchar(10), EmpAge int );
desc Employee3 ;

insert into Employee3 values(1,'Ram','kumar',20);

/* To allow naming and defininga check constraint on multiple columns */
ALTER TABLE Employee3 ADD COLUMN Salary INT;
Alter table Employee3 add constraint chk_Emp_salary
check(EmpAge>20 AND salary >=5000);
desc Employee3;

insert into Employee3 values(2,'Geet','Gore',13,4000);
desc Employee3;
select * from Employee3;
















 
