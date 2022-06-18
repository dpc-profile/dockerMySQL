#https://www.mikedane.com/databases/sql/creating-company-database/
-- https://youtu.be/HXV3zeQKqGY?t=12113 #FreeCodeCamp Database course
-- USE company; #Se você especificar o database no from, como 'company.client', não precisa usar o USE

#LIKE
-- % = any # characters, _ = one character
-- Find any client's who are an LLC
SELECT *
FROM company.client
WHERE client_name LIKE '%LLC';

-- Find any branch suppliers who are in the label business
SELECT *
FROM company.branch_supplier
WHERE supplier_name LIKE '%Label%';

-- Find any employee born in October
SELECT *
FROM company.employee
WHERE birth_day LIKE '____-10%';

-- Find any clients who are schools
SELECT *
FROM company.client
WHERE client_name LIKE '%school%';

-- =========================================================================
#Union
-- Find a list of employee and branch names
SELECT first_name AS 'Company_Names'
FROM company.employee
UNION
SELECT branch_name
FROM company.branch;

-- Find a list of all clients & branch suppliers' names
#Não é necessario colocar o nome da tabela, no caso o "client" no select, mas ajuda na leitura da query
SELECT client.client_name, client.branch_id
FROM company.client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM company.branch_supplier;

-- =========================================================================
#JOIN
-- Find all branches and the name of their manager
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM company.employee
JOIN company.branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

-- =========================================================================
#Nested Queries
-- Find names of all employees who have sold over 30,000
SELECT employee.first_name, employee.last_name
FROM company.employee
WHERE employee.emp_id IN (SELECT works_with.emp_id
                          FROM company.works_with
                          WHERE works_with.total_sales > 30000);
#BPA Learned query
SELECT DISTINCT 
	t2.first_name as 'First_name',
	t2.last_name AS 'Last_name'	
FROM company.works_with t1
JOIN company.employee t2 ON t1.emp_id = t2.emp_id
WHERE
	t1.total_sales > 30000;
    
-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID
SELECT client.client_id, client.client_name
FROM company.client
WHERE client.branch_id = (SELECT branch.branch_id
                          FROM company.branch
                          WHERE branch.mgr_id = 102);
                          
                          
#BPA Learned query
SELECT 
	t1.client_id,
	t1.client_name
FROM company.client t1
JOIN company.branch t2 ON t1.branch_id = t2.branch_id
JOIN company.employee t3 ON t3.first_name = 'Michael' AND t3.last_name = 'Scott' 
WHERE
	 t2.mgr_id = t3.emp_id;
-- =========================================================================

