-- SQL Subqueries Guide

-- Introduction to Subqueries:

-- A subquery (also known as an inner query or nested query) is a query nested inside another query. 
-- Subqueries can be used in various parts of an SQL statement, such as in the SELECT, FROM, WHERE, and HAVING clauses. 
-- Subqueries are useful for performing complex queries that need to retrieve data based on another query.

-- When to Use Subqueries:

-- 1. Filtering Results:
-- Use subqueries to filter results based on criteria retrieved from another query. 
-- For example, you can use a subquery to filter out customers who have made a specific type of purchase.

-- 2. Derived Tables:
-- Use subqueries to create temporary tables that can be used in the main query. 
-- This is useful when you need to perform calculations or filtering on a subset of data before using it in the main query.

-- 3. Comparisons:
-- Use subqueries to perform comparisons based on aggregated results. 
-- For example, you can use a subquery to compare the sales performance of different regions against each other.

-- 4. Correlated Subqueries:
-- Use correlated subqueries when the subquery depends on values from the outer query. 
-- Correlated subqueries execute once for each row in the outer query and can be used for more complex filtering or calculations.

-- Types of Subqueries:

-- 1. Single-row Subquery:
-- Returns a single row and is often used with comparison operators. 
-- This type of subquery is useful when you need to compare a single value with a result set.

-- 2. Multi-row Subquery:
-- Returns multiple rows and is often used with IN, ANY, or ALL operators. 
-- This type of subquery is useful when you need to compare a single value with multiple values from a result set.

-- 3. Correlated Subquery:
-- References columns from the outer query and executes once for each row in the outer query. 
-- This type of subquery is useful when you need to filter results based on values from the outer query.

-- 4. Nested Subquery:
-- A subquery within another subquery. 
-- Nested subqueries allow for even more complex queries and can be used to retrieve data based on multiple levels of filtering or aggregation.

-- Additional Tips and Insights on Subqueries:

-- 1. Performance Considerations:
-- Subqueries can impact query performance, especially if they are correlated and execute repeatedly for each row in the outer query. 
-- Use subqueries judiciously and consider alternative approaches such as JOINs or derived tables for better performance.

-- 2. Readability:
-- While subqueries can be powerful, they can also make queries more complex and harder to read. 
-- Use subqueries sparingly and strive for clarity and simplicity in your SQL queries.

-- 3. Testing and Validation:
-- Test queries containing subqueries with sample data to ensure they return expected results. 
-- Validate the logic of subqueries, especially correlated subqueries, with edge cases to avoid unexpected behavior.

-- 4. Use of Aliases:
-- When using subqueries, especially nested subqueries, use aliases to make your SQL code more readable and maintainable. 
-- Aliases help distinguish between different levels of subqueries and make it easier to understand the query structure.

-- 5. Documentation:
-- Comment your SQL code, especially when using subqueries, to document the purpose of each subquery and explain its role in the overall query. 
-- Clear documentation helps other developers understand and maintain the code.

-- Summary:

-- Subqueries are powerful tools in SQL for performing complex data retrieval and analysis. 
-- By understanding the types of subqueries and when to use them, you can write more efficient and effective SQL queries for various scenarios.


-- Example 1: Subquery in SELECT
-- Retrieve customers and their total payments
SELECT customerName,
  (SELECT SUM(amount) FROM payments WHERE payments.customerNumber = customers.customerNumber) AS totalPayments
-- Select the customer name and their total payments
FROM customers;
-- From the customers table

-- Example 2: Subquery in WHERE
-- Retrieve customers who have placed an order
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber IN (SELECT customerNumber FROM orders);
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the orders table

-- Example 3: Subquery in FROM
-- Retrieve the average order value for each customer
SELECT customerName, avgOrderValue
-- Select the customer name and average order value
FROM customers,
  (SELECT customerNumber, AVG(amount) AS avgOrderValue FROM payments GROUP BY customerNumber) AS avgPayments
-- From the customers table and a subquery that calculates the average order value for each customer
WHERE customers.customerNumber = avgPayments.customerNumber;
-- Where the customerNumber in the customers table matches the customerNumber in the subquery

