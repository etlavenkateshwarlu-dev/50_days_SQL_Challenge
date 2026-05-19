
--Day 46 
--1. Top Selling Products: find teh product sale in higest quantity


select 
	cp.product_id,
	cp.product_name ,
	sum(cod.quantity ) as toatl_sell_quantity
from cleaned_products cp 
join cleaned_order_details cod 
on cp.product_id =cod.product_id 
group by cp.product_id ,cp.product_name 
order by toatl_sell_quantity  desc;


--2 Last selling :FInd teh lowest selling product

select 
	cp.product_id,
	cp.product_name ,
	sum(cod.quantity ) as toatl_sell_quantity
from cleaned_products cp 
join cleaned_order_details cod 
on cp.product_id =cod.product_id 
group by cp.product_id ,cp.product_name 
order by toatl_sell_quantity  asc;

--3. What revenu genertaed by each product
select 
	cp.product_id ,
	cp.product_name ,
	sum(cod.quantity *cp.price) as total_price
from cleaned_products cp 
join cleaned_order_details cod  
	on cp.product_id =cod.product_id 
group by cp.product_name ,cp.product_id ;

--4 cATEGORY WISE SALE	:FInd total sales for each categrgory
select 
	cp.category ,
	sum(cod.quantity *cp.price) as total_price
from cleaned_order_details cod
join cleaned_products cp 
	on cod.product_id =cp.product_id 
group by cp.category  ;

--5 Most expensive Product sold:Find hihest priced product that was sold
select 
	cp.product_id  ,
	cp.product_name ,
	cp.price 
from cleaned_order_details cod
join cleaned_products cp 	
	on cod.product_id =cp.product_id 
order  by cp.price  desc limit 1;

--Or

select 
	cp.product_id  ,
	cp.product_name ,
	cp.price 
from cleaned_products cp 	 
order  by cp.price  desc limit 1;

--6. average price per categoery :Find avergae product price per catergoery wise

select 
	cp.category   ,
	avg(cp.price ) as average_price
from cleaned_products cp
group by cp.category 
order by average_price desc;
