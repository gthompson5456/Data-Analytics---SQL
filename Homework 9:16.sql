use lx_get16905;


#1
CREATE TABLE s_vendor (
    s_vendor_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    contact VARCHAR(60),
    street_address VARCHAR(400),
    city VARCHAR(30),
    state VARCHAR(20),
    country VARCHAR(30),
    zipcode VARCHAR(75),
    PRIMARY KEY (s_vendor_id)
);

select * from s_vendor;

#2

alter table s_vendor
	add column phone varchar(20);
    
select * from s_vendor;

#3

alter table s_vendor
	drop column contact;
    
select * from s_vendor;

#4

insert into s_vendor
values (1001,'James Earl','55 Springdale Street','Athens','GA','USA','30605','706-673-0901');

insert into s_vendor
values (1002,'Bob Lee','70 Oakland Ave','Charlotte','NC','USA','40971','470-861-4927');


select * from s_vendor;


select * from s_customer;

#5
select s_customer_id, name, phone
	from s_customer;
    
#6

select name, credit_rating, sales_rep_id
	from s_customer
    where sales_rep_id = 14;
    
#7

select s_customer_id, name, region_id
	from s_customer
    where name regexp '^[KS]';
    
select s_customer_id, name, region_id
	from s_customer
    where name like 'K%' or name like 'S%';
    
#8
select * from s_emp;

select s_emp_id, last_name, first_name, start_date, salary
from s_emp
where start_date < '1992-01-01'
and salary > 1400;

#9

select name, region_id
from s_customer
where country in ('USA', 'Russia', 'India');

select name, region_id
from s_customer
where country = 'USA'
	or country = 'Russia'
    or country = 'India';
    
#10
select min(salary) as min_salary, max(salary) as max_salary
from s_emp;

#11

select title as job_title, min(salary) as min_salary, max(salary) as max_salary
	from s_emp
    group by title
    order by title desc;
    
#12

select count(*) as order_count 
from s_ord
where customer_id = 208;

#13

SELECT sales_rep_id, COUNT(*) AS customer_count
FROM s_customer
GROUP BY sales_rep_id
HAVING COUNT(*) > 2;

#14

 
SELECT s_emp_id, last_name, first_name, salary
FROM s_emp
WHERE title = 'Stock Clerk'
AND salary > (SELECT AVG(salary) FROM s_emp);






		