-- Example 4: Correlated Subquery
-- Retrieve customers who have placed orders with a value greater than 10000
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE EXISTS (SELECT * FROM orders WHERE customers.customerNumber = orders.customerNumber AND orders.amount > 10000);
-- Where there exists an order with a value greater than 10000 for the customer

-- Example 5: Subquery with IN
-- Retrieve products that have been ordered
SELECT productName
-- Select the product name
FROM products
-- From the products table
WHERE productCode IN (SELECT productCode FROM orderdetails);
-- Where the productCode is in the result of the subquery selecting productCodes from the orderdetails table

-- Example 6: Subquery with NOT IN
-- Retrieve customers who have not placed any orders
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);
-- Where the customerNumber is not in the result of the subquery selecting customerNumbers from the orders table

-- Example 7: Subquery with ANY
-- Retrieve customers who have made a payment greater than any payment made by customer 103
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber IN (SELECT customerNumber FROM payments WHERE amount > ANY (SELECT amount FROM payments WHERE customerNumber = 103));
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the payments table with a payment greater than any payment made by customer 103

-- Example 8: Subquery with ALL
-- Retrieve customers who have made payments greater than all payments made by customer 103
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber IN (SELECT customerNumber FROM payments WHERE amount > ALL (SELECT amount FROM payments WHERE customerNumber = 103));
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the payments table with payments greater than all payments made by customer 103

-- Example 9: Subquery with LIKE
-- Retrieve customers whose name contains 'Auto'
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerName LIKE (SELECT customerName FROM customers WHERE customerName LIKE '%Auto%');
-- Where the customerName contains 'Auto'

-- Example 10: Subquery with BETWEEN
-- Retrieve orders placed between two dates
SELECT orderNumber
-- Select the order number
FROM orders
-- From the orders table
WHERE orderDate BETWEEN (SELECT MIN(orderDate) FROM orders) AND (SELECT MAX(orderDate) FROM orders);
-- Where the orderDate is between the minimum and maximum order dates

-- Example 11: Subquery in HAVING
-- Retrieve customers with total payments greater than 5000
SELECT customerNumber, SUM(amount) AS totalPayments
-- Select the customer number and total payments
FROM payments
-- From the payments table
GROUP BY customerNumber
-- Group by customer number
HAVING SUM(amount) > (SELECT AVG(amount) FROM payments);
-- Having total payments greater than the average payment amount

-- Example 12: Subquery in UPDATE
-- Update the credit limit of customers based on their total payments
UPDATE customers
-- Update the customers table
SET creditLimit = creditLimit + 1000
-- Set the credit limit to be increased by 1000
WHERE customerNumber IN (SELECT customerNumber FROM payments GROUP BY customerNumber HAVING SUM(amount) > 5000);
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the payments table with total payments greater than 5000

-- Example 13: Subquery in DELETE
-- Delete orders with a value less than 100
DELETE FROM orders
-- Delete from the orders table
WHERE orderNumber IN (SELECT orderNumber FROM orderdetails GROUP BY orderNumber HAVING SUM(quantityOrdered * priceEach) < 100);
-- Where the orderNumber is in the result of the subquery selecting orderNumbers from the orderdetails table with a total value less than 100

-- Example 14: Subquery with EXISTS
-- Retrieve customers who have placed orders
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE EXISTS (SELECT * FROM orders WHERE customers.customerNumber = orders.customerNumber);
-- Where there exists an order for the customer

-- Example 15: Subquery with NOT EXISTS
-- Retrieve customers who have not placed orders
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE NOT EXISTS (SELECT * FROM orders WHERE customers.customerNumber = orders.customerNumber);
-- Where there does not exist an order for the customer

-- Example 16: Subquery in SELECT with Aggregate Function
-- Retrieve customers and the number of orders they have placed
SELECT customerName,
  (SELECT COUNT(*) FROM orders WHERE customers.customerNumber = orders.customerNumber) AS numberOfOrders
-- Select the customer name and the number of orders
FROM customers;
-- From the customers table

-- Example 17: Correlated Subquery with EXISTS
-- Retrieve employees who have processed payments
SELECT firstName, lastName
-- Select the first name and last name
FROM employees
-- From the employees table
WHERE EXISTS (SELECT * FROM payments WHERE employees.employeeNumber = payments.processedByEmployeeNumber);
-- Where there exists a payment processed by the employee

