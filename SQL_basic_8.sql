/* Problem: Create a new table profession to hold old_prof values from another table my_contacts

=======================First Way===============================
CREATE, SELECT and INSERT at (nearly) the same time				*/
	CREATE TABLE profession
	(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	new_prof VARCHAR(10)
	);
	INSERT INTO profession(new_prof)			--INSERT INTO table_name (column_names) VALUES
		SELECT old_prof FROM my_contacts
		GROUP BY old_prof
		ORDER BY old_prof;

/*=======================Second Way===============================
CREATE TABLE with SELECT, then ALTER to add primary key			*/
	CREATE TABLE profession AS
	SELECT old_prof FROM my_contacts
	GROUP BY old_prof
	ORDER BY old_prof;
	
	ALTER TABLE profession
	ADD COLUMN id INT NOT NULL AUTO_INCREMENT FIRST PRIMARY KEY;
	
/*=======================Third Way===============================
CREATE TABLE with primary key and with SELECT all in one step	*/
	CREATE TABLE profession
	(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	new_prof VARCHAR(10)
	)AS														--SQL auto-increments,so your RDBMS knows the id column should be fed automatically,
	SELECT old_prof FROM my_contacts						--and that leaves only one column, which is where the data goes.
	GROUP BY old_prof
	ORDER BY old_prof;
	
/*==========================CARTESIAN JOIN (CROSS JOIN)============================
The Cartesian join takes each value in from the first table and pairs it up with each value from the second table
The CROSS JOIN returns every row from one table crossed with every row from the second.*/
	
	CREATE TABLE toys
	(
	toy_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	toy VARCHAR(15)
	);

	CREATE TABLE boys
	(
	boy_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	boy VARCHAR(15)
	);

	INSERT INTO toys
	(toy) VALUES ('hula hoop'), ('balsa glider'),('toy soldiers'),('harmonica'),('baseball cards');

	INSERT INTO boys
	(boy) VALUES ('Davey'), ('Bobby'), ('Beaver'), ('Richie');

	SELECT toys.toy, boys.boy
	FROM toys CROSS JOIN boys;

	SELECT t.toy, b.boy           			--The name before the dot is the table, and the name after it is the name of a column
	FROM toys AS t CROSS JOIN boys as b;	--t is table Alias for toys and b is table Alias for boys
	
/*=======================================INNER JOIN====================================================	
An INNER JOIN is a CROSS JOIN with some result rows removed by a condition in the query
	
	SELECT somecolumns
	FROM table1
	 INNER JOIN
	 table2
	ON somecondition;	//The keyword WHERE will also work here.
	
	An INNER JOIN combines the records from two tables using comparison operators in a condition.
	
1. EQUIJOIN inner joins test for equality		*/
	SELECT boys.boy, toys.toy
	FROM boys INNER JOIN toys
	ON boys.toy_id = toys.toy_id;		--Tests for Equality

/*	
2. NON-EQUIJOIN inner joins test for inequality		*/
	SELECT boys.boy, toys.toy
	FROM boys INNER JOIN toys
	WHERE boys.toy_id <> toys.toy_id;	--Tests for InEquality
	ORDER BY boys.boy;
	
/*	
3. NATURAL JOIN inner joins identify matching column names.
	Natural joins only work if the column you’re joining by has the 
	same name in both tables.								*/
	
	SELECT boys.boy, toys.toy
	FROM boys NATURAL JOIN toys;		--Does not require any condition