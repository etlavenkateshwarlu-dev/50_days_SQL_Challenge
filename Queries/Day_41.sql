
--Day 41

create table raw_customers(
	customer_id varchar(50),
	customer_name varchar(100),
	city varchar(50),
	sighnup_date varchar(50)
);


create table raw_orders(
	order_id varchar(50),
	customer_id varchar(50),
	order_date varchar(50)
);

CREATE TABLE raw_order_details (
    order_detail_id VARCHAR(50),
    order_id        VARCHAR(50),
    product_id      VARCHAR(50),
    quantity        VARCHAR(50)
);

drop table raw_payments;
create table raw_payments(
	payment_id varchar(50),
	order_id varchar(50),
	payment_amount varchar(50),
	payment_date varchar(50)
);

create table raw_products(
	product_id varchar(50),
	product_name varchar(50),
	category varchar(50),
	price varchar(50)
);