-- Example 18: Subquery with IN and JOIN
-- Retrieve products that have been ordered and their order details
SELECT productName, orderNumber, quantityOrdered
-- Select the product name, order number, and quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
WHERE products.productCode IN (SELECT productCode FROM orderdetails);
-- Where the productCode is in the result of the subquery selecting productCodes from the orderdetails table

-- Example 19: Subquery in CASE Statement
-- Retrieve orders with a status based on the amount
SELECT orderNumber, 
  CASE 
    WHEN (SELECT SUM(amount) FROM payments WHERE orders.customerNumber = payments.customerNumber) > 5000 THEN 'High'
    ELSE 'Low'
  END AS orderStatus
-- Select the order number and order status
FROM orders;
-- From the orders table

-- Example 20: Nested Subquery
-- Retrieve customers with the highest total payments
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber = (SELECT customerNumber FROM payments GROUP BY customerNumber ORDER BY SUM(amount) DESC LIMIT 1);
-- Where the customerNumber is in the result of the subquery selecting the customerNumber with the highest total payments

-- Example 21: Subquery in HAVING with GROUP BY
-- Retrieve offices with more than 5 employees
SELECT officeCode, COUNT(*) AS numberOfEmployees
-- Select the office code and the number of employees
FROM employees
-- From the employees table
GROUP BY officeCode
-- Group by office code
HAVING COUNT(*) > (SELECT AVG(employeeCount) FROM (SELECT COUNT(*)
FROM employees GROUP BY officeCode) AS officeCounts);
-- Having more employees than the average number of employees per office

