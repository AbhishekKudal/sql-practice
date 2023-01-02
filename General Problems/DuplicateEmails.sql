/*
182. Duplicate Emails

https://leetcode.com/problems/duplicate-emails/description/
*/

# Approach1:
SELECT email from Person group by email having count(email) > 1;

# Similar Approach:
select email as Email from Person group by email having count(*)>1;

# Approach 2:
SELECT DISTINCT(p1.email) from Person p1 INNER JOIN Person p2 ON p1.email = p2.email AND p1.id <> p2.id;
