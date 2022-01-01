CREATE DATABASE testing_db;
USE testing_db;

CREATE TABLE dogs (
	breed CHAR(5),
    name VARCHAR(10)
    );
    
INSERT INTO dogs (breed, name)
VALUES ( "kitty", "princess"),
("retriever", "somecutedogitis"); 
-- GENERATES ERROR Error Code: 1406. Data too long for column 'breed' at row 2

INSERT INTO dogs (breed, name)
VALUES ( "kitty", "princess");

SELECT * FROM dogs;

-- ------------------------------------------------------------------------------
CREATE TABLE vc (
	v VARCHAR(4),
    c CHAR(4)
);

INSERT INTO vc 
VALUES("ab  ", "ab  ");

SELECT CONCAT("(", v, ")","     ", "(", c, ")")
FROM vc;
/*
----------------------------------------------
CONCAT("(", v, ")","     ", "(", c, ")")
----------------------------------------------
(ab  )     (ab)
-----------------------------------------------
VARCHAR v displayes the trailing spaces and CHAR c didnt display the
trailing spaces even though the values inserted contained spaces .

*/


-- ------------------------------------------------------------
# FLOAT DOUBLE 

-- ------------------------------------------------------------
# DATE, TIME, DATETIME
SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();










