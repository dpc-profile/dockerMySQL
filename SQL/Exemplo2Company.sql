#https://www.mikedane.com/databases/sql/creating-company-database/
-- https://youtu.be/HXV3zeQKqGY #FreeCodeCamp Database course
USE company;

SELECT * 
FROM company.employee
ORDER BY sex, first_name, last_name;

SELECT * 
FROM company.employee
ORDER BY salary DESC
LIMIT 3;

SELECT first_name AS forename, last_name AS surname 
FROM company.employee;

-- Find out all the different genders
SELECT DISTINCT sex
FROM company.employee;
-- =================================================================================

-- Find the number of employees
SELECT COUNT(emp_id)
FROM company.employee;

SELECT COUNT(emp_id)
FROM company.employee
WHERE sex = 'F' AND birth_day > '1970-01-01';

-- Find the average of all employee's salaries
SELECT AVG(salary)
FROM company.employee
WHERE sex = 'M';

-- Find the sum of all employee's salaries
SELECT SUM(salary)
FROM company.employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM company.employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM company.works_with
GROUP BY emp_id;

-- Find the total amount of money spent by each client
SELECT SUM(total_sales), client_id
FROM company.works_with
GROUP BY client_id;