-- Example 22: Subquery with Aggregate Function in SELECT
-- Retrieve customers and their average order value
SELECT customerName,
  (SELECT AVG(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS avgOrderValue
-- Select the customer name and their average order value
FROM customers;
-- From the customers table

-- Example 23: Subquery with COUNT in SELECT
-- Retrieve products and the number of times they have been ordered
SELECT productName,
  (SELECT COUNT(*) FROM orderdetails WHERE products.productCode = orderdetails.productCode) AS timesOrdered
-- Select the product name and the number of times ordered
FROM products;
-- From the products table

-- Example 24: Subquery in DELETE with NOT EXISTS
-- Delete customers who have not placed any orders
DELETE FROM customers
-- Delete from the customers table
WHERE NOT EXISTS (SELECT * FROM orders WHERE customers.customerNumber = orders.customerNumber);
-- Where there does not exist an order for the customer

-- Example 25: Subquery in UPDATE with EXISTS
-- Update the credit limit of customers who have placed an order
UPDATE customers
-- Update the customers table
SET creditLimit = creditLimit + 500
-- Set the credit limit to be increased by 500
WHERE EXISTS (SELECT * FROM orders WHERE customers.customerNumber = orders.customerNumber);
-- Where there exists an order for the customer

-- Example 26: Subquery in FROM with JOIN
-- Retrieve customers and their most recent payment date
SELECT customers.customerName, recentPayments.lastPaymentDate
-- Select the customer name and their most recent payment date
FROM customers
-- From the customers table
JOIN (SELECT customerNumber, MAX(paymentDate) AS lastPaymentDate FROM payments GROUP BY customerNumber) AS recentPayments
-- Join with a subquery that selects the most recent payment date for each customer
ON customers.customerNumber = recentPayments.customerNumber;
-- Where the customerNumber matches

-- Example 27: Subquery with EXISTS and Aggregate Function
-- Retrieve employees who have processed payments totaling more than 10000
SELECT firstName, lastName
-- Select the first name and last name
FROM employees
-- From the employees table
WHERE EXISTS (SELECT * FROM payments WHERE employees.employeeNumber = payments.processedByEmployeeNumber GROUP BY employees.employeeNumber HAVING SUM(amount) > 10000);
-- Where there exists a payment processed by the employee with a total amount greater than 10000

-- Example 28: Subquery with NOT IN and JOIN
-- Retrieve products that have never been ordered
SELECT productName
-- Select the product name
FROM products
-- From the products table
WHERE productCode NOT IN (SELECT productCode FROM orderdetails);
-- Where the productCode is not in the result of the subquery selecting productCodes from the orderdetails table

-- Example 29: Subquery with COUNT and HAVING
-- Retrieve customers who have placed more than 5 orders
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE customerNumber IN (SELECT customerNumber FROM orders GROUP BY customerNumber HAVING COUNT(orderNumber) > 5);
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the orders table with more than 5 orders

-- Example 30: Subquery with SUM and JOIN
-- Retrieve customers and their total order value
SELECT customers.customerName, totalOrderValue.totalValue
-- Select the customer name and their total order value
FROM customers
-- From the customers table
JOIN (SELECT customerNumber, SUM(amount) AS totalValue FROM payments GROUP BY customerNumber) AS totalOrderValue
-- Join with a subquery that selects the total order value for each customer
ON customers.customerNumber = totalOrderValue.customerNumber;
-- Where the customerNumber matches

-- Example 31: Correlated Subquery with NOT EXISTS
-- Retrieve customers who have not made any payments
SELECT customerName
-- Select the customer name
FROM customers
-- From the customers table
WHERE NOT EXISTS (SELECT * FROM payments WHERE customers.customerNumber = payments.customerNumber);
-- Where there does not exist a payment for the customer

-- Example 32: Subquery in WHERE with LIKE
-- Retrieve orders placed by customers with names containing 'Auto'
SELECT orderNumber
-- Select the order number
FROM orders
-- From the orders table
WHERE customerNumber IN (SELECT customerNumber FROM customers WHERE customerName LIKE '%Auto%');
-- Where the customerNumber is in the result of the subquery selecting customerNumbers from the customers table with names containing 'Auto'

-- Example 33: Subquery in SELECT with CASE
-- Retrieve employees and their status based on the number of orders they have managed
SELECT firstName, lastName,
  CASE 
    WHEN (SELECT COUNT(*) FROM orders WHERE employees.employeeNumber = orders.salesRepEmployeeNumber) > 10 THEN 'Active'
    ELSE 'Inactive'
  END AS status
-- Select the first name, last name, and status
FROM employees;
-- From the employees table

-- Example 34: Subquery with AVG in SELECT
-- Retrieve products and their average order quantity
SELECT productName,
  (SELECT AVG(quantityOrdered) FROM orderdetails WHERE products.productCode = orderdetails.productCode) AS avgQuantity
-- Select the product name and average order quantity
FROM products;
-- From the products table

-- Example 35: Subquery in SELECT with SUM
-- Retrieve customers and their total order amounts
SELECT customerName,
  (SELECT SUM(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS totalPayments
-- Select the customer name and total payments
FROM customers;
-- From the customers table

-- Example 36: Subquery with GROUP BY and HAVING
-- Retrieve offices with at least 3 employees
SELECT officeCode, COUNT(*) AS numberOfEmployees
-- Select the office code and the number of employees
FROM employees
-- From the employees table
GROUP BY officeCode
-- Group by office code
HAVING COUNT(*) >= 3;
-- Having at least 3 employees

-- Example 37: Subquery with IN and JOIN
-- Retrieve products that have been ordered and their order details
SELECT productName, orderNumber, quantityOrdered
-- Select the product name, order number, and quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
WHERE products.productCode IN (SELECT productCode FROM orderdetails);
-- Where the productCode is in the result of the subquery selecting productCodes from the orderdetails table

-- Example 38: Subquery with SUM in HAVING
-- Retrieve customers with total payments greater than 5000
SELECT customerNumber, SUM(amount) AS totalPayments
-- Select the customer number and total payments
FROM payments
-- From the payments table
GROUP BY customerNumber
-- Group by customer number
HAVING SUM(amount) > 5000;
-- Having total payments greater than 5000

-- Example 39: Subquery with NOT EXISTS and DELETE
-- Delete orders that have no order details
DELETE FROM orders
-- Delete from the orders table
WHERE NOT EXISTS (SELECT * FROM orderdetails WHERE orders.orderNumber = orderdetails.orderNumber);
-- Where there does not exist an order detail for the order

-- Example 40: Subquery in SELECT with AVG
-- Retrieve customers and their average payment amount
SELECT customerName,
  (SELECT AVG(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS avgPaymentAmount
-- Select the customer name and average payment amount
FROM customers;
-- From the customers table

