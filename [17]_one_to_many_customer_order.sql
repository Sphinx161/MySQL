-- CUSTOMERS TABLE 
CREATE DATABASE customer_order_db;
USE customer_order_db;
SELECT database();

show tables;
CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

-- ORDERS TABLE 
CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT ,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM customers;
SELECT * FROM orders;
    
DELETE FROM customers;
SET SQL_SAFE_UPDATES = 0;

-- ------------------------------------------------------
-- Finding Orders Placed By George: 2 Step Process
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;

-- Finding Orders Placed By George: Using a subquery
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
-- --------------------------------------------------
# CROSS JOIN 
SELECT * FROM customers, orders;

-- --------------------------------------------------
# INNER JOIN 

-- IMPLICIT INNER JOIN 
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount FROM customers, orders
WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN 
SELECT * FROM customers 
JOIN orders
	ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
	ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM orders 
JOIN customers 
	ON customers.id = orders.customer_id;

-- change in order gives the same results but 
SELECT *
FROM orders 
JOIN customers 
	ON customers.id = orders.customer_id;
-- this query doesb=n't give the same results the order columms come first

-- ARBITRARY JOIN - meaningless, but still possible 

SELECT * FROM customers
JOIN orders ON customers.id = orders.id;
