select * from worker;

# [   ORDER BY CLAUSE  ]

# Ascending Order 

select first_name,department,salary from worker 
order by 
salary asc;

select * from worker order by first_name;

# Descending Order 

select first_name,department,salary from  worker 
order by 
SALARY desc;

select * from worker order by 
joining_date desc;


# Group by Clause 

select sum(salary),department from worker 
group  by department;

select first_name  ,max(salary) 
from worker 
group by 
department ;

# EX:::: 

#1. Count employees not in HR or Admin.

select count(worker_id) as other_department 
from worker 
where department not in('hr','admin')
group by DEPARTMENT;


#2. Find the highest salary in each department.
select max(salary),DEPARTMENT 
from worker 
group by 
department;

select  first_name,max(salary+20000)as highest_salary_bonus from worker group by department;


# Trim --> avoid spaces around 
# LTRIM() --> REMOVES SPACE ON LEFT SIDE
#RTRIM() ---> REMOVES SPACE ON RIGHT SIDE alter
#TRIM() ---> BOTH LEFT AND RIGHT

select ltrim('  Babi  ') as name;

select rtrim('Jaswanth  ') as name;

select ltrim(last_name ) as name from worker;

update worker set first_name=ltrim(first_name);

update worker set last_name=ltrim(LAST_NAME);

update worker set 
first_name = trim(first_name),
last_name = trim(last_name),
department = trim(department);

# limit and offset


select * from worker 
order by salary desc
limit 10
offset 2;

select first_name , salary,department 
from worker 
order by salary desc
limit 3;

select count(*),joining_date from worker 
group by joining_date ;


select first_name,department, salary+20000 from worker;


# upper and Lower Case

select upper(first_name) from worker;

select lower(department) from worker;

# Having 

select sum(salary) as total_highest_sal,department from worker group by department 
having total_highest_sal >1000000;

#1. Find departments with average salary > 100000.
select avg(salary) ,department from worker 
group by department 
having avg(salary) > 100000;

#2. Find departments where max salary is exactly 500000.
select max(salary),department from worker
group by department
having max(salary)=500000;

#3. Find departments with more than 1 employee and salary > 100000.
select count(department) ,department from worker 
where salary >100000
group by department 
having count(department)>1;

#4. Find departments with avg salary between 50000 and 200000.
select avg(salary),department 
from worker 
group by department 
having avg(salary) between 50000 and 200000;


