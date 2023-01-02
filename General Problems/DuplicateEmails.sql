/*
182. Duplicate Emails

https://leetcode.com/problems/duplicate-emails/description/
*/

# Approach1:
SELECT email from Person group by email having count(email) > 1;

# Similar Approach:
select email as Email from Person group by email having count(*)>1;
