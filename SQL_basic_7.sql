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

------------------------------------Patterns of data: ONE to ONE---------------------------------

/*One-to-One: exactly one row of a parent table is related to one row of a child table
In the schema, the connecting line is plain to show that we’re linking one thing to one thing.

------------------------------------Patterns of data: ONE to MANY---------------------------------

a record in Table A can have MANY matching records in Table B, but a record in Table B can only match ONE record in Table A
The connecting line has a black arrow at the end to show that we’re linking one thing to many things.	

------------------------------------Patterns of data: MANY to MANY---------------------------------
The connecting lines have black arrows at both ends; we’re linking many things to many things.
a junction table holds a key from each table.
 many-to-many relationship is usually made up of two one-to-many relationships, with a junction table in between.	

------------------------------------COMPOSITE KEY---------------------------------
 A key made of two or more columns is known as a composite key

==================================First Normal Form, or 1NF=======================================
Rule 1: Columns contain only atomic values
Rule 2: No repeating groups of data

* When a column’s data must change when another column’s data is modified, the first column is functionally dependent on the second.

* Shorthand notations: T.x —> T.y ---- can be read like this “in the relational table called T, column y is functionally dependent on column x

* A dependent column is one containing data that could change if another column changes. Non-dependent columns stand alone.

--------------------------------------Partial functional dependency------------------------------
A partial functional dependency means that a non-key column is dependent on some, but not all, of the columns in a composite primary key

--------------------------------------Transitive functional dependency-----------------------------
If changing any of the non-key columns might cause any of the other columns to change, you have a transitive dependency.

==================================Second Normal Form, or 2NF=============================================
Rule 1: Be in 1NF
Rule 2: Have no partial functional dependencies.

====================================Third Normal Form or 3NF=============================================
Rule 1: Be in 2NF
Rule 2: Have no transitive dependencies
*/
