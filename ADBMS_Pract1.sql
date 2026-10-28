create database CompanyDB;
use CompanyDB;

create table Employees(EmpID int primary key,EmpName varchar(50)
, Salary int,JoinDate date);

create table Departments(DeptID int primary key,DeptName varchar(50));

Alter table Employees add Email varchar(100);

desc Employees;

alter table Employees modify EmpName varchar(100);

Alter table Departments add dept_location varchar(50);

desc Departments;

Alter table Employees add phone int not null;

Alter table Employees modify EmpName varchar(100);

Alter table Employees add DeptID int;

ALTER TABLE Employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (DeptID)
REFERENCES Departments(DeptID);

Alter table Departments drop primary key;

Alter table Employees drop primary key;

Alter table Employees change EmpName EmployeeName varchar(50);

Alter table Employees drop phone;

Rename table Employees to Employee_Details;

drop table Departments;

drop table Employee_Details;

