
---Day 45
--1. Find Top customers by orders : Find customers who placed the most orders 
--Aprach 1 :

select 
	cc.customer_id ,
	cc.customer_name,
	sum(cod.quantity)  as orders_count
from cleaned_customers cc 
join cleaned_orders co 
	on cc.customer_id =co.customer_id 
join cleaned_order_details cod 
	on cod.order_id =co.order_id
group by cc.customer_id ,cc.customer_name order by orders_count desc;



--Aproach 2:
with cust_orders_count_cte as (
select 
	cc.customer_id ,
	cc.customer_name,
	co.order_id ,
	sum(cod.quantity) over (partition by cc.customer_id) as orders_count
from cleaned_customers cc 
join cleaned_orders co 
	on cc.customer_id =co.customer_id 
join cleaned_order_details cod 
	on cod.order_id =co.order_id )
select * from cust_orders_count_cte order by orders_count desc;


--2. 	TOp customers by revenue: Find customer Generates highest revenue 

select 
	cc.customer_id ,
	cc.customer_name,
	sum(cp.payment_amount )  as toatl_revenu
from cleaned_customers cc 
join cleaned_orders co 
	on cc.customer_id =co.customer_id 
join cleaned_payments cp 
	on cp.order_id =co.order_id
group by cc.customer_id ,cc.customer_name order by toatl_revenu desc;

--3 Customer with no orders: Find inactive customers

select 
	cc.customer_id ,
	cc.customer_name
from cleaned_customers cc 
left join cleaned_orders co 
	on cc.customer_id =co.customer_id 
where co.order_id is null;


--4 New Customers Trend: Find Customers sighnup trend month wise 
select 
	extract( month from signup_date) as month_no,
	TO_CHAR(signup_date,'Month') as month_name,
	count(*) cust_signup_count
from cleaned_customers
group by extract( month from signup_date),TO_CHAR(signup_date,'Month')
order by month_name;

--5 Repeat customers : find the customers with multiple orders 

select 
	cc.customer_id ,
	count(co.order_id) as cust_count
from cleaned_customers cc 
join cleaned_orders co 
on cc.customer_id =co.customer_id  
group by cc.customer_id having count(co.order_id)>1;

--6 Customer Lifetime Value :Find total spending of each customer

select 
	cc.customer_id ,
	cc.customer_name ,
	sum(cp.payment_amount) total_spent
from cleaned_customers cc 
join cleaned_orders co 
	on cc.customer_id =co.customer_id 
join cleaned_payments cp 
	on co.order_id =cp.order_id 
group by cc.customer_id ,cc.customer_name ;
