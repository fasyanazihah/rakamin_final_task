USE rakamin_report;

DROP TABLE IF EXISTS transactions;

CREATE TABLE IF NOT EXISTS transactions (
	transaction_id INTEGER NOT NULL,
	cust_email VARCHAR(100),
	cust_city VARCHAR(30),
	order_date DATE,
	order_qty INTEGER,
	product_name VARCHAR(50),
	product_price NUMERIC(6, 2),
	category_name VARCHAR(20),
	total_sales BIGINT,
	PRIMARY KEY (transaction_id)
);

INSERT INTO transactions(transaction_id,cust_email,cust_city,order_date,order_qty,product_name,product_price,category_name,total_sales)
SELECT ROW_NUMBER() OVER(),
	c.customer_email,
	c.customer_city,
	o.date,
	o.quantity,
	p.prod_name,
	p.price,
	pc.category_name,
	p.price * o.quantity
FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
INNER JOIN products AS p ON o.prod_number = p.prod_number
INNER JOIN product_categories AS pc ON p.category = pc.category_id;