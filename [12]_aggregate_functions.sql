# AGGREGATE FUNCTIONS 
	-- COUNT 
    -- GROUP BY
    

-- -----------------------------------------------------------------------
# COUNT 

-- [1] PROVIDE ALL BOOKS IN THE DATABASE
SELECT * FROM books;
SELECT COUNT(*) FROM books;  

-- [2] FIND THE COUNT OF ALL AUTHOR LAST NAMES
SELECT COUNT(author_lname) FROM books;            # 19
SELECT COUNT( DISTINCT author_lname) FROM books; # 11

-- [3] FIND THE COUNT OF ALL AUTHORS FULL NAME
SELECT author_fname, author_lname FROM books;                    # 19
SELECT COUNT( DISTINCT author_fname, author_lname ) FROM books;  # 12

-- [4] FIND ALL THE BOOKS WITH "the" in it
SELECT COUNT(*) FROM books 
WHERE title LIKE '%the%';   # 6 

SELECT COUNT(title) FROM books 
WHERE title LIKE '%the%';   #6 

-- both gives the same result

-- --------------------------------------------------------------------------
# GROUP BY

-- [1] NOT THE RIGHT WAY TO USE GROUP BY AS NO MEANING 
SELECT author_lname, title FROM books 
GROUP BY author_lname;

-- [2] FIND THE NUMBER OF BOOKS BY EACH AUTHOR
SELECT author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname;
-- [NOTE] harris are actually 2 people but taken as 1 because of same last names
-- UPDATE CODE ->
SELECT author_lname, COUNT(*)
FROM books
GROUP BY author_fname, author_lname;
-- [NOTE] now there are 2 harris 

-- [3] FIND THE NUMBER OF BOOKS RELEASED IN EACH YEAR
SELECT CONCAT("In ", released_year, " ", COUNT(*), " books were released.") AS releases
FROM books 
GROUP BY released_year;
-- [NOTE] -> basically number of times released year is repeated
 
-- -----------------------------------------------------------------------------------
# MIN MAX 
SELECT MIN(released_year) FROM books;
SELECT MAX(released_year) FROM books;

-- [1] GET TITLE AND PAGE OF LONGEST BOOK
SELECT title, MAX(pages) FROM books; 
-- [NOTE!!] returns max page but not the book with max pages just returns 1st row title 

SELECT title,pages from books
WHERE pages = (SELECT max(pages) FROM books);

-- ALTERNATE SOLUTION
SELECT title,pages FROM books
ORDER BY pages DESC LIMIT 1;

-- [2] FIND WHEN EACH AUTHOR PUBLISHED THEIR FIRST BOOK
SELECT  author_fname,author_lname, MIN(released_year)  
FROM books
GROUP BY author_lname, author_fname;

-- [3] FIND THE LONGEST PAGE COUNT FOR EACH AUTHOR
SELECT author_fname, author_lname, MAX(pages) 
FROM books
GROUP BY author_fname, author_lname;

/*
-- ERROR for both title and pages 
select title, max(pages) as max_page from books 
having pages = max_page;
*/

SELECT title, max(pages) AS max_page FROM books 
WHERE pages = max_page;

select title, max(pages) from books;

select concat (author_fname, author_lname, " published their 1st book in ", MIN(released_year))
from books
group by author_fname, author_lname;

SELECT CONCAT( author_fname, author_fname, " ", author_lname, " published their 1st book in ") AS "first release", 
MIN( released_year) as year
FROM books
GROUP BY author_fname, author_lname;

-- ------------------------------------------------------------------------------------------------------------------------
# SUM 
-- FIND THE SUM OF PAGES OF ALL BOOKS
SELECT SUM(pages) FROM books;

-- FIND TOTAL NUMBER OF PAGES EACH AUTHOR HAS WRITTEN
SELECT author_fname, author_lname, SUM(pages) 
FROM books
GROUP BY author_lname, author_fname;

-- -------------------------------------------------------------------------------------------------------------------------
# AVG 

-- FIND THE AVERAGE RELEASED YEAR OF EACH OTHER
SELECT AVG(released_year) FROM books;

-- FIND THE AVERAGE NUMBER OF BOOKS EACH AUTHOR HAS
SELECT author_fname, author_lname, AVG(pages)
FROM books 
GROUP BY author_lname, author_fname;

-- FIND THE AVERAGE STOCK QUANTITY OF EACH RELEASED YEAR
SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year;















