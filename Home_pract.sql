create Database Hospital;
use Hospital;

create table patient(patientid int primary key,pname varchar(50),
age int ,gender varchar(10),disease varchar(50),city varchar(50),
dname varchar(50),admission_date date, BillAmount int);

insert into patient values(101,'Savita Bhosale',47,'Female','Malaria','Pune','Dr Modak','2026-11-02',23000);
insert into patient values(102,'Ankita Kachi',30,'Female','Fever','Mumbai','Dr Verma','2026-12-03',30000);
insert into patient values(103,'Pranav Sharma',24,'	Male','Dengue','Pune','Dr Sharma','2026-10-12',13000);
insert into patient values(104,'Aarohi Jagdale',27,'Female','Malaria','Nashik','Dr Modak','2026-06-14',50000);
insert into patient values(105,'Ram Kapoor',28,'Male','Heart Problem','Nagar','Dr Joshi','2026-02-18',33000);
insert into patient values(106,'Rakshit Bharadwaj',21,'Male','Dengue','Mumbai','Dr Ankam','2026-09-17',10000);
insert into patient values(107,'Drishti Shergill',37,'Female','Cold','Pune','Dr Modak','2026-04-04',20000);
insert into patient values(108,'Anurag Basu',45,'Male','Cold','Nashik','Dr Joshi','2026-12-03',25000);
insert into patient values(109,'Ahana Dhawan',42,'Female','Ahmdebad','Pune','Dr Ankam','2026-12-06',26000);
insert into patient values(110,'Arav Khan',32,'Male','Fever','Pune','Dr Ankam','2026-05-03',45000);

select * from patient;

select * from patient where BillAmount > 20000;

select City,count(patientid) as Tot_pat from patient group by City;

Alter table patient add column ContactNumber int;

select max(BillAmount) as Max_Amount from patient;

Update patient set City = 'Mumbai' where patientid = 105;

select disease,avg(BillAmount) as Avg_Amount from patient
group by disease;

Select * from patient where age > 25 and  age < 45;

Delete from patient where patientid = 110;

select city,sum(BillAmount) as Tot_Bill from patient where city = 'Pune';

select max(BillAmount) as Second_max from patient
where BillAmount < (select max(BillAmount) from patient);

select disease,count(patientid) as no_of_pat from patient group by disease having no_of_pat >=2;

Update patient set BillAmount = BillAmount * 1.10
where disease = 'Dengue';

select * from patient;

select distinct(dname) from patient;

select gender,count(pname) as count_of_gender from patient group by gender;

select pname from patient where pname like 'A%';

select 
BillAmount,
case 
	when BillAmount >= 40000 then 'High'
	when BillAmount > 25000 and BillAmount < 40000 then 'Medium'
	else 'Low'
end as Bill_Category
from patient;

Select * from patient where BillAmount > (select avg(BillAmount) from patient);

select dname,max(BillAmount) as max_amt,min(BillAmount) as min_amt,
avg(BillAmount) as avg_amt from patient group by dname;

Rename table patient to hospital_patients;

select * from hospital_patients order by BillAmount desc limit 3;

GRANT SELECT ON Hospital.Hospital_patients TO 'nandinibattul11'@'localhost';