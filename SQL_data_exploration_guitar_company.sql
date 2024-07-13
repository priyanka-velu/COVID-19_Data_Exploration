/* 

SQL data exploration: guitar store

*/
-- PART 1

-- get product_name from products table
SELECT product_name FROM products

-- count number of rows in products table
SELECT COUNT(*) AS number_of_products
FROM products;

-- product details
SELECT product_name, list_price, date_added
FROM products
ORDER BY product_name;

-- product summary
SELECT COUNT(*) AS number_of_products,
       MAX(list_price) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;

-- product statements
SELECT COUNT(*) AS number_of_products,
       MAX(list_price) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;

-- PART 2

-- return specific columns from products table
SELECT product_code, product_name, list_price, discount_price
FROM products

-- create full_name from customers table for last names from M-Z
-- sorted by last name in ascending sequence
SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM customers
WHERE last_name >= 'M'
ORDER BY last_name ASC;

-- find rows that is greater than 500 and less than 2000
-- sort by date_added in descending sequence
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- PART 3

-- join Categories table to Products table
SELECT c.category_name, p.product_name, p.list_price
FROM categories AS c
JOIN products AS p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name;

-- join Customers table to Addresses table and return a specific email
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers AS c
JOIN addresses AS a ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';

-- returns only return addresses that are the shipping addresses for the customer
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers AS c
JOIN addresses AS a ON c.customer_id = a.customer_id
AND c.shipping_address_id = a.address_id;

-- joins multiple tables
SELECT c.last_name, c.first_name, o.order_date, p.product_name, i.item_price, i.discount_amount, i.quantity
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN order_items AS i ON o.order_id = i.order_id
JOIN products AS p ON i.product_id = p.product_id
ORDER BY c.last_name, o.order_date, p.product_name;

-- PART 4

-- insert 'Brass' value to Categories table
INSERT INTO categories (category_id, category_name) 
VALUES (DEFAULT, 'Brass');

SELECT * FROM Categories
ORDER BY category_id;

-- modify row from Brass to Woodwinds
UPDATE categories 
SET 
	category_name = 'Woodwinds'
WHERE 
	category_id = 5;
    
SELECT * FROM Categories
ORDER BY category_id;

-- delete the row above
DELETE FROM categories
WHERE 
	category_id = 5;

SELECT * FROM Categories
ORDER BY category_id;

