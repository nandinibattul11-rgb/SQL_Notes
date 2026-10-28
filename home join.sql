Create Database institute;
use institute;

CREATE TABLE courses(CourseID INT PRIMARY KEY,
CourseName VARCHAR(50),Fees DECIMAL(10,2),
Duration VARCHAR(20));

CREATE TABLE students(StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),Age INT,City VARCHAR(50),
CourseID INT,Marks INT);

INSERT INTO courses VALUES
(1, 'MCA', 80000, '2 Years'),
(2, 'MBA', 100000, '2 Years'),
(3, 'BCA', 60000, '3 Years'),
(4, 'MSc CS', 70000, '2 Years'),
(5, 'BBA', 55000, '3 Years');

INSERT INTO students VALUES
(101, 'Aditi', 21, 'Pune', 1, 85),
(102, 'Rahul', 22, 'Mumbai', 2, 72),
(103, 'Sneha', 20, 'Pune', 1, 91),
(104, 'Amit', 23, 'Nashik', 3, 65),
(105, 'Priya', 21, 'Mumbai', 2, 88),
(106, 'Rohan', 22, 'Pune', 4, 76),
(107, 'Neha', 20, 'Nagpur', NULL, 80);

Alter table students add constraint foreign key(CourseID) references courses(CourseID);

show create table students;

-- Display each student's name along with their course name.--
select s.StudentName,c.CourseName from students s join
courses c on s.CourseID = c.CourseID;

-- Display the names of students enrolled in MCA. --
select s.StudentName,c.CourseName from students s join
courses c on s.CourseID = c.CourseID where c.CourseName = 'MCA';

-- Display student names and course fees. --
select s.StudentName,c.Fees from students s  join
courses c on s.CourseID = c.CourseID;

/* Display all students, including those who have not been 
assigned a course.*/

select * from students left join courses on
 students.CourseID = courses.CourseID;
 
 -- Display all courses, including courses that have no students.
 select s.StudentID,s.StudentName,c.CourseName from 
 Courses c left join students  s on
 s.CourseID = c.CourseID;
 
 /*Display student names, course names, 
 and marks for students scoring above 80.*/
 select s.StudentName,c.CourseName,s.Marks from students s
 join courses c on s.CourseID  = c.CourseID where s.marks > 80;
 
 -- Count the number of students enrolled in each course--
 select count(s.StudentID) as stud_count,c.CourseName from students s 
 join courses c on s.CourseID = c.CourseID group by 
 c.CourseName;
 
 -- Find the average marks for each course.
 select avg(s.Marks) as avg_marks,c.CourseName from students s 
 join courses c on s.CourseID = c.CourseID group by 
 c.CourseName;
 
 -- Find the average marks of students from Pune
 select avg(s.Marks) as avg_marks,c.CourseName,s.city from students s 
 join courses c on s.CourseID = c.CourseID where s.city = 'Pune'
 group by c.CourseName;
 
 -- Update the course fees of MBA to ₹110,000
 Update courses set Fees = 1100000 where CourseName = 'MBA';
 
 -- Delete a student whose StudentID is 107
 Delete from Students where StudentID = 107;
 
 -- Display students who scored more than the overall average marks.
 select * from students where Marks > 
 (select avg(Marks) from students);
 
 
 
