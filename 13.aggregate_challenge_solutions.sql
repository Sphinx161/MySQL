-- AGGREGATE CHALLENGE SOLUTIONS
	-- how many - COUNT
    -- total - SUM

-- [1] Print the number of books in the database
SELECT COUNT(title) FROM books;

-- [2] Print out how many books were released in each year
SELECT released_year, COUNT(released_year) AS "Total Books"
FROM books
GROUP BY released_year;

-- [3] Print out the total number of books in stock
SELECT SUM(stock_quantity) FROM books;

-- [4] Find the average released_year for each author
SELECT CONCAT(author_fname," ", author_lname) AS author , AVG(released_year) AS "avg realease year"
FROM books
GROUP BY author_lname, author_fname;

-- [5] Find the full name of the author who wrote the longest book
SELECT CONCAT(author_fname, " ", author_lname) AS name, pages 
FROM books
ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(author_fname, " ", author_lname) AS name, pages 
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

-- [6] 
/*
+------+---------+-----------+
| year | # books | avg pages |
+------+---------+-----------+
| 1945 |       1 |  181.0000 |
| 1981 |       1 |  176.0000 |
| 1985 |       1 |  320.0000 |
| 1989 |       1 |  526.0000 |
| 1996 |       1 |  198.0000 |
| 2000 |       1 |  634.0000 |
| 2001 |       3 |  443.3333 |
| 2003 |       2 |  249.5000 |
| 2004 |       1 |  329.0000 |
| 2005 |       1 |  343.0000 |
| 2010 |       1 |  304.0000 |
| 2012 |       1 |  352.0000 |
| 2013 |       1 |  504.0000 |
| 2014 |       1 |  256.0000 |
| 2016 |       1 |  304.0000 |
| 2017 |       1 |  367.0000 |
+------+---------+-----------+
*/
SELECT released_year AS year,COUNT(released_year) AS '# books', AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;
-- COUNT(*) || COUNT(released_year)