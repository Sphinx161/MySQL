-- PERFORMING JOINS ALONG WITH ORDER BY AND GROUP BY 

SELECT DATABASE();

-- [1] NOTE JOINS RESULTS IN DUPLICATE DATA ALSO 
-- IF THEY FIND MULTIPLE MATCHES OF A ROW 
-- https://dataschool.com/how-to-teach-people-sql/inner-join-animated/

-- [2] SORT ALL THE PURCHASES FROM HIGH TO LOW OF ALL CUSTOMERS 
SELECT first_name, last_name, order_date, amount 
FROM customers 
INNER JOIN orders -- INNER JOIN AND JOIN BOTH HAVE THE SAME MEANINGS
	ON customers.id = orders.customer_id
ORDER BY amount DESC;

-- [3] FIND THE TOTAL PURCHASE MADE BY EACH CUSTOMER, FIND THE CUSTOMER WHO HAS SPENT THE MOST 
SELECT first_name, last_name, order_date, SUM(amount) 
FROM customers
JOIN orders 
	ON customers.id = orders.customer_id 
GROUP BY customer_id -- first_name, last_name can be used but best is using primary key or unique id
ORDER BY amount DESC; -- NOTICE NEED NOT SPECIFY SUM(AMOUNT) 

SELECT first_name,
		last_name,
        order_date,
        SUM(amount) AS total_spent 
FROM customers
JOIN orders 
	ON customers.id = orders.customer_id 
GROUP BY customers.id -- first_name, last_name can be used but best is using primary key or unique id
ORDER BY total_spent DESC;

-- -----------------------------------------------------------------------------------------------------
-- LEFT JOIN 

SELECT first_name, last_name, order_date, amount 
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id;
-- [4] SHOW ALL THE CUSTOMERS THAT HAVE 0 OR MORE PURCHASES TO SEND COUPONS BASED ON PURCHASE STATUS
/*
# first_name	last_name	order_date	amount
Boy				George		2017-11-11	35.50
Boy				George		2016-02-10	99.99
George			Michael		2015-01-03	12.50
George			Michael		2014-12-12	800.67
David			Bowie		NULL		NULL
Blue			Steele		NULL		NULL
Bette			Davis		1999-04-11	450.25
*/
 -- NOTE - the rows David and Blue dont have purchases so they dont have their ids in orders table 
 -- but the made it to the final table because left join gets all the rows of left table 
 -- and hence as they dont hace orders associatesd with them they will be filled with null values.
 
 -- [5] FIND THE TOTAL PURCHASE OF ALL CUSTOMERS FROM HIGH TO LOW AND THE TABLE MUST NOT CONTAIN NULL VALUES , NULL -> 0
	-- 2 WAYS OF SOLVING
			# CASE STATEMENT 
            # IFNULL 

-- IFNULL (BEST METHOD)

 SELECT first_name,
		last_name, 
        IFNULL(SUM(amount),0) AS total_spent
FROM customers 
LEFT JOIN orders
	ON customers.id = orders.customer_id
GROUP BY customers.id -- cant use directly column of any table | customers.customer_id instead of id as both orders and customers have id
ORDER BY total_spent DESC;

SELECT * from customers;

-- CASE STATEMENT 
SELECT first_name,
	   last_name,
       CASE 
			WHEN SUM(amount) = NULL THEN 0     --  or WHEN SUM(amount) IS NULL
            ELSE SUM(amount)
		END AS total_spent 
FROM customers 
LEFT JOIN orders
	ON customers.id = orders.customer_id 
GROUP BY customers.id 
ORDER BY total_spent DESC;

-- fkey note dependency
-- right join
-- on delete cascade 
-- left right difference

    
	
 

 









