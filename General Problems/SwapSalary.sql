# 627. Swap Salary

# https://leetcode.com/problems/swap-salary/

# Using XOR:
 UPDATE Salary SET sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));

# Using CASE:

 UPDATE Salary SET sex = (CASE 
                             WHEN sex = 'm' THEN 'f'
                             ELSE 'm'
                          END);
