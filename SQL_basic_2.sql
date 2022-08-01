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
location VARCHAR(15) NOT NULL DEFAULT 'Pune',
);

--Inserting Values
INSERT INTO my_contacts VALUES('Anderson','Jillian','jill_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Palo Alto, CA');
INSERT INTO my_contacts VALUES('Alanna','Ryan',' angrypirate@breakneckpizza.net','M','1994-06-05','F','Basketball','San Fran, CA');
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover\'s Mill'); --to use Apostrophy
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover''s Mill'); --Alternate way
--...

--Select All WHERE...
SELECT * FROM my_contacts WHERE first_name = 'Anne';

--SELECT few WHERE...(SELECT specific columns to limit results)
SELECT last_name, first_name, email FROM my_contacts WHERE first_name = 'Anne';

--SELECT few WHERE cond1 AND cond2
SELECT last_name, first_name FROM my_contacts WHERE gender = 'F' AND location = 'San Fran, CA';
SELECT last_name, first_name FROM my_contacts WHERE gender = 'F' AND location <> 'San Fran, CA'; -- <> mean Not Equal

	--Below query returns first_name whose first letter is L or later, but whose first letters come earlier in the alphabet than M.
SELECT first_name  FROM my_contacts WHERE first_name>= 'L' AND first_name<= 'M'; 

--Condition check for Null
SELECT first_name FROM my_contacts WHERE location is NULL;  -- is Null is the only way to directly check for Null

--KeyWord LIKE
/* % stands for any number of characters/numbers/anything
 _ (underscore)stands for only one unknown character/number..*/
SELECT * FROM my_contacts WHERE location LIKE '%CA';	-- to get values where location ends with CA
SELECT first_name FROM my_contacts WHERE first_name LIKE '%im';
SELECT first_name FROM my_contacts WHERE first_name LIKE '_im';


--BETWEEN
	--for Between ORDER MATTERS. 30 and 60 is not same as 60 and 30 from first example
SELECT drink_name FROM drink_info WHERE calories BETWEEN 30 AND 60; 		--is same as below	
SELECT drink_name FROM drink_info WHERE calories >= 30 AND calories <= 60;	--BETWEEN is equivalent to using the <= and >= symbols, but not the < and > symbols.
SELECT drink_name FROM drink_info WHERE drink_name BETWEEN 'G' AND 'P';


--Multiple ORs using 'IN'
SELECT date_name FROM black_book WHERE rating = 'innovative' OR rating = 'fabulous' OR ...;
SELECT date_name FROM black_book WHERE rating IN ('innovative', 'fabulous','delightfull'...);
	--NOT IN
SELECT date_name FROM black_book WHERE rating NOT IN ('innovative', 'fabulous','delightfull'...);
	--Not can be used as: 
SELECT drink_name FROM drink_info WHERE NOT calories BETWEEN 3 AND 5; --NOT goes right after WHERE
SELECT date_name FROM black_book WHERE NOT date_name LIKE 'A%' AND NOT date_name LIKE 'B%'; -- Also it goes right after AND
