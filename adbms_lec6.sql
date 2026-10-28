create database User;
Show databases;

use User; 

create table customer (custid int, custname varchar(15), city varchar (10), product varchar(15), price int);

desc customer;

alter table customer add primary key (custid);
insert into customer values(1,'om','nanded','mobile',15000);
insert into customer values(2,'rucha','nagpur','laptop',40000);
insert into customer values(3,'raj','mumbai','mouse',300);



select* from customer;
select custid, custname, city from customer;
select * from customer where custid=3;
select * from customer where custid=3 or custid=1;

create table Clonetable as select * from customer;
select * from Clonetable;
drop table Clonetable;

select custname, city from customer;

select custname, city from customer where custid=1;

select custname, product, price from customer where price>15000;

select * from customer where city='nagpur';

/*sorting data using order */

select * from customer order by price;

select * from customer order by price desc;
select * from customer order by price asc;

/*sorting data order by multiple columns*/

select * from customer order by price,city;

select * from customer order by city desc, price asc;

/* single row function*/
/* case conversion function*/

select upper(custname), lower(product) from customer
where custid<3; /* uppercase & lower case function */

select upper(custname), lower(product) from customer;

alter table customer add column Lastname varchar(100);

update customer set Lastname ="sharma" where custid=1;
update customer set Lastname ="verma" where custid=2;
update customer set Lastname ="patil" where custid=3;

/*    */

-- 19 OCT 2026

-- Date & Time Function:
SELECT now();   -- 2026-10-19 10:20:01
SELECT now() as current_datetime;

alter table customer add column date date;

select * from customer;

update customer set date='2021/2/20' where custid=1;
update customer set date='2028-2-25' where custid=2;
update customer set date='2029-2-27' where custid=3;

-- alter table customer drop column date

select * from customer;

-- filtering data from tables 
/* where select distinct, and , or, not in, between, like , limit, is null */

create database Organization;

use Organization;

create table employee (Empid int not null primary key, first_name varchar(20), 
Last_name varchar(50), Gender char, Role varchar(15), Dept varchar(20), manager_id varchar(15)) ; 

Desc employee;

insert into employee values(1,'prajakta','jagtap','F','data science','retail','M11');
insert into employee values(2,'Anuja','Bapunwar','F','data analyst','IT','M12');
insert into employee values(3,'kirti','bhagat','F','Team leader','fiance','M13');
insert into employee values(4,'shrisha','choudekar','F','manager','IT','M14');
insert into employee values(5,'tanish','sharma','m','president','IT','M15');

select * from employee;

/* select distinct keyword */

select distinct Dept from employee order by Dept;

select distinct Role from employee order by Role;

/* ---*/
select * from employee where Role='president' and dept='HR';

select * from employee;

select * from employee where role='data science' and dept='retail';

select * from employee where role='data science' and dept='hr';

select * from employee where role='Manager' or role='Team leader';

select * from employee where role='manager' or dept='hr';


select * from employee where role in('President','Manager');

select * from employee where role in('TM','CEO');

/* not in operator */

select * from employee where role not in('president','Manager');

/* between operator*/

alter table employee add column experience int;

select * from employee;

update employee set experience=8 where Empid=1;
update employee set experience=5 where Empid=2;
update employee set experience=10 where Empid=3;
update employee set experience=15 where Empid=4;
update employee set experience=6 where Empid=5;

select * from employee where experience between 6 and 10;
select * from employee where experience=5 or experience=10;

/* like operator */

select * from employee where Last_name like 'j%';

/* limit operator */

select * from employee;
select * from employee order by experience limit 2;

/* Is null */

insert into employee values(6,'Akash','sharma','m','president','HR',' ',null);

select * from employee;

select * from employee where manager_id is null;
select * from employee where experience is null;

select count(*) from employee;

select count(*) from employee;

select min(Experience) from employee;
select count(empid) from employee where dept='finance';
select max(Experience) from employee;
select sum(Experience) from employee;
select avg(Experience) as exp_avg from employee;

/*Grooup by Clause -- It divides a set of rows it subgroups depending on column or expression values
the group by caluse is used with agg functions such as SUM,AVG,MIN,MAX and Count .*/

select dept,count(*) as emp_count from employee group by dept;

select role,count(*) as emp_count from employee group by role;

select Gender,count(*) as emp_count from employee group by Gender;

/* Having Caluse - Each Group produce by the group  byclause its 
eva;luated by the Having Clause , and if the result is true,the row is included in the set */
/* The Having Clause */

select * from employee;
select dept,sum(experience) as tot_exp from employee group by
dept having tot_exp >= 10 and tot_exp <= 20;

/* Fetch dept wise employee count using having clause and sort the data */
select dept,count(empid) from employee group by dept
having count(empid) >= 2 order by count(empid);

select dept,count(empid) from employee group by dept
having count(empid) >= 2 order by count(empid) desc;

select dept,sum(experience) as tot_exp from employee group by
dept having tot_exp >= 10 or tot_exp <= 30;
