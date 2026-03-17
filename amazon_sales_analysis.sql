CREATE TABLE amazon_sales(
	index_no TEXT,
	order_id TEXT,
	order_date TEXT,
	status TEXT,
	fulfillment TEXT,
	sales_channel TEXT,
	ship_service TEXT,
	style TEXT,
	sku TEXT,
	category TEXT,
	size TEXT,
	asin TEXT,
	courier_state TEXT,
	quantity TEXT,
	currency TEXT,
	amount TEXT,
	ship_city TEXT,
	ship_state TEXT,
	ship_postal_code TEXT,
	ship_country TEXT,
	promotion TEXT,
	b2b TEXT,
	fulfilled_by TEXT
);

SELECT*FROM amazon_sales
LIMIT 10;

SELECT COUNT(*)AS total_rows
FROM amazon_sales;

SELECT COUNT (DISTINCT order_id) AS 
total_orders
FROM amazon_sales;

SELECT SUM(CAST(amount AS NUMERIC)) AS 
total_revenue
FROM amazon_sales;

SELECT category,
	SUM(CAST(amount AS NUMERIC)) AS revenue
FROM amazon_sales
GROUP BY category
ORDER BY revenue DESC;

SELECT ship_state,
	SUM(CAST(amount AS NUMERIC)) AS revenue
FROM amazon_sales
GROUP BY ship_state
ORDER BY revenue DESC
LIMIT 10;

SELECT sku,
	SUM(quantity::INTEGER)AS total_units
FROM amazon_sales
GROUP BY sku
ORDER BY total_units DESC
LIMIT 10;

SELECT fulfillment,
	SUM(CAST(amount AS NUMERIC))AS revenue
FROM amazon_sales
GROUP BY fulfillment
ORDER BY revenue DESC;

SELECT b2b,
	COUNT(*)AS orders
FROM amazon_sales
GROUP BY b2b;

SELECT ship_city,
	SUM(CAST(amount AS NUMERIC)) AS revenue
FROM amazon_sales
GROUP BY ship_city
ORDER BY revenue DESC
LIMIT 10;

