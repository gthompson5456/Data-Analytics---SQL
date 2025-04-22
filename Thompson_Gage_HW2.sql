use lx_get16905;

SELECT name
FROM s_product
JOIN s_item ON s_product_id = product_id
WHERE ord_id = 100;

select last_name, first_name, dept_id, name as dept_name
from s_emp
join s_dept on s_dept_id = dept_id
order by name asc, last_name asc, first_name asc;

select ord_id as ord_id, sum(price * quantity) as total_value, count(distinct product_id) as distinct_items
from s_item
group by ord_id;

#use s_emp and s_dept...count s_emp_id and join using dept_id
select name as department_name, count(s_emp_id) as employee_count
from s_dept
left join s_emp on s_dept_id = dept_id
group by s_dept_id, name
order by employee_count desc;


select name as department_name, count(s_emp_id) as employee_count, (COUNT(s_emp_id) * 100.0 / SUM(COUNT(s_emp_id)) OVER ()) AS employee_percentage
from s_dept
left join s_emp on s_dept_id = dept_id
group by s_dept_id, name
order by employee_count desc;

#Display the order id, customer id, and customer name of all orders (s_customer and s_ord tables). Provide two solution queries, one using a subquery, and the other one without a query.  
select s_ord_id as ord_id, s_customer_id as cust_id, name as cust_name
from s_ord
join s_customer on s_customer_id = customer_id
group by ord_id;

SELECT s_ord_id AS order_id, customer_id, (SELECT name FROM s_customer WHERE s_customer_id = customer_id) AS customer_name
FROM s_ord;

select name as cust_name, s_customer_id as cust_id, s_ord_id as ord_id
from s_customer
left join s_ord on s_customer_id = customer_id;

select s_customer_id as cust_id, name as cust_name, count(s_ord_id) as order_count
from s_customer
join s_ord on customer_id = s_customer_id
group by cust_name, cust_id
having count(s_ord_id) > 1
order by cust_name desc;

select i.ord_id as order_id, i.product_id as product_id, i.quantity as quantity, w.city as warehouse_city, inv.amount_in_stock as amount_stock
from s_item i
join s_inventory inv on i.product_id = inv.product_id
join s_warehouse w on inv.warehouse_id = w.s_warehouse_id
where i.ord_id = 100;

#Write a query with a subquery to display the customers who have NOT placed any orders. Display the ids and names of these customers. 

select s_customer_id as customer_id, name as customer_name
from s_customer
where s_customer_id not in (select customer_id from s_ord);‹


