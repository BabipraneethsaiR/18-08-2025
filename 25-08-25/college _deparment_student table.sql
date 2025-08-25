-- for on delete cascade 

use ecommerce;

delete from category;

select * from category;

alter table category add column c_des varchar(50);


insert into category values (501,"Electronic Gadgets","related to electronic items"),(502,"Furniture","Related to Furniture items"),(503,"Home Appliances","Related to Home appliances");


drop table product;

create table product (
p_id int primary key,
p_name varchar(60),
c_id  int not null,
foreign key (c_id) references category(c_id) on delete cascade
);

insert into product values(1,"Laptop",501),(2,"Sofa",502),(3,"Tv",503);

select * from product;

delete from product where c_id = 503;



--- Sql query based on college,department and student 

-- parent table

create database colleges;
use colleges;

create table colleges(
c_id int primary key,
c_name varchar(100) not null
);

			select * from colleges;

desc colleges;

-- parent and child table 

drop table department;
create table department(
d_id int primary key,
d_name varchar(100) not null,
 c_id int not null,
 foreign key (c_id) references colleges(c_id) on delete cascade on update cascade);
 
 desc department;
 
 			select * from department;

 
 -- child table 
 
 create table student (
 s_id int primary key,
 s_name varchar(60) not null,
 c_id int not null ,
 d_id int not null,
 foreign key (c_id) references colleges(c_id) on delete cascade on update cascade ,
 foreign key (d_id) references department(d_id) on delete cascade on update cascade 
 );
 
  			select * from student;

 delete from colleges;
 insert into colleges values (101,"Anna University"),(202,"Sathyabama university"),(303,"St.joseph University");
 
 insert into department values(1001,"Computer Science",101),(1002,"MBA",101),(2001,"Computer science",202),(2002,"ECE",202),(3001,"Arts&Science",303),(3002,"LLB",303);
 
 insert into student values (1,"Narasimha",101,1001),(2,"GunaLakshmi",101,1002),(3,"Babi",202,2001),(4,"Jaswanth",303,3002);
 
 
 delete from student where c_id = 101;
 
 
 -- LIKE Clause 
 
 select * from student where s_name like "_a%";
 
 select * from student where s_name like "%h%";
 select * from student where s_name like ""
 
 

 
 