-- Evaluate the following.. 
SELECT 10 != 10;                -- false 0
SELECT 15 > 14 && 99 - 5 <= 94; -- true 1
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- true 1

-- [1] Select All Books Written Before 1980 (non inclusive)

SELECT title, released_year FROM books 
WHERE released_year < 1980 ;

-- [2] Select All Books Written By Eggers Or Chabon
SELECT title, author_fname , author_lname FROM books 
WHERE author_lname IN ( 'Eggers', 'Chabon');

-- [3] Select All Books Written By Lahiri, Published after 2000
SELECT title, author_fname , author_lname, released_year FROM books 
WHERE released_year > 2000 AND author_lname = 'Lahiri';

-- [4] Select All books with page counts between 100 and 200
SELECT title, pages FROM books 
WHERE pages BETWEEN 100 AND 200; 

-- [5] Select all books where author_lname  starts with a 'C' or an 'S'
SELECT title, author_fname , author_lname FROM books 
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_fname , author_lname FROM books 
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');

-- [6] If title contains 'stories'   -> Short Stories Just Kids and A Heartbreaking Work  -> Memoir Everything Else -> Novel
SELECT title, author_lname, 
	CASE 
		WHEN title LIKE '%stories' THEN 'Short Stories'
		WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
		ELSE 'Novel'
	END AS TYPE 
FROM books;

-- Bonus: Make This Happen
/*
+-----------------------------------------------------+----------------+---------+
| title                                               | author_lname   | COUNT   |
+-----------------------------------------------------+----------------+---------+
| What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
| White Noise                                         | DeLillo        | 1 book  |
| A Hologram for the King: A Novel                    | Eggers         | 3 books |
| Oblivion: Stories                                   | Foster Wallace | 2 books |
| Norse Mythology                                     | Gaiman         | 3 books |
| 10% Happier                                         | Harris         | 1 book  |
| fake_book                                           | Harris         | 1 book  |
| The Namesake                                        | Lahiri         | 2 books |
| Lincoln In The Bardo                                | Saunders       | 1 book  |
| Just Kids                                           | Smith          | 1 book  |
| Cannery Row                                         | Steinbeck      | 1 book  |
+-----------------------------------------------------+----------------+---------+
*/

SELECT title, author_lname,
	CASE 
		WHEN COUNT(*) >= 2 THEN CONCAT(COUNT(*)," books")
        ELSE CONCAT(COUNT(*)," book")
     END AS COUNT   
FROM books
GROUP BY author_lname, author_fname
ORDER BY COUNT(*);


SELECT title, author_lname,
	CASE 
		WHEN COUNT(*) = 1 THEN "1 book"
        ELSE CONCAT(COUNT(*)," books")
     END AS COUNT   
FROM books
GROUP BY author_lname, author_fname
ORDER BY COUNT(*);