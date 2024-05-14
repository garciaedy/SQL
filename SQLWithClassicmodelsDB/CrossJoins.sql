-- SQL Cross Join Guide

-- Introduction to Cross Joins:
-- Cross Join (also known as Cartesian Join) is a type of join in SQL that returns the Cartesian product of the two tables involved in the join. This means that it combines each row from the first table with each row from the second table, resulting in a result set that contains all possible combinations of rows from the two tables.

-- When to Use Cross Joins:

-- 1. Generate Combinations: Use a cross join when you need to generate all possible combinations of rows from two tables.
-- 2. Combinatorial Analysis: Useful for combinatorial analysis where you need to examine every possible pairing of rows from two datasets.
-- 3. Testing and Validation: Useful for generating comprehensive test data to validate logic or calculations.

-- Additional Information:

-- 1. Cartesian Product: Cross joins produce a Cartesian product, which is the result of combining each row from the first table with every row from the second table.
-- 2. Considered Expensive: Cross joins can be computationally expensive and can result in a large result set, especially if the tables involved have a large number of rows.
-- 3. Use with Caution: Due to their potential to generate large result sets, cross joins should be used with caution and only when necessary.

-- Syntax:
-- SELECT columns
-- FROM table1
-- CROSS JOIN table2;

-- Example:
-- Suppose we have two tables: customers and orders.
-- We want to generate all possible combinations of customers and orders.

-- SQL Query:
SELECT customers.customerName, orders.orderNumber
FROM customers
CROSS JOIN orders;

-- Description:
-- In this example, we perform a cross join between the customers table and the orders table.
-- The CROSS JOIN keyword combines each row from the customers table with each row from the orders table, resulting in a result set that contains all possible combinations of customers and orders.
-- Since there is no explicit join condition specified, every row from the customers table is combined with every row from the orders table, resulting in a Cartesian product.

-- Conclusion:
-- Cross joins are useful for generating all possible combinations of rows from two tables, making them valuable for combinatorial analysis, generating test data, and certain types of queries. However, they should be used judiciously due to their potential to produce large result sets.

-- Example 1: Generate all possible combinations of customers and orders
SELECT customers.customerName, orders.orderNumber
-- Select customer name and order number
FROM customers
CROSS JOIN orders;
-- Cross join customers with orders, creating all possible combinations
-- This query retrieves all possible combinations of customers and orders, regardless of whether there is a relationship between them.

-- Example 2: Generate all possible combinations of employees and offices
SELECT employees.firstName, employees.lastName, offices.city, offices.country
-- Select employee first name, last name, office city, and country
FROM employees
CROSS JOIN offices;
-- Cross join employees with offices, creating all possible combinations
-- This query retrieves all possible combinations of employees and offices, creating a Cartesian product of the two tables.

-- Example 3: Generate all possible combinations of products and order details
SELECT products.productName, orderdetails.orderNumber
-- Select product name and order number
FROM products
CROSS JOIN orderdetails;
-- Cross join products with order details, creating all possible combinations
-- This query retrieves all possible combinations of products and order details, regardless of whether the product appears in the order details.

-- Example 4: Generate all possible combinations of customers and payments
SELECT customers.customerName, payments.amount, payments.paymentDate
-- Select customer name, payment amount, and payment date
FROM customers
CROSS JOIN payments;
-- Cross join customers with payments, creating all possible combinations
-- This query retrieves all possible combinations of customers and payments, regardless of whether the customer made the payment.

-- Example 5: Generate all possible combinations of orders and products
SELECT orders.orderNumber, products.productName
-- Select order number and product name
FROM orders
CROSS JOIN products;
-- Cross join orders with products, creating all possible combinations
-- This query retrieves all possible combinations of orders and products, regardless of whether the product is part of the order.

-- Example 6: Generate all possible combinations of employees and their job titles
SELECT employees.firstName, employees.lastName, employees.jobTitle
-- Select employee first name, last name, and job title
FROM employees
CROSS JOIN jobtitles;
-- Cross join employees with job titles, creating all possible combinations
-- This query retrieves all possible combinations of employees and job titles, regardless of whether the employee has that job title.

-- Example 7: Generate all possible combinations of product lines and products
SELECT productlines.productLine, products.productName
-- Select product line and product name
FROM productlines
CROSS JOIN products;
-- Cross join product lines with products, creating all possible combinations
-- This query retrieves all possible combinations of product lines and products, regardless of whether the product belongs to the product line.

-- Example 8: Generate all possible combinations of orders and their shipping details
SELECT orders.orderNumber, shippingdetails.shippedDate
-- Select order number and shipped date
FROM orders
CROSS JOIN shippingdetails;
-- Cross join orders with shipping details, creating all possible combinations
-- This query retrieves all possible combinations of orders and shipping details, regardless of whether the order has shipping details.

-- Example 9: Generate all possible combinations of customers and the employees who manage them
SELECT customers.customerName, employees.firstName, employees.lastName
-- Select customer name, employee first name, and last name
FROM customers
CROSS JOIN employees;
-- Cross join customers with employees, creating all possible combinations
-- This query retrieves all possible combinations of customers and employees, regardless of whether the employee manages the customer.

