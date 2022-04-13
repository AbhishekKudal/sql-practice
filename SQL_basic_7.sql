--A representation of all the structures, such as tables and columns, in your database, along with how they connect, is known as a schema.
--The FOREIGN KEY is a column in a table that references the PRIMARY KEY of another table.
--You will only be able to insert values into your foreign key that exist in the table the key came from, the parent table. This is called referential integrity.

--Create and use the Database:
CREATE DATABASE gregs_list;
USE gregs_list;

--Create Table:
CREATE TABLE my_contacts
(
contact_id INT NOT NULL AUTO_INCREMENT,
last_name VARCHAR(10),			
first_name VARCHAR(8),			
email VARCHAR(50),
birthday DATE,					
gender CHAR(1) NOT NULL,
interests VARCHAR(20),
location VARCHAR(15) NOT NULL DEFAULT 'India',
PRIMARY KEY(contact_id)
);

--Inserting Values:
INSERT INTO my_contacts VALUES('Anderson','Jillian','jill_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Palo Alto, CA');
INSERT INTO my_contacts VALUES('Alanna','Ryan',' angrypirate@breakneckpizza.net','M','1994-06-05','F','Basketball','San Fran, CA');
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover\'s Mill'); --to use Apostrophy
INSERT INTO my_contacts VALUES('Anderson','Ryan','ryan_anderson@breakneckpizza.net','1995-01-05','F','Cooking','Grover''s Mill'); --Alternate way
--...

--Select All:
SELECT * FROM movie_table;

--------------Foreign Key without Constraint---------------
CREATE TABLE interests
(
interest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,		--Another quicker way to declare Primary Key
interest VARCHAR(20),
contact_id INT NOT NULL,				--Creating a column for foreign key
CONSTRAINT my_contacts_contact_id 		--Creating a constraint in a way that tells us which table the key comes from (my_contacts), what we’ve named the key (contact_id), and that it’s a foreign key (fk).
FOREIGN KEY (contact_id) REFERENCES my_contacts(contact_id)
)

--------------Foreign Key with Constraint---------------
CREATE TABLE interests
(
interest_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,		--Another quicker way to declare Primary Key
interest VARCHAR(20),
contact_id INT NOT NULL,				--Creating a column for foreign key
CONSTRAINT my_contacts_contact_id 		--Creating a constraint in a way that tells us which table the key comes from (my_contacts), what we’ve named the key (contact_id), and that it’s a foreign key (fk).
FOREIGN KEY (contact_id) REFERENCES my_contacts(contact_id)
--(Reference Part) specifies where the foreign key came from (my_contacts)and what it’s called in the other table (contact_id)
)

------------------------------------Patterns of data: one to one---------------------------------