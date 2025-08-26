CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
        
# Comparision Operators
#  "=" equal to 
select* from worker where joining_date="14-06-11 09.00.00" and department = "Admin";
select * from worker where worker_id = 001;

# greater than && less than operators

# [  >  ] -- greater than

select * from worker where salary>100000 ;
select * from worker where salary >300000 and joining_date="14-02-20 09.00.00";

# [  >=   ] -- greater than or equal to

select * from worker where salary >=100000 and department ="Account";
select * from worker where salary >=400000 and first_name  like "a%";

# [  <  ] -- Less than

select * from worker where salary <200000 and department="HR";
select worker_id ,salary as less_than_1L from worker where  salary<100000;

# [  <=    ] -- less than or equal tocseiot

select * from worker where  salary <=300000 and joining_date="14-02-20 09.00.00";
select * from worker where salary <=200000 and department="Account";


#Logical Operators

# [  and  ] 

select * from worker where joining_date="14-02-20 09.00.00" and department ="Admin";
select * from worker where first_name like "m%" and department ="HR";

# [   or   ]

select * from worker where salary>200000 and department ="HR" or department ="Admin";
select * from worker where joining_date="14-02-20 09.00.00" or joining_date="14-0120 09.00.00";

# [   Not   ]  

select * from worker where not salary >=200000;
select * from worker where salary >300000 and not department="HR";

# [  in   ]

select * from worker where worker_id in(1,2,3) and department="Admin";
select * from worker where department in ('hr','admin') and salary > 200000;

# [   not in  ]
select * from worker where joining_date not in("14-01-20 09.00.00","14-02-20 09.00.00") and department="Account";
select * from worker where department not in ('hr','account') and salary>=100000;

#[  Between  ]

select * from worker where( salary between 200000 and 500000 ) and department in ('hr','admin');
select * from worker where (salary between 400000 and 500000) and joining_date in('14-01-20 09.00.00','14-02-20 09.00.00');

# [  not between  ]

select * from worker where (salary between 100000 and 200000) and department not in ('account');

select * from worker where (salary between 300000 and 500000) and department not in ('hr');

select * from worker where (joining_date between "14-01-20 09.00.00" and "14-02-20 09.00.00" );

#[ Example:::::: ]

# 1. Find workers not in HR or Admin with salary between 70000 and 300000.

select * from worker where salary between 70000 and 300000 and department not in ('hr','admin');

# 2. Find workers with first name starting with 'V' and salary greater than or equal to 200000.

select * from worker where first_name like "v%" and salary>=200000; 

# 3. Find workers not in Admin with salary < 100000.

select * from worker where salary < 100000 and department not in('admin');

# [   Aggregations   ]

select max(salary) from  worker where department in ('hr','admin');

select max(salary) from worker where department in('account');

# [   min   ]
select min(salary) as lowest_salary_hr,first_name from worker where department ="hr";

select min(worker_id) ,first_name,department from worker;

# [   sum   ] 

select sum(salary) as total_salary_spend_company from worker;

select sum(salary) as hr_total_salary_spent_company from worker where department ='hr';

# [   average   ]

select avg(salary) as total_salary_spend_company from worker;

select avg(salary) as admin_total_salary_spent_company from worker where department ='admin';

# [   count    ]  

select count(worker_id) from worker;

select count(*) as salary_greaterthan_1L_hr ,department  from worker where department ="hr" and salary >=100000;


# problems 

#1. Find the average salary in the Admin department.

select avg(salary) from worker where department="admin";

#2. Total salary for HR and Admin departments combined.

select sum(salary) from worker where department in ('admin','hr');

#3. Total salary for HR and Admin departments combined.

select sum(salary) from worker where department in('hr','account');

#4. Count employees whose first name starts with 'V'.

select count(*) as name_starts_with_v from worker where first_name like"v";

# 5. Total salary of employees with salary between 50000 and 200000. 

select sum(salary) from worker where salary between 50000 and 200000;


# [   UNION :(distinct values after merged)    ]

select salary,first_name,department from worker where department="hr"
union 
select salary,first_name,department from worker where department="admin";

select joining_date from worker where department ="admin" 
union
select joining_date from worker where department ="hr";

# [   union all(accept duplicate values)    ]

select worker_id,first_name ,joining_date from worker where department ="admin" 
union all
select worker_id,first_name, joining_date from worker where department ="hr";

select first_name ,salary from worker where salary>=200000
union all 
select first_name ,salary from worker where salary<=250000;

# [   Case Statement  ]

select first_name ,salary,
case 
when salary >200000 then 'Rich'
when salary <=200000 and salary>=100000 then 'middle'
else 'poor'
end as status_of_emp
from worker;

select first_name ,salary,department,
case 
when joining_date >"14-06-11 09.00.00" then 'senior_employee'
when joining_date >"14-02-20 09.00.00" then 'Junior'
else 'Fresher'
end as Employee_heirarchy
from worker;

