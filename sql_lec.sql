create database user;
use user;

create table customer(custid int,custname varchar(50),product varchar(50),city varchar(50),price int);

insert into customer values(1,'Nandini','Pen','Pune',10);
insert into customer values(2,'Pallavi','Fridge','Mumbai',18000);
insert into customer values(3,'Maliha','Washing Machine','Nagpur',30000);
insert into customer values(4,'Saloni','Cupborad','Pune',10000);
insert into customer values(5,'Anujaa','TV','Mumbai',16000);

alter table customer add primary key (custid);

desc customer;

select * from customer;

Update customer set product = 'Dyson' where custid = 1;
Update customer set price = 27000 where custid = 1;
select custid,custname,product from customer;

select * from customer where custid = 3;

select * from customer where custid = 1 or custid = 3;

select * from customer where price < 15000;

select * from customer where price > 25000;


select * from customer order by city asc;



/*Single row Functions */
/* Case Conversion Functions */

select upper(custname),lower(product) from customer where custid < 3;

select upper(custname),lower(product) from customer;

Alter table customer add column Lastname varchar(50);

Update customer set Lastname = 'Battul' where custid = 1;
Update customer set Lastname = 'Kongale' where custid = 2;
Update customer set Lastname = 'Kazi' where custid = 3;
Update customer set Lastname = 'Bhagale' where custid = 4;
Update customer set Lastname = 'Bapunwar' where custid = 5;

select concat(custname,' ',Lastname) as Fullname from customer;

/* Use OF Substring and INstring functions */
select * from customer;
select substr(custname,1,1) from customer;
select substr(custname,1,3) from customer;
select substr(custname,0,1) from customer;
select substr(custname,1,0) from customer;

/*Substring Query*/

select instr(custname,'a') as position from customer;/*Shows Position in the letter*/

insert into customer values(6,'Ankita','Laptop','Nashik',29000,'Kachi');

select substr(custname,1,2) as substring,instr(custname,'a') as instr from customer;

select substr(custname,1,3) as substring,instr(custname,'a') as instr from customer where custid < 3;


