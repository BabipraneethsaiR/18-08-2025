USE ORG123;

CREATE TABLE student (
sid int ,
sname varchar(50)
);

insert into student values(101,"BAbi"),(102,"Jashu"),(103,"guna");

delete from student;

select * from student;
drop table course;

create table course(
sid int,
cname varchar(25)
);

insert into course values(101,"java"),(102,'Full stack');

# JOINS 

select * from course;

select * from student cross join course ;

select * from student  inner join course on student.sid = course.sid;

select * from student natural join course;

select * from student left outer join course on  student.sid = course.sid;

select * from student right outer join course on student.sid = course.sid ;

select * from student full join course on student.sid = course.sid;





