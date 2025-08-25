use placement;
select * from cseiot;

-- update(set)

alter table cseiot add column score int4;
 
update cseiot set country ="srilanka"
where name ="guna";

update cseiot set country ="srilanka",name="Guna Lakshmi"
where name ="guna";  

-- update (Increment)
update cseiot set score ="80";

-- alter (Rename)
use placement;
alter table cseiot add(country varchar(40) default 'India');

-- alter table cseiot drop column country;

insert into cseiot  values("Hari","43732003","CSE-IOT","hari@gmaail.com","123456789","America");

show tables from placement;

select * from cseiot;



show tables from placement;

alter table cseiot rename column country to slocation;

select * from ece;

alter table ece add (country varchar(40) default 'India');
-- change in alter
alter table ece change column country slocation varchar(40);

ALTER TABLE my_table rename column country to slocation;

-- set 

update cseiot set country ="Srilanka"
where name="guna";


create database Company;

use company;
-- create employees details
create table department(
dep_id int primary key,
dep_name varchar(50)
);

create table employee (
name varchar(50) not null,
empl_id int primary key not null,
age int,
salary decimal(10,2) ,
gender char,
dep_id int,
foreign key (dep_id)  references department(dep_id) 
);

-- RollBack  ( undo it will go back to the save point)
-- delete column in table 

delete from employees where departmentid =3;

-- drop (3) commands

drop database employees;

drop table ece;

alter table  ece drop column country;

-- truncate (used to delete total records in table and schema remains unchanged)

truncate table ece;

-- 
