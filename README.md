# sql-practice
* [MarkDown Standard Practices](https://www.markdownguide.org/basic-syntax/)

## Some of The Most Important SQL Commands

    * SELECT - extracts data from a database
    * UPDATE - updates data in a database
    * DELETE - deletes data from a database
    * INSERT INTO - inserts new data into a database
    * CREATE DATABASE - creates a new database
    * ALTER DATABASE - modifies a database
    * CREATE TABLE - creates a new table
    * ALTER TABLE - modifies a table
    * DROP TABLE - deletes a table
    * CREATE INDEX - creates an index (search key)
    * DROP INDEX - deletes an index

## Function list:

* [DATEDIFF](https://www.w3schools.com/sql/func_sqlserver_datediff.asp)
  * eg. DATEDIFF(date1, date2) or DATEDIFF(days, date1, date2)
* [TO_DAYS](https://www.w3schools.com/sql/func_mysql_to_days.asp)
  * eg. TO_DAYS(wt1.DATE) - TO_DAYS(wt2.DATE) = 1;
* [LIMIT Clause](https://www.w3schools.com/mysql/mysql_limit.asp)
  * The LIMIT clause is used to specify the number of records to return.
  * eg. SELECT customer_number FROM Orders GROUP BY customer_number ORDER BY COUNT(customer_number) DESC LIMIT 1; 
* [MIN() and MAX()](https://www.w3schools.com/mysql/mysql_min_max.asp)
  * The MIN() function returns the smallest value of the selected column.
  * The MAX() function returns the largest value of the selected column.
  * eg. SELECT customer_number FROM Orders GROUP BY customer_number ORDER BY COUNT(customer_number) DESC LIMIT 1; 
* [COUNT(), AVG() and SUM()](https://www.w3schools.com/mysql/mysql_count_avg_sum.asp)
  * The COUNT() function returns the number of rows that matches a specified criterion.
  * The AVG() function returns the average value of a **numeric column**. 
  * The SUM() function returns the total sum of a **numeric column**. 
* [LIKE](https://www.w3schools.com/mysql/mysql_like.asp)
  * The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
  * There are two wildcards often used in conjunction with the LIKE operator:
    * The percent sign (%) represents zero, one, or multiple characters
    * The underscore sign (_) represents one, single character


            LIKE Operator 	Description
            WHERE CustomerName LIKE 'a%' 	   Finds any values that start with "a"
            WHERE CustomerName LIKE '%a' 	   Finds any values that end with "a"
            WHERE CustomerName LIKE '%or%' 	Finds any values that have "or" in any position
            WHERE CustomerName LIKE '_r%' 	Finds any values that have "r" in the second position
            WHERE CustomerName LIKE 'a_%' 	Finds any values that start with "a" and are at least 2 characters in length
            WHERE CustomerName LIKE 'a__%' 	Finds any values that start with "a" and are at least 3 characters in length
            WHERE ContactName  LIKE 'a%o' 	   Finds any values that start with "a" and ends with "o"

* [IN](https://www.w3schools.com/mysql/mysql_in.asp)
   * The IN operator allows you to specify multiple values in a WHERE clause.
   * The IN operator is a shorthand for multiple OR conditions. 
* SELECT DISTINCT - used to return only distinct (different) values
* HAVING Clause
   * The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
