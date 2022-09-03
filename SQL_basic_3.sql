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
INSERT INTO my_contacts VALUES('Anderson','Jillian','jill_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Palo Alto, CA');
INSERT INTO my_contacts VALUES('Alanna','Ryan',' angrypirate@breakneckpizza.net','M','1994-06-05','F','Basketball','San Fran, CA');
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover\'s Mill'); --to use Apostrophy
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover''s Mill'); --Alternate way
--...

--Select All
SELECT * FROM my_contacts;

--DELETE 
	--Here you can only delete entire row/rows & cannot delete a specific coloumn value or tableful of columns
DELETE FROM my_contacts WHERE first_name = 'Ryan';	--All rows where first_name is Ryan will get deleted
DELETE FROM my_contacts;				--It will delete EVERY ROW from the entire Table

--UPDATE

--Here you can update single column or tableful of columns
UPDATE my_contacts SET interests = 'dancing' WHERE first_name = 'Jillian';				--to update single value
UPDATE my_contacts SET DATE = '1998-02-08', location = 'SAN FRAN, CA' WHERE first_name = 'Jillian';	--to update multiple values

--We can perform basic math operations as well
UPDATE drinks_info SET cost = cost +1 WHERE  drink_name = 'Blue Moon' OR drink_name = 'Lime Fizz';	
