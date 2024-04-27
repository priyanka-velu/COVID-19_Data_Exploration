SELECT product_code, product_name, list_price, discount_percent
FROM products;

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM customers
WHERE last_name >= 'M'
ORDER BY last_name ASC;

SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;















