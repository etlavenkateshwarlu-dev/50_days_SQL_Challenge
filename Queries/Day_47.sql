--Day 47 :Order anlasys
--1.Order per day :Find the number of orders placed daily 

select 
	order_date,
	count(*)
from cleaned_orders
group by order_date;

--2. FInd month order trend 

select 
	extract(month from order_date) as month,
	to_char(order_date ,'Month') as month_name,
	count(*)
from cleaned_orders
group by month ,month_name
order by month;

--3. Find highets order value 
select 
	co.order_id,
	sum(cp.payment_amount) as total_orders_value
from cleaned_orders co  
join cleaned_payments cp 
	on co.order_id   =cp.order_id  
group by co.order_id 
order by total_orders_value desc limit 1;

--4  Find Lowest order value 
select 
	co.order_id,
	sum(cp.payment_amount) as total_orders_value
from cleaned_orders co  
join cleaned_payments cp 
	on co.order_id   =cp.order_id  
group by co.order_id 
order by total_orders_value asc limit 1;

--5 Avergae Order Size : Find Average quantity per order
select avg(total_quantity) from (
select 
	co.order_id,
	sum(cod.quantity ) as total_quantity
from cleaned_orders co  
join cleaned_order_details cod  
	on co.order_id   =cod.order_id  
group by co.order_id 
order by total_quantity asc)

--6 : order distrubution :  Categorize orders by quanitity size(quantity <=2 small quantity <=5 Medium else large order)


select 
	co.order_id,
	cod.quantity,
	case when cod.quantity <=2 then 'Small'
		 when cod.quantity <=5 then 'Medium'
	     else  'Large' 
	end as orders_ategorize
from cleaned_orders co  
join cleaned_order_details cod  
	on co.order_id   =cod.order_id ;

--7 Peak Sales Day : Find day with higest number of orders

select 
	order_date,
	count(*) as total_orers_per_day
from cleaned_orders co 
group by co.order_date 
order by total_orers_per_day desc limit 1;
