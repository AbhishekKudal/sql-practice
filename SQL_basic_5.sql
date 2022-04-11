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


--ALTERing the Existing Table:
	--Adding a Primary Key
ALTER TABLE my_contacts 
ADD COLUMN contact_id INT NOT NULL AUTO_INCREMENT FIRST,	--Makes the new column the first one in the table
ADD PRIMARY KEY (contact_id);					--you can only have one AUTO_INCREMENT field per table, it has to be an INTEGER data type,
								-- And can't be NULL
	--Adding a new column something After
ALTER TABLE my_contacts
ADD COLUMN contact_number CHAR(10) AFTER email; 		-- NOTE: BEFORE and orders after FIRST won’t work with MySQL.

	--Altering existing table/columns
ALTER TABLE	porjekts RENAME TO project_list;		--To rename the table name
ALTER TABLE project_list CHANGE COLUMN prev_name new_name INT	--To change name and DataType 

/*	Note: If the data type you’re changing to isn’t compatible with the old data type,
	your command won’t be carried out, and your SQL software will tell you that you have
	an error in your statement.		*/
	
ALTER TABLE project_list MODIFY COLUMN name VARCHAR(120);	--To change the DataType only	
ALTER TABLE project_list DROP COLUMN start_date;		--To drop the unnecessary column


--STRING FUNCTIONS
	--Text values and values stored in CHAR or VARCHAR columns are known as strings.
	--IMPORTANT: string functions do NOT change the data stored in your table; they simply return the altered strings as a result of your query.
	
	--RIGHT()/LEFT()
SELECT RIGHT(location,2) FROM my_contacts;			--Select 2 characters from the right side of column location
SELECT SUBSTRING_INDEX(location, ',',1) FROM my_contacts	--SELECT everything in front of ',' (i.e. before first comma)
SELECT SUBSTRING(location,2,5) FROM my_contacts			--SUBSTRING(your_string, start_position, length)
SELECT UPPER(location) FROM my_contacts;			--UpperCase
SELECT LOWER(location) FROM my_contacts;			--LowerCase
SELECT REVERSE(location) FROM my_contacts;			--Reverses the Strings in the column
SELECT LTRIM(location) FROM my_contacts;			--Removes extra spaces present in the left part of string
SELECT RTRIM(location) FROM my_contacts;			--Removes extra spaces present in the right part of string
SELECT LENGTH(location) FROM my_contacts;			--Returns Length of String (count of characters)

UPDATE TABLE my_contacts SET state_name = RIGHT(location, 2);	-- Updates all rows one by one with respective spitted strings in location column

--We can use string functions in combination with SELECT, UPDATE and DELETE.
