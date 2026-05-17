
--Day 43 fix Date fromate issue 
--1. cleaned_payments --convert     --> yyyy-mm-dd
UPDATE cleaned_payments
SET payment_date = 
CASE
    -- DD-MM-YYYY (day > 12 means it must be day, not month)
    WHEN SPLIT_PART(payment_date, '-', 1)::INT > 12
    THEN TO_DATE(payment_date, 'DD-MM-YYYY')::TEXT

    -- MM-DD-YYYY (middle part > 12 means it must be day)
    WHEN SPLIT_PART(payment_date, '-', 2)::INT > 12
    THEN TO_DATE(payment_date, 'MM-DD-YYYY')::TEXT

    ELSE payment_date
END;

UPDATE cleaned_payments
SET payment_date = TO_DATE(payment_date, 'DD-MM-YYYY')::TEXT;


--2. cleaned_customers --convert     --> yyyy-mm-dd
UPDATE cleaned_customers
SET signup_date = 
CASE
    -- Already in YYYY-MM-DD format, skip
    WHEN signup_date ~ '^\d{4}-\d{2}-\d{2}$'
    THEN signup_date

    -- DD-MM-YYYY (first part > 12, must be day)
    WHEN SPLIT_PART(signup_date, '-', 1)::INT > 12
    THEN TO_DATE(signup_date, 'DD-MM-YYYY')::TEXT

    -- MM-DD-YYYY (middle part > 12, must be day)
    WHEN SPLIT_PART(signup_date, '-', 2)::INT > 12
    THEN TO_DATE(signup_date, 'MM-DD-YYYY')::TEXT

    ELSE signup_date
END;

UPDATE cleaned_customers
SET signup_date = TO_DATE(signup_date, 'DD-MM-YYYY')::TEXT;



-- Query 3 - cleaned_orders
UPDATE cleaned_orders
SET order_date = 
CASE
    -- Already in YYYY-MM-DD format, skip
    WHEN order_date ~ '^\d{4}-\d{2}-\d{2}$'
    THEN order_date

    -- DD-MM-YYYY (first part > 12, must be day)
    WHEN SPLIT_PART(order_date, '-', 1)::INT > 12
    THEN TO_DATE(order_date, 'DD-MM-YYYY')::TEXT

    -- MM-DD-YYYY (middle part > 12, must be day)
    WHEN SPLIT_PART(order_date, '-', 2)::INT > 12
    THEN TO_DATE(order_date, 'MM-DD-YYYY')::TEXT

    ELSE order_date
END;

-- Query 2 - Simple conversion
UPDATE cleaned_orders
SET order_date = TO_DATE(order_date, 'DD-MM-YYYY')::TEXT;


--1.cleaned_customers
ALTER TABLE cleaned_customers
ALTER COLUMN customer_id TYPE INT USING customer_id::INT,
ALTER COLUMN customer_name TYPE VARCHAR(100),
ALTER COLUMN city TYPE VARCHAR(100),
ALTER COLUMN signup_date TYPE DATE USING signup_date::DATE;

ALTER TABLE cleaned_customers
ADD PRIMARY KEY (customer_id);

--2.cleaned_products
ALTER TABLE cleaned_products
ALTER COLUMN product_id TYPE INT USING product_id::INT,
ALTER COLUMN product_name TYPE VARCHAR(100),
ALTER COLUMN category TYPE VARCHAR(100),
ALTER COLUMN price TYPE DECIMAL(10,2) USING price::DECIMAL;

ALTER TABLE cleaned_products
ADD PRIMARY KEY (product_id);

--3.cleaned_orders

ALTER TABLE cleaned_orders
ALTER COLUMN order_id TYPE INT USING order_id::INT,
ALTER COLUMN customer_id TYPE INT USING customer_id::INT,
ALTER COLUMN order_date TYPE DATE USING order_date::DATE;

ALTER TABLE cleaned_orders
ADD PRIMARY KEY (order_id);

ALTER TABLE cleaned_orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES cleaned_customers(customer_id);

--4. cleaned_order_details
ALTER TABLE cleaned_order_details
ALTER COLUMN order_detail_id TYPE INT USING order_detail_id::INT,
ALTER COLUMN order_id TYPE INT USING order_id::INT,
ALTER COLUMN product_id TYPE INT USING product_id::INT,
ALTER COLUMN quantity TYPE INT USING quantity::INT;

ALTER TABLE cleaned_order_details
ADD PRIMARY KEY (order_detail_id);

ALTER TABLE cleaned_order_details
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES cleaned_orders(order_id);

ALTER TABLE cleaned_order_details
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES cleaned_products(product_id);

--5.cleaned_payments

ALTER TABLE cleaned_payments
ALTER COLUMN payment_id TYPE INT USING payment_id::INT,
ALTER COLUMN order_id TYPE INT USING order_id::INT,
ALTER COLUMN payment_amount TYPE DECIMAL(10,2) USING payment_amount::DECIMAL,
ALTER COLUMN payment_date TYPE DATE USING payment_date::DATE;

ALTER TABLE cleaned_payments
ADD PRIMARY KEY (payment_id);

ALTER TABLE cleaned_payments
ADD CONSTRAINT fk_payment_order
FOREIGN KEY (order_id)
REFERENCES cleaned_orders(order_id);


