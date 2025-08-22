show databases;
use placement;
desc cse;

create table  cseiot(
name varchar(250),
reg_no varchar(10),
dep_name varchar(100),
email_id varchar(250),
phn_num bigint
);

insert into cseiot(name ,
reg_no ,
dep_name,
email_id ,
phn_num) values
("Babi","43732030","CSE-IOT","babi@gmail.com","76809966389"),
("jashu","43732032","CSE-IOT","jashu@gmail.com","76809966389"),
("guna","43732034","CSE-IOT","guna@gmail.com","76809966389");

select * from cseiot;

alter table cse add column cgpa float(4),add column fees varchar(10);

select * from cse;

alter table cse add column aadhar varchar(17);

alter table cse drop column aadhar;


