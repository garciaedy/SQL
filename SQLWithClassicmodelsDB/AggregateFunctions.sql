-- SQL Aggregate Functions Guide

-- Aggregate functions in SQL are like magical tools that help us crunch numbers and summarize data in really useful ways.
-- They're super handy for doing things like adding up numbers, finding averages, counting things, and more!

-- Imagine you have a big list of numbers or some data spread across a bunch of rows in a table. You want to know something about that data as a whole, not just each individual piece. That's where aggregate functions come in!

-- Here's a quick rundown of some common aggregate functions and what they do:

-- Example 1: Count the number of customers
SELECT COUNT(*) AS customerCount FROM customers;

-- Example 2: Find the average credit limit of customers
SELECT AVG(creditLimit) AS averageCreditLimit FROM customers;

-- Example 3: Calculate the total amount of payments
SELECT SUM(amount) AS totalPayments FROM payments;

-- Example 4: Find the minimum buy price of products
SELECT MIN(buyPrice) AS minBuyPrice FROM products;

-- Example 5: Find the maximum quantity ordered
SELECT MAX(quantityOrdered) AS maxQuantityOrdered FROM orderdetails;

-- Example 6: Count the number of employees in each office
SELECT officeCode, COUNT(*) AS employeeCount FROM employees GROUP BY officeCode;

-- Example 7: Calculate the average payment amount for each customer
SELECT customerNumber, AVG(amount) AS averagePayment FROM payments GROUP BY customerNumber;

-- Example 8: Find the total number of orders for each customer
SELECT customerNumber, COUNT(*) AS totalOrders FROM orders GROUP BY customerNumber;

-- Example 9: Calculate the total sales amount for each product
SELECT productCode, SUM(quantityOrdered * priceEach) AS totalSales FROM orderdetails GROUP BY productCode;

-- Example 10: Find the maximum, minimum, and average quantity in stock for each product line
SELECT productLine, MAX(quantityInStock) AS maxStock, MIN(quantityInStock) AS minStock, AVG(quantityInStock) AS avgStock
FROM products
GROUP BY productLine;

-- Now, let's dive into some common SQL Aggregate Functions:

-- 11. SUM(): This function adds up all the values in a column.
-- Example: How much money did we make from all our sales?
SELECT SUM(sales_amount) AS total_sales
FROM sales;

-- 12. AVG(): This one calculates the average (mean) of all the values in a column.
-- Example: What's the average salary of our employees?
SELECT AVG(salary) AS average_salary
FROM employees;

-- 13. COUNT(): Want to know how many rows are in a table or how many times something appears in a column? COUNT() is your friend.
-- Example: How many customers do we have?
SELECT COUNT(*) AS total_customers
FROM customers;

-- 14. MAX(): This function finds the highest value in a column.
-- Example: When was our latest order placed?
SELECT MAX(order_date) AS latest_order_date
FROM orders;

-- 15. MIN(): On the flip side, MIN() finds the lowest value in a column.
-- Example: When was our earliest order placed?
SELECT MIN(order_date) AS earliest_order_date
FROM orders;

-- But wait, there's more! You can also use aggregate functions with GROUP BY to break down your data into groups and get aggregates for each group. This is really handy for analyzing data by categories.

-- Example: How much did we sell in each product category?
SELECT category_id, SUM(sales_amount) AS total_sales
FROM products
GROUP BY category_id;

-- You can even filter these groups using the HAVING clause. It's like adding an extra condition just for groups.

-- Example: What departments have an average salary over 50,000?
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- Lastly, if you only want to count unique values, you can use COUNT() with DISTINCT.

-- Example: How many different cities do our customers come from?
SELECT COUNT(DISTINCT city) AS unique_cities
FROM customers;

-- These aggregate functions are powerful tools for summarizing and analyzing your data in SQL. With them, you can turn raw data into valuable insights!
