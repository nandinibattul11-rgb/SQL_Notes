create database basicjoin;

use basicjoin;

create table employees(emp_id int primary key,ename varchar(50));
insert into employees values(101,'Raghav');
insert into employees values(102,'Raashi');
insert into employees values(103,'Rohan');
insert into employees values(104,'Raavi');

select * from employees;

create table projects(project_id int primary key,pname varchar(50),
emp_id int,foreign key(emp_id) references employees(emp_id));

desc projects;

insert into projects values(1,'Project A',101);
insert into projects values(2,'Project B',102);
insert into projects values(3,'Project C',101);
insert into projects values(4,'Project d',103);
insert into projects values(5,'Project E',103);
insert into projects values(6,'Project F',Null);

select * from projects;

insert into employees values(105,'Sanjay');
insert into employees values(106,'Akshay');

/*Inner Join*/
/* only matching recorrds will display from employee  & projects table*/

select * from employees join projects on employees.emp_id = projects.emp_id;

/* Fetch the employee name and project name they belong to */

select e.ename,p.pname from employees e 
inner join projects p on e.emp_id = p.emp_id;

/*Right Join */

select e.ename,p.pname from employees e 
right join projects p on e.emp_id = p.emp_id;

select e.ename,p.pname from projects p
right join employees e on e.emp_id = p.emp_id;

select e.ename,p.pname from employees e
right join projects p on e.emp_id = p.emp_id;

/* Left Join */
select e.emp_id,e.ename,p.pname from employees e
left join projects p on e.emp_id = p.emp_id;

select e.emp_id,e.ename,p.pname from projects p
left join employees e on e.emp_id = p.emp_id;

insert into projects values(7,'Project G',105);
insert into projects(project_id,pname,emp_id) values(8,'Project G',105);
insert into projects(project_id,pname) values(9,'Project H');

/* Full Outer Join using Union */
/* display all matching and non matching data from both tables */

select * from employees left join projects 
on employees.emp_id = projects.emp_id
union
select * from employees right join projects 
on employees.emp_id = projects.emp_id;

/*  Display employee name who has not been assigned any projects */

select employees.ename,projects.pname from employees left join projects on
employees.emp_id = projects.emp_id
where projects.emp_id is not null;

select employees.ename,projects.pname from employees left join projects on
employees.emp_id = projects.emp_id
where projects.emp_id is null;

select employees.ename,projects.pname from projects left join employees on
employees.emp_id = projects.emp_id
where projects.emp_id is not null;

select employees.ename,projects.pname from projects left join employees on
employees.emp_id = projects.emp_id
where projects.emp_id is null;