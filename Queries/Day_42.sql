--Day 42 :
--1 create cleaned tables
create table cleaned_customers(
	customer_id varchar(50),
	customer_name varchar(100),
	city varchar(50),
	sighnup_date varchar(50)
);


create table cleaned_orders(
	order_id varchar(50),
	customer_id varchar(50),
	order_date varchar(50)
);

CREATE TABLE cleaned_order_details (
    order_detail_id VARCHAR(50),
    order_id        VARCHAR(50),
    product_id      VARCHAR(50),
    quantity        VARCHAR(50)
);


create table cleaned_payments(
	payment_id varchar(50),
	order_id varchar(50),
	payment_amount varchar(50),
	payment_date varchar(50)
);

create table cleaned_products(
	product_id varchar(50),
	product_name varchar(50),
	category varchar(50),
	price varchar(50)
);

--2.     clean customer table (cleaned_customers)
--2.1 Remove Space

select * from cleaned_customers;

update cleaned_customers 
	set customer_id=TRIM(customer_id),
	 customer_name=TRIM(customer_name),
	 city=TRIM(city),
	 signup_date=TRIM(signup_date);
 
--2.2 Standardize text

update cleaned_customers
set customer_name =UPPER(customer_name),
	city=UPPER(city);

--2.3 Replace Null value 

update cleaned_customers 
	set customer_name='UNKNOWN'
where customer_name is null;

update cleaned_customers 
	set city='UNKNOWN'
where city is null;

update cleaned_customers 
	set signup_date='01-01-2024'
where signup_date is null;

--2.4 demove duplicates

select count(*)
from cleaned_customers
group by customer_id having count(*)>1;

with duplicate_custimers as (
select 
	customer_id,
	row_number() over (partition by customer_id) as rown_umber
	from cleaned_customers
)

delete from cleaned_customers where customer_id in (
	select customer_id from duplicate_custimers where rown_umber>1

)

--3.     clean o table (cleaned_orders)
--3.1 Remove Space
select * from cleaned_orders;

update cleaned_orders
set order_id=TRIM(order_id),
	customer_id=TRIM(customer_id),
	order_date=TRIM(order_date);
--3.2 Replace null value  tex
update cleaned_orders
set order_date='01-01-2024'
where order_date  is null;

--3.3 remove duplicate 

with order_cte as (
select order_id,
	row_number() over (partition by order_id) as row_number
	from cleaned_orders
)

delete from cleaned_orders where order_id in (select order_id from order_cte where "row_number" >1);

	
--4 clean order_details (cleaned_order_details)
--4.1 remove spacess
select * from cleaned_order_details;

update cleaned_order_details 
set order_detail_id=TRIM(order_detail_id),
	order_id=TRIM(order_id),
	product_id=TRIM(product_id),
	quantity=TRIM(quantity);
--4.2 Replace null value 
update cleaned_order_details
set order_id='UNKNOWN'
where order_id is null

update cleaned_order_details
set product_id='UNKNOWN'
where product_id is null;


update cleaned_order_details
set quantity='UNKNOWN'
where quantity is null;

--4.3 remove duplicates  
with order_details_cte as (
select order_detail_id,
		row_number() over(partition by order_detail_id) as row_number
from cleaned_order_details
)
select * from order_details_cte where row_number>1;

delete from cleaned_order_details where order_detail_id in  (select order_detail_id from order_details_cte where row_number>1);


--5 . clean products table (cleaned_products)
--5.1 remove 

select * from cleaned_products;

update cleaned_products
set product_id=TRIM(product_id),
	product_name=TRIM(product_name),
	category=TRIM(category),
	price=TRIM(price);

--5.1 Standardize tex
update cleaned_products
set product_name=UPPER(product_name),
	category=UPPER(category);

--5.2 Replace null value 
update cleaned_products
set product_name='UNKNOWN'
where product_name is null;

update cleaned_products
set category='UNKNOWN'
where category is null;
--5.3 remove duplicate

with cleaned_products_cte as (
select product_id,
		row_number() over(partition by product_id) as row_number
		from cleaned_products
)
delete from cleaned_products where product_id in (select product_id from cleaned_products_cte where row_number>1)
	
--6 clean cleaned_payments
--6.1  remove space 

select * from cleaned_payments;
update cleaned_payments
set payment_id=TRIM(payment_id),
	order_id=TRIM(order_id),
	payment_amount=TRIM(payment_amount),
	payment_date=TRIM(payment_date);

--6.2 replace null

update cleaned_payments
set  payment_amount=0
where payment_amount is null;
	
with cleaned_payments_cte as (
select 
	payment_id,
	row_number() over (partition by payment_id) as row_number
	from cleaned_payments 
)
delete from cleaned_payments where payment_id in (select payment_id from cleaned_payments_cte where row_number>1);