-- Example 10: Generate all possible combinations of customers and the orders they placed
SELECT customers.customerName, orders.orderNumber
-- Select customer name and order number
FROM customers
CROSS JOIN orders;
-- Cross join customers with orders, creating all possible combinations
-- This query retrieves all possible combinations of customers and orders, regardless of whether the customer placed the order.

-- Example 11: Generate all possible combinations of job titles and employees
SELECT jobtitles.title, employees.firstName, employees.lastName
-- Select job title, employee first name, and last name
FROM jobtitles
CROSS JOIN employees;
-- Cross join job titles with employees, creating all possible combinations
-- This query retrieves all possible combinations of job titles and employees, regardless of whether the employee holds that job title.

-- Example 12: Generate all possible combinations of products and their orders
SELECT products.productName, orders.orderNumber
-- Select product name and order number
FROM products
CROSS JOIN orders;
-- Cross join products with orders, creating all possible combinations
-- This query retrieves all possible combinations of products and orders, regardless of whether the product is part of the order.

-- Example 13: Generate all possible combinations of contact information and customers
SELECT contactdetails.contactPhone, contactdetails.contactEmail, customers.customerName
-- Select contact phone, contact email, and customer name
FROM contactdetails
CROSS JOIN customers;
-- Cross join contact details with customers, creating all possible combinations
-- This query retrieves all possible combinations of contact details and customers, regardless of whether the contact detail belongs to the customer.

-- Example 14: Generate all possible combinations of departments and employees
SELECT departments.departmentName, employees.firstName, employees.lastName
-- Select department name, employee first name, and last name
FROM departments
CROSS JOIN employees;
-- Cross join departments with employees, creating all possible combinations
-- This query retrieves all possible combinations of departments and employees, regardless of whether the employee works in the department.

-- Example 15: Generate all possible combinations of customers and their orders with total amounts
SELECT customers.customerName, orders.orderNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalAmount
-- Select customer name, order number, and calculate total amount for each order
FROM customers
CROSS JOIN orders
-- Cross join customers with orders, creating all possible combinations
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
-- Left join orders with order details where order numbers match
GROUP BY customers.customerName, orders.orderNumber;
-- Group results by customer name and order number to calculate total amount for each order
-- This query retrieves all possible combinations of customers and orders, showing the total amount for each order. If a customer has no orders, the total amount will be NULL.

-- Example 16: Generate all possible combinations of employees and the payments they have processed
SELECT employees.firstName, employees.lastName, payments.amount
-- Select employee first name, last name, and payment amount
FROM employees
CROSS JOIN payments;
-- Cross join employees with payments, creating all possible combinations
-- This query retrieves all possible combinations of employees and payments, regardless of whether the employee processed the payment.

-- Example 17: Generate all possible combinations of customers and the number of orders they have placed
SELECT customers.customerName, COUNT(orders.orderNumber) AS orderCount
-- Select customer name and count the number of orders placed
FROM customers
CROSS JOIN orders
-- Cross join customers with orders, creating all possible combinations
GROUP BY customers.customerName;
-- Group results by customer name to count the number of orders for each customer
-- This query retrieves all possible combinations of customers and orders, showing the number of orders for each customer. If a customer has placed no orders, the order count will be zero.

-- Example 18: Generate all possible combinations of products and the total quantity ordered for each product
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select product name and calculate total quantity ordered for each product
FROM products
CROSS JOIN orderdetails
-- Cross join products with order details, creating all possible combinations
GROUP BY products.productName;
-- Group results by product name to calculate total quantity ordered for each product
-- This query retrieves all possible combinations of products and order details, showing the total quantity ordered for each product. If a product has no orders, the total quantity will be zero.

-- Example 19: Generate all possible combinations of employees and the number of customers they manage
SELECT employees.firstName, employees.lastName, COUNT(customers.customerNumber) AS customerCount
-- Select employee first name, last name, and count the number of customers managed
FROM employees
CROSS JOIN customers
-- Cross join employees with customers, creating all possible combinations
GROUP BY employees.firstName, employees.lastName;
-- Group results by employee first name and last name to count the number of customers managed by each employee
-- This query retrieves all possible combinations of employees and customers, showing the number of customers managed by each employee. If an employee manages no customers, the customer count will be zero.

-- Example 20: Generate all possible combinations of orders and the average quantity ordered for each order
SELECT orders.orderNumber, AVG(orderdetails.quantityOrdered) AS avgQuantity
-- Select order number and calculate average quantity ordered for each order
FROM orders
CROSS JOIN orderdetails
-- Cross join orders with order details, creating all possible combinations
GROUP BY orders.orderNumber;
-- Group results by order number to calculate average quantity ordered for each order
-- This query retrieves all possible combinations of orders and order details, showing the average quantity ordered for each order. If an order has no products, the average quantity will be NULL.
