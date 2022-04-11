--Create and use the Database:
CREATE DATABASE gregs_list;
USE gregs_list;

--Create Table:
CREATE TABLE movie_table
(
movie_id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(20),
rating CHAR(2),
drama CHAR(1),
comedy CHAR(1),
action CHAR(1),
for_kids CHAR(1),
purchase_date DATE,
category VARCHAR(10),
PRIMARY KEY(movie_id)
);

--Inserting Values:
INSERT INTO movie_table VALUES(1,'Monsters, Inc','G', 'T','F','T','F','2005-02-10','');
INSERT INTO movie_table VALUES(2,'The Godfather','R', 'F','F','T','F','2009-02-10','');
INSERT INTO movie_table VALUES(3,'Gone with the Wind','G', 'T','T','T','F','2008-02-10','');
INSERT INTO movie_table VALUES(4,'American Pie','G', 'T','F','T','T','2007-02-10','');
INSERT INTO movie_table VALUES(5,'Casablanca','PG', 'F','F','T','F','2006-02-10','');

--Select All:
SELECT * FROM movie_table;

--Adding values using UPDATE:
UPDATE movie_table SET category = 'drama' where drama = 'T';
UPDATE movie_table SET category = 'comedy' where comedy = 'T';
UPDATE movie_table SET category = 'action' where action = 'T';
UPDATE movie_table SET category = 'family' where for_kids = 'T';

----OR we can use CASE to combine above all UPDATE queries:
UPDATE movie_table 
SET category =
CASE
	WHEN drama = 'T' THEN 'drama'
	WHEN comedy = 'T' THEN 'comedy'
	WHEN action = 'T' THEN 'action'
	WHEN for_kids = 'T' AND rating = 'G' THEN 'family'
	ELSE 'misc'
END;
--can also use WHERE clause right after END part

/*The CASE expression combines all the UPDATE statements by checking an existing column’s value 
against a condition. If it meets the condition, the new column is filled with a specified value.
It even allows you to tell your RDBMS what to do if any records don’t meet the condition	*/

----ORDER BY
SELECT title, category FROM movie_table WHERE title LIKE 'A%' AND category = 'family' ORDER BY title;
SELECT title, category FROM movie_table WHERE category = 'Family' ORDER BY title;

/*Rules for ORDER
	1. Null 
	2. Space
	3. Non-alphabet characters 
	4. Numbers 
	5. UpperCase Characters
	6. LowerCase Characters		
	By default, SQL returns your ORDER BY columns in ASCENDING order. 
	This means that you always get A to Z and 1 to 99,999
*/
	
-- ORDER BY using multiple columns
SELECT title, category FROM movie_table ORDER BY category, purchase_date;

	--To reverse the order
SELECT title, category FROM movie_table ORDER BY purchase_date DESC, title ASC; 
	--We can put ASC there, but it’s not necessary as ascending is default.


-------------COOKIE TABLE------------
CREATE TABLE cookie_sales
(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(15),
sales DEC(4,2),
sale_date DATE,
PRIMARY KEY(id)
);	

INSERT INTO cookie_sales
VALUES
('Lindsay', 32.02, '2007-06-03'),
('Paris', 26.53, '2007-06-03'),
('Britney', 12.02, '2007-07-11'),
('Lindsay', 54.52, '2007-06-03'),
('Paris', 12.28, '2007-07-11'),
('Britney', 71.03, '2007-06-03'),
('Lindsay', 45.89, '2007-08-25'),
('Paris', 32, '2007-06-03'),
('Britney', 3.25, '2007-08-25');

--ARITHMETIC OPERATIONS

--SELECT SUM
SELECT SUM(sales) FROM cookie_sales WHERE first_name = 'Paris';				--To get SUM for an individual
SELECT SUM(sales) FROM cookie_sales GROUP BY first_name;				-- To get SUM for all
SELECT SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales) DEC;	--To get SUM for All with descending order

--SELECT AVG (Average)
SELECT AVG(sales) FROM cookie_sales WHERE first_name = 'Britney';
SELECT first_name, AVG(sales) FROM cookie_sales GROUP BY first_name;

--SELECT MAX
SELECT MAX(sales) FROM cookie_sales WHERE first_name = 'Britney';
SELECT first_name, MAX(sales) FROM cookie_sales GROUP BY first_name;

--SELECT MIN
SELECT first_name, MIN(sales) FROM cookie_sales GROUP BY first_name;

--COUNT (will return the number of rows in a column.)
SELECT COUNT(sale_date) FROM cookie_sales;

--DISTINCT
SELECT DISTINCT sale_date FROM cookie_sales;
SELECT COUNT(DISTINCT sale_date) FROM cookie_sales;
SELECT COUNT(DISTINCT sale_date) FROM cookie_sales GROUP BY first_name;

--LIMIT
SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC
LIMIT 2;		--This is saying that you want to LIMIT your results to the first two.

--LIMIT to just particular place
/*	LIMIT even allows us to pinpoint the second place 
winner without having to see the first place winner. 
For this, we can use LIMIT with two parameters: */

SELECT first_name, SUM(sales) FROM cookie_sales GROUP BY first_name ORDER BY SUM(sales)DESC
LIMIT(1,1);		--LIMIT SYNTAX here - LIMIT(start_from, total_results) SQL starts counting with 0. 
