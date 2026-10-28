drop database institute;

-- DML Commands --
create database college;
show databases;

use college;

create table Employees(EmpID int primary key,FirstName varchar(50),LastName varchar(50), age int,Empzone varchar(50));
desc Employees;

insert into Employees values(101,'Nandini','Battul',21,'South');
insert into Employees values(102,'Pallavi','Kongale',20,'North');
insert into Employees values(103,'Anujaa','Bapunwar',22,'South');
insert into Employees values(104,'Maliha','Kazi',19,'East');
insert into Employees values(105,'Saloni','Bhagle',23,NULL);

select * from Employees;

update Employees set EmpZone = 'West' where EmpID = 105;
update Employees set age = 24 where EmpID = 104;

Delete from Employees where EmpID = 103;

select FirstName , LastName from Employees;

create database company_db;
use company_db;

create table Employee(EmpID int NOT NULL,FirstName varchar(50),LastName varchar(50), EmpAge int);

desc Employee;

insert into Employee values(NULL,'Ravi','Kumar',25); -- will show error --

insert into Employee values(1,NULL,'Kumar',25);

create table Employee1(EmpID int NOT NULL,FirstName varchar(50),LastName varchar(50), Unique(EmpID));

insert into Employee1 values(NULL,'Ravi','Kumar'); -- Will Show Error --

insert into Employee1 values(1,'Ravi','Kumar');

insert into Employee1 values(1,'Ravi','Kumar'); -- duplicate entry will be detected --

insert into Employee1 values(2,'Ravi','Kumar');

select * from Employee1;

Desc Employee1;

-- Check Constraint --

create table Employee2(EmpID int NOT NULL,FirstName varchar(50),LastName varchar(50),EmpAge int, Check(EmpAge > 20));

insert into Employee2 values(1,'xyz','abc',12); -- Will check Age --
insert into Employee2 values(2,'def','ghi',21);

Alter table Employee2 add salary int;

alter table Employee2 drop salary;
desc Employee2;
-- Apply check constraint to Salary Column --
Alter table Employee2 add column Salary int, add check(Salary >= 5000);
insert into Employee2 values(3,'jkl','mno',21,1000); -- will check Salary --
insert into Employee2 values(4,'lmn','opq',28,7000);

show create table Employee2;

Alter table Employee2 drop check employee2_chk_2;
insert into Employee2 values(4,'lmn','opq',28,7000);

create table Employee3(EmpID int NOT NULL,FirstName varchar(50),LastName varchar(50),EmpAge int, Check(EmpAge > 20),primary key(EmpID));

insert into Employee3 values(1,'Ravi','Kumar',22);
insert into Employee3 values(1,'Ram','Kumar',22);  -- Now Duolicate Entries will be detected -- 

create table Employee7(EmpID  int Primary key,FirstName varchar(50),LastName varchar(50),EmpAge int,Salry int);

insert into Employee7 values(1,'Ram','Ravi',20);

Alter table Employee7 add constraint chk_EmpAge_Salary check(EmpAge > 20 AND Salry >= 50);

insert into Employee7 values(2, 'Geet','Gore',23,10);

-- Default Constraint --
create table Employee8(EmpID int NOT NULL,FirstName varchar(50),LastName varchar(50),EmpDept varchar(50) Default 'operations');

desc Employee8;

insert into Employee8 values(1,'Nandini','Battul');

insert into Employee8(EmpID,FirstName,LastName) values(1,'Pallavi','Kongale');
insert into Employee8(EmpID,FirstName,LastName) values(2,'Anuja','Bapunwar');
insert into Employee8(EmpID,FirstName,LastName) values(3,'Saloni','Bhagale');

select * from Employee8;
-- INDEX in MySQL how to create indexes --
create index DemoIndex on Employee8(FirstName);
show indexes from Employee8;

create index Demo2 on Employee2(FirstName,LastName);
show indexes from Employee2;

drop index DemoIndex on Employee8;

drop index Demo2 on Employee2;

-- Auto Incremnet ---
create table Persons(
	Personid int NOT NULL AUTO_INCREMENT,
	LastName varchar(255) Not NULL,
	Firstaname varchar(255),
	Age int,
	Primary Key(Personid));
    
    
Desc Persons;

insert into Persons(LastName,Firstaname,Age) values('Kongale','Pallavi',21),('Patil','shweta',22);
select * from Persons;


