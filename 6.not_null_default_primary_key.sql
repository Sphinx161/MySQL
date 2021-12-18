# TOPICS LEARNT
	-- NULL
    -- NOT NULL
    -- DEFAULT 
    -- PRIMARY KEY 
    -- AUTO_INCREMENT
    
USE bakery_db;
SHOW TABLES;

CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id) 
);

DROP TABLE employees;
# 0R

CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
);

INSERT INTO employees(first_name, last_name, age)
VALUES ("Shibani", "Das", 22);

SELECT * FROM employees;
desc employees;

-- -----------------------------------------------------------
# are DEFAULT and NOT NULL redundant ?  NO

CREATE TABLE emp
(
	id INT,
	status VARCHAR(20) NOT NULL DEFAULT "employed"
);
    
/* 
Even if we DONT explicity define NOT NULL and DONT provide
input values SQL would set the column name to the default
values provided , But problem arises when we manually input 
NULL as the column value when we dont want NULL to exist tu. 
*/

INSERT INTO  emp (id)
VALUES (101);

SELECT * FROM emp;

# default value has been set on not providing  NOT NULL column
-- 	id	status
-- 	101	employed

# what happens when we set column value to NULL
INSERT INTO  emp (id, status)
VALUES (102, NULL);

-- Error Code: 1048. Column 'status' cannot be null	0.000 sec


	



    

