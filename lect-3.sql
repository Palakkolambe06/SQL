use company_db;

create table Employee5 (EmpID int primary key, FirstName varchar (10), 
LastName varchar(10), EmpAge int, Salary int);

/* Constraint not fully dropeed.
Dropping only a coumn-level constraint while a table- level constarint remains */

Alter table Employee5 add check(salary>=5000);

-- to allow naming and defining a check constraint on multiple columns.
Alter table Emplaoyee5 add constraint chk_EmpAge_salary
check(EmpAge>20 AND salary >=5000);

desc Employee5;

show create table Employee5;

SHOW TABLES LIKE 'Employee5';

ALTER TABLE employee5
ADD CONSTRAINT chk_EmpAge_salary
CHECK (EmpAge > 20 AND salary >= 5000);

SHOW CREATE TABLE employee5;

INSERT INTO Employee5 
VALUES
(1, 'Palak', 'Sharma', 22, 25000),
(2, 'Rahul', 'Patil', 25, 35000),
(3, 'Priya', 'Verma', 28, 50000);

select * from Employee5;

Alter table Employee5 drop check chk_EmpAge_salary;
desc Employee5;

SHOW CREATE TABLE Employee5;

Alter table Employee5 add check (salary>=5000); -- added constraint to the salary 
SHOW CREATE TABLE Employee5;

Alter table Employee5 drop check Employee5_chk_1;
desc Employee5;

/* The create index statement is used to create indexes in tables.
Indexes are used to retrive data from the database more quickly tahn otherwise alter the user's cannot see the indexes .*/

select * from Employee5;

create Index Demoindex on Employee5(FirstName);
show indexes from Employee5;

create Index Demoindex2 on Employee5(FirstName, LastName);

drop index Demoindex on Employee5;
drop index Demoindex2 on Employee5;

