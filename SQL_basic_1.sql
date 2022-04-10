--Create and use the Database:
CREATE DATABASE gregs_list;
USE gregs_list;

--Create Table:
CREATE TABLE my_contacts
(last_name VARCHAR(10),			--DataType VARCHAR used to hold info
first_name VARCHAR(8),			--that's stored as text (upto 255 characters) & is of flexible length
email VARCHAR(50),
birthday DATE,				--to store Date
gender CHAR(1),				--to store Character of fixed length
profession VARCHAR(10),
status VARCHAR(10) NOT NULL,		-- Making sure that the value is always given
interests VARCHAR(20),
location VARCHAR(15) NOT NULL DEFAULT 'India',	-- not Null with deafult value if not overriden
seeking VARCHAR(100)
);

CREATE TABLE random(
price DEC(6,2),
zip_code VARCHAR(10),
atomic_weight DEC(10,6),	--DEC(Total Digits, Decimals)
comments BLOB,
quantity INT,
book_title VARCHAR(20),
phone_number CHAR(10),
anniversary DATE,
meeting_time DATETIME 
);

--Describe a Table: (Structure of the Table without actual values)
DESC my_contacts;
DESC random;

--Delete/Drop a Table:
DROP TABLE my_contacts;

/*Inserting Data into Table:
Syntax*/
INSERT INTO table_name(column_name1, column_name2,...) VALUES('Value1', 'Value2',...);
-- IMP: Values should be in same order as the column names

	--First Way
INSERT INTO my_contacts
(last_name, first_name, email, birthday, gender, profession, location, status, interests, seeking)
VALUES 
('Kudal', 'Abhishek', 'abhikudal@gmail.com', '1998-06-10','Software Developer', 'India', 'Cricket, Travelling', 'Opportunities');
	
	--Second Way(Omitting column names)
INSERT INTO my_contacts
VALUES
('Kudal', 'Abhishek', 'abhikudal@gmail.com', '1998-06-10','Software Developer', 'India', 'Cricket, Travelling', 'Opportunities');

	--Third Way
INSERT INTO my_contacts
(last_name, first_name, email)
VALUES('Kudal', 'Abhishek', 'abhikudal@gmail.com');

-- Peek at the Table using SELECT
SELECT * FROM my_contacts;
