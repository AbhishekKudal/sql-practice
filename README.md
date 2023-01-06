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
  * eg. SELECT customer_number FROM Orders GROUP BY customer_number ORDER BY COUNT(customer_number) DESC LIMIT 1; 
