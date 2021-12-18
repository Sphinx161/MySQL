# String Functions 
	-- CONCAT 
    -- SUBSTRING
    -- REPLACE
    
DROP DATABASE IF EXISTS book_shop;
SHOW DATABASES;
CREATE DATABASE book_shop;
USE book_shop;
SELECT database();

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


DESC books;
SHOW COLUMNS FROM books;
SELECT * FROM books;

-- -------------------------------------------------------------------------------------------------------
# CONCAT 

SELECT CONCAT('Hello', ' ', 'Shibani');

SELECT CONCAT(book_id, ' ', author_fname, ' ', author_lname)
FROM books;

SELECT author_fname AS First , author_lname AS Last, CONCAT(author_fname, " ", author_lname) as Full_Name
FROM books;
-- if AS Full_Name is not provided then it displays CONCAT(......) as column name 

SELECT CONCAT_WS(' - ',title, released_year, pages)
FROM books;

SELECT CONCAT_WS(44,title, released_year, pages)
FROM books;

-- --------------------------------------------------------------------------------------------------------
# SUBSTRING or SUBSTR
SELECT SUBSTRING("Hello World", 1,5);
-- "Hello"	| prints first 5 letters from index 1
SELECT SUBSTRING("Hello_Shibani",6);
-- "_Shibani"
SELECT SUBSTRING("Hello_Shibani",-6);
-- "hibani"
SELECT SUBSTRING("Hello_World", -6,2);
-- "_W"		| print first 2 letters of output substring(-6)-> "_World"
SELECT SUBSTRING("Hello_World", 3,3);
-- "llo"
SELECT SUBSTRING("Hello_World", 6,4);
-- "_Wor"

# [1] GET ALL TITLES WITH 10 CHARACTER LIMIT
SELECT SUBSTRING(title, 1, 10) AS "Book Title" FROM books;
/*
# Book Title
-----------
The Namesa
Norse Myth
American G
Interprete
A Hologram
The Circle
The Amazin
Just Kids
A Heartbre
Coraline
What We Ta
Where I'm 
White Nois
Cannery Ro
Oblivion: 
Consider t
*/

-- [2] USE CONCAT ALONG WITH SUBSTRING 
SELECT CONCAT( SUBSTRING(title,1,10) , "...") AS "Book Title" FROM books;
/*

# Book Title
------------
White Nois...
Where I'm ...
What We Ta...
The Namesa...
The Circle...
The Amazin...
Oblivion: ...
Norse Myth...
Just Kids...
Interprete...
Coraline...
Consider t...
Cannery Ro...
American G...
A Hologram...
A Heartbre...
*/
-- --------------------------------------------------------------------------------------
# REPLACE 

SELECT REPLACE("Fred Liu", " ", " and "); 
-- "Fred and Liu"

# [1] CASE SENSTIVE 
SELECT REPLACE("Old school", "o", "9");
-- "Old sch99l" didnt replace the capital O , case sensitivw "O", "o"

# [2] USE BOTH REPLACE AND CONCAT 
SELECT REPLACE(
	CONCAT( author_fname," ", author_lname), " ", "-") AS Names
    FROM books;
/*
# Names
--------------
Jhumpa-Lahiri
Neil-Gaiman
Neil-Gaiman
Jhumpa-Lahiri
Dave-Eggers
Dave-Eggers
Michael-Chabon
Patti-Smith
Dave-Eggers
Neil-Gaiman
Raymond-Carver
Raymond-Carver
Don-DeLillo
John-Steinbeck
David-Foster-Wallace
David-Foster-Wallace
*/

-- ------------------------------------------------------------------------------



