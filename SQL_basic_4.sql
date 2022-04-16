--Create and use the Database:
CREATE DATABASE gregs_list;
USE gregs_list;

--Create Table:
CREATE TABLE my_contacts
(last_name VARCHAR(10),			
first_name VARCHAR(8),			
email VARCHAR(50),
birthday DATE,					
gender CHAR(1) NOT NULL,
interests VARCHAR(20),
location VARCHAR(15) NOT NULL DEFAULT 'India',
);

--Inserting Values
INSERT INTO my_contacts VALUES('Anderson','Jillian','jill_anderson@breakneckpizza.net','1995-01-05','F','Cooking,dancing','Palo Alto, CA');
INSERT INTO my_contacts VALUES('Alanna','Ryan',' angrypirate@breakneckpizza.net','M','1994-06-05','F','Basketball','San Fran, CA');
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking, roaming','Grover\'s Mill'); --to use Apostrophy
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover''s Mill'); --Alternate way
--...

--Select All
SELECT * FROM my_contacts;

--ATOMIC DATA RULES
/*	RULE 1: A column with atomic data can't have several values of the same type of data in that column.
				Interests column violate this rule
	RULE 2: A table with atomic data can't have multiple columns with the same type of data.*/
	  
--FIRST NORMAL FORM or 1NF
/*	1. Each row of data must contain atomic values.
	2. Each row of data must have a unique identifier, known as a Primary Key.
		(A primary key is a column in your table that makes each record unique.)	*/
	
--PRIMARY KEY:
/*	Rules:
	1. A primary key can’t be NULL
	2. The primary key must be given a value when the record is inserted
	3. The primary key must be compact
	4. The primary key values can’t be changed	*/
	
--SHOW CREATE TABLE:
	--This statement will return respective commands used to create them
	
SHOW CREATE TABLE my_contacts;
SHOW COLUMNS FROM tablename;
SHOW CREATE DATABASE databasename;	
SHOW INDEX FROM tablename;

--Creating a Table with PRIMARY KEY
CREATE TABLE my_contacts
(
contact_id INT NOT NULL AUTO_INCREMENT,		--new column to hold int value that will be Primary Key
last_name VARCHAR(10),			
first_name VARCHAR(8),			
email VARCHAR(50),
birthday DATE,					
gender CHAR(1) NOT NULL,
interests VARCHAR(20),
location VARCHAR(15) NOT NULL DEFAULT 'India',
PRIMARY KEY(contact_id)				--Specifying the Primary Key
);

INSERT INTO my_contacts (contact_id, first_name, last_name) VALUES (NULL, 'Marcia', 'Brady'); 
	--AUTO_INCREMENT simply ignores the NULL and assign the value 1 as contact_id. 
	
	
--ALTERing the Existing Table:
ALTER TABLE my_contacts 
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,	--Makes the new column the first one in the table
ADD PRIMARY KEY (contact_id);	
