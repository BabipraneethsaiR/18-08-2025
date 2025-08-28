create database Scholorship;

use scholorship;

create table awards(
a_id int primary key,
a_name varchar(50),
s_id int 
);

create table student(
s_id int primary key,
s_name varchar(60),
dep_name varchar(60) 
);

insert into awards values (1,"Top_1",101),(2,'top_2',305),(3,'top_3',404);

select * from awards;

insert into student values (101,"Guna","CSE-IOT"),(102,"Sai","CSE-IOT"),(103,"Raghu",'CSE-IOT'),(302,"Hema","CSE-AI"),(303,"Divaya","CSE-AI"),(305,"Jashu","CSE-AI"),
(401,"Bhargav",'CSE'),(402,'charan','CSE'),(403,'Deepak','CSE'),(404,'Karthik','CSE');

select count(*) from student;

select * from awards where s_id in (
select s_id from student
);

select * from awards left join 
student on awards.s_id = student.s_id ;

select a_name,s_id from awards where s_id =(
 select s_id from student where s_id =404
);



