# CRUD CHALLENGE SOLUTIONS

-- [1] create database shirts_db
CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;
SELECT database();

-- [2] create a new table shirts 
CREATE TABLE shirts
(
	shirt_id INT NOT NULL AUTO_INCREMENT,
	article VARCHAR(30),
    color VARCHAR(10),
    shirt_size CHAR,
    last_worn INT,
    PRIMARY KEY (shirt_id)
);

-- [3] insert data to table
INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
SELECT * FROM shirts;

-- [4] insert purple polo shirt , M last worn 50 days
INSERT INTO shirts(color,article,shirt_size,last_worn)
VALUES ('purple','polo-shirt','M', 50);

-- [5] SELECT all shirts But Only Print Out Article and Color
SELECT article as 'Shirt type', color AS 'Shirt color' FROM shirts;

-- [6] SELECT all medium shirts Print Out Everything But shirt_id
SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = 'M';

-- [7] Update all polo shirts Change their size to L
SET SQL_SAFE_UPDATES = 0;
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';

-- [8] Update the shirt last worn 15 days ago Change last_worn to 0
UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;

SELECT * from shirts;

-- [9] Update all white shirts Change size to 'XS' and color to 'off white'
UPDATE shirts SET shirt_size = 'X',color = 'Off White'
WHERE color = 'white';

-- [10] Delete all old shirts Last worn 200 days ago
DELETE FROM shirts WHERE last_worn = 200;
    
-- [11] Delete all tank tops 
DELETE FROM shirts where article = 'tank top';

-- [12] Delete all shirts
DELETE FROM shirts;

-- [13] Drop table
DROP TABLE shirts;

