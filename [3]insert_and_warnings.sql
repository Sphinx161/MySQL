SHOW DATABASES;
USE bakery_db;
CREATE TABLE people(
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT  );
-- ---------------------------------------------------------
-- insert data into the table
INSERT INTO people ( first_name, last_name, age)
VALUES ("Shibani", "Das", 22);

-- order can be changed while inserting 
INSERT INTO people (last_name, first_name, age)
VALUES ("Purohit", "Sougat", 21);

-- colmuns not compulsory until not specified
INSERT INTO people (first_name, last_name)
VALUES ("Siba", "Palo");

-- empty insert
INSERT INTO people ()
VALUES ();



SELECT * FROM people;



-- -------------------------------------------------------------
# WARNINGS 
	-- occurs when character limit is exceeded
    -- or mismatched data type
    -- code => SHOW WARNINGS;
    
SELECT * FROM people;

-- Here I am inserting a string instead of integer value
-- Which will show a warining
INSERT INTO people (first_name, last_name, age)
VALUES ("True", "Casye", "22");

SHOW WARNINGS;

-- multiple inserts 

INSERT INTO people(first_name, last_name, age)
VALUES ("Duke", "Pan", 23),
		("Levi", "Ackerman", 25),
        ("Mikasa", "Ackerman", 23);
SELECT * FROM people;

    













