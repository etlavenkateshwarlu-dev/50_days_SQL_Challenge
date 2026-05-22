
--- 49
--1. Find top 5 customer using CTE 

with customer_cte_revenue_cte as(
select 
	cc.customer_id ,
	cc.customer_name ,
	sum(cp.payment_amount) as total_revenue 
from cleaned_customers cc
join cleaned_orders co   
	on cc.customer_id =co.order_id 
join cleaned_payments cp 
	on co.order_id   =cp.order_id 
group by cc.customer_id ,cc.customer_name
)
select * from customer_cte_revenue_cte
order by total_revenue desc limit 5;

--2 To 5 product using CTE

with product_sales_cte as(
select 
	cp.product_id ,
	cp.product_name ,
	sum(cod.quantity ) as total_sale
from cleaned_products cp 
join cleaned_order_details cod 
	on cp.product_id =cod.product_id 
group by cp.product_id ,cp.product_name 
)
select * from product_sales_cte
order by total_sale desc limit 5;

--3 Rank the customer base on  revenue 


with customer_cte_revenue_cte as(
select 
	cc.customer_id ,
	cc.customer_name ,
	sum(cp.payment_amount) as total_revenue 
from cleaned_customers cc
join cleaned_orders co   
	on cc.customer_id =co.order_id 
join cleaned_payments cp 
	on co.order_id   =cp.order_id 
group by cc.customer_id ,cc.customer_name
)
select
	customer_id,
	customer_name,
	dense_rank() over (order by total_revenue ) as customer_rank
from customer_cte_revenue_cte;


--4. Rank products by quanity sold
with product_rank_cte as (
select 
	cp.product_id ,
	cp.product_name,
	sum(cod.quantity) as total_quanity 
from cleaned_products cp 
join cleaned_order_details cod 
on cp.product_id =cod.product_id 
group by cp.product_id ,cp.product_name 
)
select 
	product_id,
	product_name,
	total_quanity,
	rank() over (order by total_quanity desc)
from product_rank_cte;

--5 revenue per category  using cte
with product_revenue_category_cte as(
select 
	cp.category ,
	sum(cod.quantity *cp.price ) as toatl_revenue
from cleaned_products cp 
join cleaned_order_details cod  
	on cp.product_id =cod.product_id 
group by cp.category )
select 
	*
from product_revenue_category_cte 
order by toatl_revenue desc;

-- 6 Revenue Using Case 

with customer_cte_revenue_cte as(
select 
	cc.customer_id ,
	cc.customer_name ,
	sum(cp.payment_amount) as total_revenue 
from cleaned_customers cc
join cleaned_orders co   
	on cc.customer_id =co.order_id 
join cleaned_payments cp 
	on co.order_id   =cp.order_id 
group by cc.customer_id ,cc.customer_name
)
select 
	customer_id,
	customer_name,
	case 
		when total_revenue>5000 then 'High Revenue'
		when total_revenue>2000 then 'Medeum Revenue'
		else 'Low Revenue'
	end as revenue_category
from customer_cte_revenue_cte;


--7 Stored Procedure --Customer report revenue 

CREATE OR REPLACE PROCEDURE get_customer_revenue_report()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Return customer revenue report
   with customer_cte_revenue_cte as(
select 
	cc.customer_id ,
	cc.customer_name ,
	sum(cp.payment_amount) as total_revenue 
from cleaned_customers cc
join cleaned_orders co   
	on cc.customer_id =co.order_id 
join cleaned_payments cp 
	on co.order_id   =cp.order_id 
group by cc.customer_id ,cc.customer_name
)
select * from customer_cte_revenue_cte;

END;
$$;

call get_customer_revenue_report();