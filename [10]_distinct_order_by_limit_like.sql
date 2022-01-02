-- TOPICS LEARNT 
	-- DISTINCT 
    -- ORDER BY 
    -- LIMIT 
    -- LIKE 
    -- WILDCARDS [ % , _]
    
-- ------------------------------------------------------------------------------------------------
# DISTINCT 

SELECT DISTINCT author_lname FROM books;
-- notice there are 2 authors with the last name harris but that has been ignored 
-- distint lname are displayed

SELECT DISTINCT author_lname , author_fname FROM books;

-- -----------------------------------------------------------------------------------------------
#ORDER BY

SELECT released_year FROM books ORDER BY released_year DESC;
SELECT released_year FROM books ORDER BY released_year ASC;

SELECT title, author_fname FROM books ORDER BY stock_quantity ASC;

SELECT author_fname, title, released_year FROM books ORDER BY 3,2 DESC; -- RECENT RELEASED BOOKS

SELECT author_fname, title, released_year FROM books ORDER BY released_year, title DESC; 
-- RECENT RELEASED BOOKS
-- Here its arranges according to the realeased_year in ASCENDING ORDER
-- And the title is arranged in DESCENDING ORDER as specified

-- -----------------------------------------------------------------------------------------------
# LIMIT

-- GET THE FIRST ENTRY OF THE COLUMN ( USED WITHOUT ORDER BY )
SELECT * FROM books LIMIT 1;
SELECT * FROM books LIMIT 7;

-- FIND 5 RECENT RELEASES 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 15 ;

-- WHAT IS THE NUMBER OF ROWS VISIBLE Ans->(5)
SELECT title, released_year FROM books 
ORDER BY released_year LIMIT 0,5;

-- PRINTS THE 11TH ROW 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;

-- IF YOU WANT TO PRINT FROM ONE ROW TO THE END OF YHE TABLE 
SELECT title FROM books LIMIT 5, 123219476457;

-- -----------------------------------------------------------------------------------------------
# LIKE AND WILDCARDS
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
 
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
 
SELECT title FROM books WHERE  title LIKE 'the';
 
SELECT title FROM books WHERE  title LIKE '%the';
 
SELECT title FROM books WHERE title LIKE '%the%';

-- -----------------------------------------------------------------------------------------------
















