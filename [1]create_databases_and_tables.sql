--	create a database 
CREATE DATABASE hello_world_db;

-- show all databases in the server 
SHOW DATABASES;

-- use or select a database from the server 
USE hello_world_db;
SELECT DATABASE();

-- drop or delete a database 
DROP DATABASE hello_world_db;

-- ------------------------------------------------------

/* create a table in the database */
CREATE DATABASE apple;
SHOW DATABASES;
USE apple;
SELECT database();
CREATE TABLE ipads(
	model VARCHAR(50),
    price INT,
    color VARCHAR(20) );

-- show tables of a database
SHOW TABLES;

-- used to describe columns of table not database
SHOW COLUMNS FROM ipads;
DESC ipads;  

-- delete a table in the database 
DROP TABLE ipads;  
SHOW TABLES;  -- throws error 
DESC ipads;      

-- -------------------------------------------------------
-- EXERCISE 1
CREATE DATABASE bakery_db;
USE bakery_db;
CREATE TABLE pastries(
	pastry_item VARCHAR(50),
    total_item INT );
SHOW TABLES;
SHOW COLUMNS FROM pastries;
DESC pastries;

DROP TABLE pastries;
SHOW TABLES;
-- --------------------------------------------------------
    
    
    
    
    
    
    
    
    
    