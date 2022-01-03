-- JOINS EXERCISE [STUDENT PAPERS]

-- [1] CREATE DATABASE
CREATE DATABASE student_paper_db;
SELECT DATABASE();
USE student_paper_db;
SELECT DATABASE();

-- [2] CREATE STUDENTS TABLE 
CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20)
);

SHOW TABLES;
DESC students;
SHOW COLUMNS FROM students;

-- [3] CREATE PAPERS TABLE 
CREATE TABLE papers (
	title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- INSERT DATA INTO TABLES 
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

-- [Q1] PRINT THIS 
/*
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Carlos     | Borges and Magical Realism            |    89 |
| Caleb      | My Second Book Report                 |    75 |
| Caleb      | My First Book Report                  |    60 |
+------------+---------------------------------------+-------+
*/
-- INNER JOIN
SELECT first_name, title, grade 
FROM students 
JOIN papers 
	ON students.id = papers.student_id 
ORDER BY grade DESC;

-- YOU COULD ALSO DO RIGHT JOIN AS RIGHT JOIN CRICLE = COMMON CIRCLE

-- [Q2] PRINT THIS
/*
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Carlos     | Borges and Magical Realism            |    89 |
| Caleb      | My Second Book Report                 |    75 |
| Caleb      | My First Book Report                  |    60 |
+------------+---------------------------------------+-------+
*/

SELECT first_name, title, grade 
FROM students 
LEFT JOIN papers 
	ON students.id = papers.student_id;

-- [4] PRINT THIS
/*
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  | 60    |
| Caleb      | My Second Book Report                 | 75    |
| Samantha   | Russian Lit Through The Ages          | 94    |
| Samantha   | De Montaigne and The Art of The Essay | 98    |
| Raj        | MISSING                               | 0     |
| Carlos     | Borges and Magical Realism            | 89    |
| Lisa       | MISSING                               | 0     |
+------------+---------------------------------------+-------+
*/
SELECT first_name,
	   IFNULL(title,'MISSING'),
       IFNULL(grade,0)
FROM students
LEFT JOIN papers 
	ON students.id = papers.student_id;
    
-- [5] PRINT THIS
/*
+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   | 96.0000 |
| Carlos     | 89.0000 |
| Caleb      | 67.5000 |
| Raj        | 0       |
| Lisa       | 0       |
+------------+---------+
*/
SELECT first_name, 
		IFNULL(AVG(grade),0)as average
FROM students 
LEFT JOIN papers 
	ON students.id = papers.student_id 
GROUP BY students.id 
ORDER BY average DESC;

SELECT first_name,
	   IFNULL(AVG(grade),0) as average,
       CASE 
			WHEN AVG(grade) IS NULL OR AVG(grade) < 70 THEN 'FAILING'
            ELSE 'PASSING'
	   END AS pending_status 
FROM students 
LEFT JOIN papers 
	ON students.id = papers.student_id 
GROUP BY students.id
ORDER BY average DESC;

            
SELECT NULL > 40;
-- ANSWER IS NULL









    
    















    
    
    

















