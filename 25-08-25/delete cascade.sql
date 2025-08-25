use ecommerce;
select * from category;

desc category;

desc product;

drop table product;

create table product (
p_id int primary key,
p_name varchar(60),
c_id  int not null,
foreign key (c_id) references category(c_id) on delete cascade
);

insert into category values(4,"Shirts"),(5,"Accessories");
select * from product;

insert into product values(103,"Black shirt",4),(104,"bracelete",5);

delete from category where c_id =3;
