--Day 44 : basic analysis
--1. toatl number of customers 
select 
	count(customer_id ) as toatl_number_of_customers
from cleaned_customers; 

--2. toatl number of orders 
select 
	count(order_id) as total_no_of_orders
from cleaned_orders;

--3 avergae order value 
select 
	avg(payment_amount ) as avg_order_value
from cleaned_payments;

--4 total revenue 
select 
	sum(payment_amount ) as total_revuneu
from cleaned_payments;

--5 total product sale 
select 
	count(product_id ) as total_products_sale
from cleaned_products;

--6 order for customer 
select 
	cc.customer_id,
	count(*) as  total_order_per_customer
from cleaned_customers cc 
join cleaned_orders co 
on cc.customer_id =co.customer_id 
group by cc.customer_id ;
