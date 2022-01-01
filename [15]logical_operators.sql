/* TOPICS COVERED
	 !=  
     NOT LIKE
     > , >=
     < , <= 
     AND &&
     OR ||
     BETWEEN x AND y ( both inclusive)
     IN 
*/
USE book_shop;

# FIND ALL THE BOOKS THAT ARE NOT FROM YEAR 2017
SELECT title FROM books
WHERE released_year != 2017;

# FIND ALL BOOKS THAT DONT START WITH W
SELECT title FROM books
WHERE title NOT LIKE 'W%';

# MULTIPLE AND
SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';

# FIND ALL THE BOOKS THAT WERE RELEASED AFTER 2013
SELECT title, released_year FROM books
WHERE released_year >= 2000
ORDER BY released_year DESC;


-- 0 FALSE
-- 1 TRUE   
SELECT 99 < 90; -- ( 0 )
SELECT 1 > 1;
SELECT 'a' > 'b';
SELECT 'A' > 'a'; -- 0
SELECT 'A' >= 'a'; -- 1
select 'b' > 'A'; -- 1

# FIND ALL THE BOOKS OF EGGERS AFTER 2000 
SELECT title, released_year FROM books 
WHERE author_lname = 'Eggers' AND released_year > 2000;


SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              OR released_year > 2010 
OR     stock_quantity > 100;

# remove all spaces from a string
select replace("my very educated mother justs served us 9 pizzas", " ", "") ;

select * from books;

-- -------------------------------------------------------------------------------------
# IN KEYBOARD 

/* 
Whenever u are using multiple OR and AND in the where clause for the comparisions of values from
a same column in the table then IN can make its way 

IN works for a particular set of values that has to be predifined
Will it pork for different datatypes ?

*/

# this gives an error i cant use 2 column names in the where clause
-- SELECT title, released_year FROM books 
-- WHERE released_year, author_lname IN (2003, 2016, 'Lahiri');

SELECT title, released_year FROM books 
WHERE released_year IN (2003, 2016, 'Lahiri'); 

# FIND ALL BOOKS FROM EVEN YEAR 
SELECT title, released_year FROM books
WHERE released_year %2 = 0     
ORDER BY released_year DESC ;

# single mathematical operation is faster than the ( 1,2,3,4,5,6) 
# comparing all the elements one by one

# RATE THE STOCK QUANTITIES 
SELECT title, stock_quantity ,
	CASE 
    WHEN stock_quantity < 50 THEN '*'
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
    -- ELSE '***'
    END AS stock_rate 
FROM books;

  -- ELSE '***' if else statement is omited then the values that dont fall into the category are saved as NULL

 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 
# note the order hence between an be avoided as <= 100 will only execute when the first condition is not met 

