-- insert new row to Products table
INSERT INTO products
(product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES
(DEFAULT, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 
799.99, 0, NOW());

SELECT * FROM products;

-- PART 5

-- having with group by vs where clause
SELECT product_id, product_name, list_price, discount_percent, date_added
FROM products
GROUP BY product_id
HAVING list_price > 500;

SELECT product_id, product_name, list_price, discount_percent, date_added
FROM products
WHERE list_price > 500;

-- get count of orders and sum of tax
SELECT COUNT(order_id) AS orderCount, 
	SUM(tax_amount) AS taxSum
FROM orders;

-- find the count of the products and the max price in each category sort them by the highest product count
SELECT c.category_name, 
	COUNT(p.product_id) AS productCount, 
	MAX(p.list_price) AS listPriceMax
FROM categories AS c
INNER JOIN products AS p ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY productCount DESC;

-- return the sum of the price and sum of discount for each customer's email address
SELECT c.email_address, 
	SUM(oi.item_price * oi.quantity) AS itemPriceSum, 
    	SUM(oi.discount_amount * oi.quantity) AS discountAmountSum
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi ON o.order_id = oi.order_id
GROUP BY c.email_address
ORDER BY itemPriceSum DESC;

-- returns rows where the customer has more than one order and includes the order total
SELECT c.email_address, 
	COUNT(oi.order_id) AS orderCount,
    	SUM((oi.item_price - oi.discount_amount) * oi.quantity) AS orderTotal
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
INNER JOIN order_items AS oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING orderCount > 1
ORDER BY orderTotal DESC;

-- PART 6

-- creates a stored procedure that adds a new row to the Categories Table with test cases
DROP PROCEDURE IF EXISTS insert_category;

SELECT *
FROM Categories
ORDER BY category_id;

DELIMITER //
CREATE PROCEDURE insert_category
(
    category_name_param VARCHAR(255)
)
BEGIN
	INSERT INTO categories (category_id, category_name)
	VALUES (DEFAULT, category_name_param);
END//
DELIMITER ;

-- Test 1: (Failure since 'Guitars' row already exists for key 'category_name')
CALL insert_category('Guitars');

-- Test 2: (Pass since 'Flutes' row is added for key 'category_name')
CALL insert_category('Flutes');

-- creates a function that calculates the discount price of an item
DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price
(
  item_id_param	INT(11)
)
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE discount_price_var DECIMAL(10,2);
    
  SELECT item_price - discount_amount
  INTO   discount_price_var
  FROM   order_items
  WHERE  item_id = item_id_param;
    
  RETURN discount_price_var;
END//

DELIMITER ;

-- Test:
SELECT item_id, item_price, discount_amount, discount_price(item_id)
FROM order_items;

SET GLOBAL log_bin_trust_function_creators = 1;

-- creates a function that calculates the total price of an item
DROP FUNCTION IF EXISTS item_total;

DELIMITER //

CREATE FUNCTION item_total
(
  item_id_param INT(11)
)
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE total_amount_var DECIMAL(10,2);
    
  SELECT quantity * discount_price(item_id_param)
  INTO   total_amount_var
  FROM   order_items
  WHERE  item_id = item_id_param;
    
  RETURN total_amount_var;
END//

DELIMITER ;

-- Test:
SELECT item_id, discount_price(item_id), quantity, item_total(item_id)
FROM order_items;

-- PART 8

-- return the discount percent, discount amount, and discount price for each product
SELECT 
	product_name, 
    list_price, 
    discount_percent, 
    ROUND(list_price * (discount_percent/100), 2) AS discount_amount, 
    ROUND(list_price - (list_price * (discount_percent/100)), 2) AS discount_price
FROM products
ORDER BY discount_price DESC
LIMIT 5;

-- find items where the total is over $500
SELECT 
	item_id, 
    item_price, 
    discount_amount, 
    quantity,
    (item_price * quantity) AS price_total,
    (discount_amount * quantity) AS discount_total,
    ((item_price - discount_amount) * quantity) AS item_total
FROM order_items
WHERE ((item_price - discount_amount) * quantity) > 500
ORDER BY item_total DESC;

-- return one row for each product that has the same list price as another product
SELECT p1.product_name, p1.list_price
FROM products p1
JOIN products p2 
	ON p1.product_id != p2.product_id
	AND p1.list_price = p2.list_price
ORDER BY p1.product_name;

-- return one row for each category that has never been used
SELECT c.category_name, p.product_id
FROM categories c
LEFT JOIN products p 
	ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

SELECT *
FROM products;

SELECT *
FROM categories;

-- add a row for a new customer
INSERT INTO customers (email_address, password, first_name, last_name)
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

SELECT *
FROM customers;

-- Which customers have ordered more than one product?
SELECT c.email_address, COUNT(DISTINCT oi.product_id) AS count
FROM customers AS c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.email_address
HAVING count > 1;

-- What is the total quantity purchased for each product within each category?
SELECT
    IF(c.category_name IS NULL, 'Grand Total', c.category_name) AS category_name,
    CASE 
        WHEN c.category_name IS NULL AND p.product_name IS NULL THEN ''
        WHEN p.product_name IS NULL THEN 'Subtotal'
        ELSE p.product_name
    END AS product_name,
	SUM(oi.quantity) as total_qty_purchased
FROM categories AS c
INNER JOIN products AS p ON p.category_id = c.category_id
INNER JOIN order_items AS oi ON oi.product_id = p.product_id
GROUP BY c.category_name, p.product_name WITH ROLLUP;

-- creates a user with specific grant statements
CREATE USER 'PVelu'@'%' IDENTIFIED BY 'simplePassword';

GRANT SELECT, INSERT, UPDATE, DELETE ON `my_guitar_shop`.`Customers` TO 'PVelu'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `my_guitar_shop`.`Addresses` TO 'PVelu'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `my_guitar_shop`.`Orders` TO 'PVelu'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `my_guitar_shop`.`Order_Items` TO 'PVelu'@'%';
GRANT SELECT ON `my_guitar_shop`.`Products` TO 'PVelu'@'%';
GRANT SELECT ON `my_guitar_shop`.`Categories` TO 'PVelu'@'%';

REVOKE GRANT OPTION ON *.* FROM 'PVelu'@'%';
SHOW GRANTS FOR 'PVelu'@'%';
