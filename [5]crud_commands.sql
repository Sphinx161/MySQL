-- MAKING TABLE READY !
-- TOPICS
	-- ALIAS
    -- QUERIES
    -- WHERE
    -- UPDATE
    
USE practice_db;

CREATE TABLE cats(
	cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT * FROM cats;

/*
cat_id		name		breed			age
1			Ringo		Tabby			4
2			Cindy		Maine Coon		10
3			Dumbledore	Maine Coon		11
4			Egg			Persian			4
5			Misty		Tabby			13
6			George 		Michael	Ragdoll	9
7			Jackson		Sphynx			7
*/
-- ---------------------------------------------------------
# EXERCISES
-- [1] get all cat_ids
SELECT cat_id FROM cats;

-- [2] get name and breed of all cats 
SELECT name, breed FROM cats;

-- [3] get name and age of Tabby breed cats
SELECT name, age FROM cats 
WHERE breed = 'tabby';

-- name	age
-- Ringo	4
-- Misty	13

-- [4] get cats where cat_id is same as age
SELECT cat_id, age FROM cats
WHERE cat_id = age;

-- cat_id	age
-- 4	4
-- 7	7

-- -----------------------------------------------------

SELECT age AS "cat's age" FROM cats;
/*
# cat's age
	4
	4
	7
	9
	10
	11
	13
    
    For alias name if using spaces so use quotes "cat age" or else without quotes -> year .
*/
-- ------------------------------------------------------------------------------
# UPDATE EXERCISES
SELECT * FROM cats;
SET SQL_SAFE_UPDATES = 0; -- able to update delete records without using primary key

-- [1] update jacksons name to jack
UPDATE cats SET name = 'Jack'
WHERE name = 'jackSon';

-- [2] update ringo's breed to British Shorthair
UPDATE cats SET breed = 'British ShortHair'
WHERE name = 'ringo' ; 
-- Eventhough the data is Ringo , but in where even rinGo will be accepted as its case Insensitive

-- [3] update age of Maine Coons breed to 12 
UPDATE cats SET age = 12
WHERE breed = 'maine coon';

-- ----------------------------------------------------------------------------------
#DELETE EXERCISES
SELECT * FROM cats;
-- [1] delete all cats with age 4
SELECT * FROM cats WHERE age = 4;
DELETE FROM cats WHERE age = 4;

-- [2] delete cat with same cat_id and age
SELECT * FROM cats WHERE cat_id = age;
DELETE FROM cats WHERE cat_id = age;

-- [3] delete all cat entries 
DELETE FROM cats;
-- deletes the entire cat table entries but not the table itself













