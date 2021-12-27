# STRING FUNCTION TOPICS
	-- REVERSE
    -- CHAR_LENGTH 
    -- UPPER LOWER

-- ----------------------------------------------
# REVERSE 
SELECT REVERSE("hello world");

# [1] CREATE PALINDROME 
SELECT CONCAT("apple", REVERSE("apple"));

# [2] CREATE PALINDROME WITH AUTHOR NAME
SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books;
-- ----------------------------------------------
# CHAR_LENGTH

SELECT CONCAT( author_lname, 
			   " is ",
               CHAR_LENGTH(author_lname),
               " characters long")
FROM books;

-- "Lahiri is 6 characters long" ....
-- etc...
-- -----------------------------------------------
# UPPPER AND LOWER

SELECT UPPER("hello mighty Perman");
SELECT LOWER("HELLO mighty PERMAN");

-- [1] print author name with the first letter as small and rest as capital
SELECT CONCAT( 
		LOWER(SUBSTRING(author_fname, 1,1)),
        UPPER(SUBSTRING(author_fname,2)) 
        ) AS names
FROM books;
/*
    titles
--------------
	jHUMPA
	nEIL
	nEIL
	jHUMPA
	dAVE
	dAVE
	mICHAEL
*/

-- ---------------------------------------------------------------------------------
# STRING CHALLENGES
-- [1] Reverse and Uppercase the following sentence
SELECT REVERSE( UPPER("Why does my cat look at me with such hatred?"));

-- [2] What is the output ?
SELECT REPLACE
		(CONCAT('I', ' ', 'like', ' ', 'cats'),' ','-');
  -- "I-like-cats"
  
-- [3] Replace spaces in titles with '->'
SELECT REPLACE( title, ' ', '->') as title
FROM books;

-- [4] Print This Out 
SELECT author_lname as forwards , REVERSE(author_lname) AS backwards 
FROM books;

-- [5] full name in caps
SELECT UPPER( CONCAT( author_fname," ", author_lname) ) as names
FROM books;

-- [6] replicate this
/*
+--------------------------------------------------------------------------+
| blurb                                                                    |
+--------------------------------------------------------------------------+
| The Namesake was released in 2003                                        |
| Norse Mythology was released in 2016                                     |
| American Gods was released in 2001                                       |
| Interpreter of Maladies was released in 1996                             |
| A Hologram for the King: A Novel was released in 2012                    |
| The Circle was released in 2013                                          |
| The Amazing Adventures of Kavalier & Clay was released in 2000           |
| Just Kids was released in 2010                                           |
| A Heartbreaking Work of Staggering Genius: was released in 2001          |
| Coraline was released in 2003                                            |
| What We Talk About When We Talk About Love: Stories was released in 1981 |
| Where I'm Calling From: Selected Stories was released in 1989            |
| White Noise was released in 1985                                         |
| Cannery Row was released in 1945                                         |
| Oblivion: Stories was released in 2004                                   |
| Consider the Lobster was released in 2005                                |
*/

SELECT CONCAT(title, " was released in ", released_year) as 'year of release'
FROM books;

-- [7] title and character count
SELECT title AS TITLE , CHAR_LENGTH(title) as "character count" 
FROM books;

-- [8] BLASTER! 
/*
+---------------+-------------+--------------+
| short title   | author      | quantity     |
+---------------+-------------+--------------+
| American G... | Gaiman,Neil | 12 in stock  |
| A Heartbre... | Eggers,Dave | 104 in stock |
+---------------+-------------+--------------+
*/

SELECT CONCAT(SUBSTRING(title, 1, 10), "...") as "short title",
	  CONCAT(author_lname, ",", author_fname) as author,
      CONCAT(stock_quantity, " in stock") as quantity
FROM books
WHERE released_year = 2001;

-- ---------


SELECT CHAR_LENGTH(345);







