-- Problem 1: Generate all possible combinations of customers and orders
SELECT customers.customerName, orders.orderNumber
-- Select customer name and order number
FROM customers
CROSS JOIN orders;
-- Cross join customers with orders, creating all possible combinations
-- This query retrieves all possible combinations of customers and orders, regardless of whether there is a relationship between them.

-- Problem 2: Generate all possible combinations of employees and offices
SELECT employees.firstName, employees.lastName, offices.city, offices.country
-- Select employee first name, last name, office city, and country
FROM employees
CROSS JOIN offices;
-- Cross join employees with offices, creating all possible combinations
-- This query retrieves all possible combinations of employees and offices, creating a Cartesian product of the two tables.

-- Problem 3: Generate all possible combinations of products and order details
SELECT products.productName, orderdetails.orderNumber
-- Select product name and order number
FROM products
CROSS JOIN orderdetails;
-- Cross join products with order details, creating all possible combinations
-- This query retrieves all possible combinations of products and order details, regardless of whether the product appears in the order details.

-- Problem 4: Generate all possible combinations of customers and payments
SELECT customers.customerName, payments.amount, payments.paymentDate
-- Select customer name, payment amount, and payment date
FROM customers
CROSS JOIN payments;
-- Cross join customers with payments, creating all possible combinations
-- This query retrieves all possible combinations of customers and payments, regardless of whether the customer made the payment.

-- Problem 5: Generate all possible combinations of orders and products
SELECT orders.orderNumber, products.productName
-- Select order number and product name
FROM orders
CROSS JOIN products;
-- Cross join orders with products, creating all possible combinations
-- This query retrieves all possible combinations of orders and products, regardless of whether the product is part of the order.

-- Problem 6: Generate all possible combinations of employees and their job titles
SELECT employees.firstName, employees.lastName, employees.jobTitle
-- Select employee first name, last name, and job title
FROM employees
CROSS JOIN jobtitles;
-- Cross join employees with job titles, creating all possible combinations
-- This query retrieves all possible combinations of employees and job titles, regardless of whether the employee has that job title.

-- Problem 7: Generate all possible combinations of product lines and products
SELECT productlines.productLine, products.productName
-- Select product line and product name
FROM productlines
CROSS JOIN products;
-- Cross join product lines with products, creating all possible combinations
-- This query retrieves all possible combinations of product lines and products, regardless of whether the product belongs to the product line.

-- Problem 8: Generate all possible combinations of orders and their shipping details
SELECT orders.orderNumber, shippingdetails.shippedDate
-- Select order number and shipped date
FROM orders
CROSS JOIN shippingdetails;
-- Cross join orders with shipping details, creating all possible combinations
-- This query retrieves all possible combinations of orders and shipping details, regardless of whether the order has shipping details.

-- Problem 9: Generate all possible combinations of customers and the employees who manage them
SELECT customers.customerName, employees.firstName, employees.lastName
-- Select customer name, employee first name, and last name
FROM customers
CROSS JOIN employees;
-- Cross join customers with employees, creating all possible combinations
-- This query retrieves all possible combinations of customers and employees, regardless of whether the employee manages the customer.

-- Problem 10: Generate all possible combinations of customers and the orders they placed
SELECT customers.customerName, orders.orderNumber
-- Select customer name and order number
FROM customers
CROSS JOIN orders;
-- Cross join customers with orders, creating all possible combinations
-- This query retrieves all possible combinations of customers and orders, regardless of whether the customer placed the order.

-- Problem 11: Generate all possible combinations of job titles and employees
SELECT jobtitles.title, employees.firstName, employees.lastName
-- Select job title, employee first name, and last name
FROM jobtitles
CROSS JOIN employees;
-- Cross join job titles with employees, creating all possible combinations
-- This query retrieves all possible combinations of job titles and employees, regardless of whether the employee holds that job title.

-- Problem 12: Generate all possible combinations of products and their orders
SELECT products.productName, orders.orderNumber
-- Select product name and order number
FROM products
CROSS JOIN orders;
-- Cross join products with orders, creating all possible combinations
-- This query retrieves all possible combinations of products and orders, regardless of whether the product is part of the order.

-- Problem 13: Generate all possible combinations of contact information and customers
SELECT contactdetails.contactPhone, contactdetails.contactEmail, customers.customerName
-- Select contact phone, contact email, and customer name
FROM contactdetails
CROSS JOIN customers;
-- Cross join contact details with customers, creating all possible combinations
-- This query retrieves all possible combinations of contact details and customers, regardless of whether the contact detail belongs to the customer.

-- Problem 14: Generate all possible combinations of departments and employees
SELECT departments.departmentName, employees.firstName, employees.lastName
-- Select department name, employee first name, and last name
FROM departments
CROSS JOIN employees;
-- Cross join departments with employees, creating all possible combinations
-- This query retrieves all possible combinations of departments and employees, regardless of whether the employee works in the department.

-- Problem 15: Generate all possible combinations of customers and their orders with total amounts
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

-- Problem 16: Generate all possible combinations of employees and the payments they have processed
SELECT employees.firstName, employees.lastName, payments.amount
-- Select employee first name, last name, and payment amount
FROM employees
CROSS JOIN payments;
-- Cross join employees with payments, creating all possible combinations
-- This query retrieves all possible combinations of employees and payments, regardless of whether the employee processed the payment.

-- Problem 17: Generate all possible combinations of customers and the number of orders they have placed
SELECT customers.customerName, COUNT(orders.orderNumber) AS orderCount
-- Select customer name and count the number of orders placed
FROM customers
CROSS JOIN orders
-- Cross join customers with orders, creating all possible combinations
GROUP BY customers.customerName;
-- Group results by customer name to count the number of orders for each customer
-- This query retrieves all possible combinations of customers and orders, showing the number of orders for each customer. If a customer has placed no orders, the order count will be zero.

-- Problem 18: Generate all possible combinations of products and the total quantity ordered for each product
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select product name and calculate total quantity ordered for each product
FROM products
CROSS JOIN orderdetails
-- Cross join products with order details, creating all possible combinations
GROUP BY products.productName;
-- Group results by product name to calculate total quantity ordered for each product
-- This query retrieves all possible combinations of products and order details, showing the total quantity ordered for each product. If a product has no orders, the total quantity will be zero.

-- Problem 19: Generate all possible combinations of employees and the number of customers they manage
SELECT employees.firstName, employees.lastName, COUNT(customers.customerNumber) AS customerCount
-- Select employee first name, last name, and count the number of customers managed
FROM employees
CROSS JOIN customers
-- Cross join employees with customers, creating all possible combinations
GROUP BY employees.firstName, employees.lastName;
-- Group results by employee first name and last name to count the number of customers managed by each employee
-- This query retrieves all possible combinations of employees and customers, showing the number of customers managed by each employee. If an employee manages no customers, the customer count will be zero.

-- Problem 20: Generate all possible combinations of orders and the average quantity ordered for each order
SELECT orders.orderNumber, AVG(orderdetails.quantityOrdered) AS avgQuantity
-- Select order number and calculate average quantity ordered for each order
FROM orders
CROSS JOIN orderdetails
-- Cross join orders with order details, creating all possible combinations
GROUP BY orders.orderNumber;
-- Group results by order number to calculate average quantity ordered for each order
-- This query retrieves all possible combinations of orders and order details, showing the average quantity ordered for each order. If an order has no products, the average quantity will be NULL.

-- Problem 21: Generate all possible combinations of product lines and their total sales
SELECT productlines.productLine, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales
-- Select product line and calculate total sales for each product line
FROM productlines
CROSS JOIN products ON productlines.productLine = products.productLine
-- Cross join product lines with products where product lines match
CROSS JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Cross join products with order details where product codes match
GROUP BY productlines.productLine;
-- Group results by product line to calculate total sales for each product line
-- This query retrieves all possible combinations of product lines and their total sales. If a product line has no sales, the total sales will be zero.

-- Problem 22: Generate all possible combinations of customers and their payments with total amounts
SELECT customers.customerName, SUM(payments.amount) AS totalPayments
-- Select customer name and calculate total payments for each customer
FROM customers
CROSS JOIN payments
-- Cross join customers with payments, creating all possible combinations
GROUP BY customers.customerName;
-- Group results by customer name to calculate total payments for each customer
-- This query retrieves all possible combinations of customers and their payments, showing the total amount of payments for each customer. If a customer has made no payments, the total amount will be zero.

-- Problem 23: Generate all possible combinations of orders and their shipping dates
SELECT orders.orderNumber, shippingdetails.shippedDate
-- Select order number and shipped date
FROM orders
CROSS JOIN shippingdetails;
-- Cross join orders with shipping details, creating all possible combinations
-- This query retrieves all possible combinations of orders and their shipping dates. If an order has no shipping date, the shipping date will be NULL.

-- Problem 24: Generate all possible combinations of employees and their job titles with counts
SELECT employees.jobTitle, COUNT(*) AS jobTitleCount
-- Select job title and count the number of employees for each job title
FROM employees
CROSS JOIN jobtitles
-- Cross join employees with job titles, creating all possible combinations
GROUP BY employees.jobTitle;
-- Group results by job title to count the number of employees for each job title
-- This query retrieves all possible combinations of employees and their job titles, showing the count of employees for each job title. If a job title has no employees, the count will be zero.

-- Problem 25: Generate all possible combinations of customers and their orders with average amounts
SELECT customers.customerName, AVG(orderdetails.quantityOrdered * orderdetails.priceEach) AS avgOrderAmount
-- Select customer name and calculate average order amount for each customer
FROM customers
CROSS JOIN orders
-- Cross join customers with orders, creating all possible combinations
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
-- Left join orders with order details where order numbers match
GROUP BY customers.customerName;
-- Group results by customer name to calculate average order amount for each customer
-- This query retrieves all possible combinations of customers and their orders, showing the average amount for each order. If a customer has no orders, the average amount will be NULL.

-- Problem 26: Generate all possible combinations of products and their order quantities with sums
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select product name and calculate total order quantity for each product
FROM products
CROSS JOIN orderdetails
-- Cross join products with order details, creating all possible combinations
GROUP BY products.productName;
-- Group results by product name to calculate total order quantity for each product
-- This query retrieves all possible combinations of products and their order quantities, showing the total quantity for each product. If a product has no orders, the total quantity will be zero.

-- Problem 27: Generate all possible combinations of customers and their total payments with sums
SELECT customers.customerName, SUM(payments.amount) AS totalPayments
-- Select customer name and calculate total payments for each customer
FROM customers
CROSS JOIN payments
-- Cross join customers with payments, creating all possible combinations
GROUP BY customers.customerName;
-- Group results by customer name to calculate total payments for each customer
-- This query retrieves all possible combinations of customers and their total payments, showing the total amount for each customer. If a customer has made no payments, the total amount will be zero.

-- Problem 28: Generate all possible combinations of employees and their departments with counts
SELECT departments.departmentName, COUNT(*) AS departmentCount
-- Select department name and count the number of employees for each department
FROM employees
CROSS JOIN departments
-- Cross join employees with departments, creating all possible combinations
GROUP BY departments.departmentName;
-- Group results by department name to count the number of employees for each department
-- This query retrieves all possible combinations of employees and their departments, showing the count of employees for each department. If a department has no employees, the count will be zero.

-- Problem 29: Generate all possible combinations of products and their orders with average quantities
SELECT products.productName, AVG(orderdetails.quantityOrdered) AS avgQuantity
-- Select product name and calculate average order quantity for each product
FROM products
CROSS JOIN orderdetails
-- Cross join products with order details, creating all possible combinations
GROUP BY products.productName;
-- Group results by product name to calculate average order quantity for each product
-- This query retrieves all possible combinations of products and their orders, showing the average quantity for each product. If a product has no orders, the average quantity will be NULL.

-- Problem 30: Generate all possible combinations of customers and their orders with total quantities
SELECT customers.customerName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select customer name and calculate total order quantity for each customer
FROM customers
CROSS JOIN orders
-- Cross join customers with orders, creating all possible combinations
LEFT JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
-- Left join orders with order details where order numbers match
GROUP BY customers.customerName;
-- Group results by customer name to calculate total order quantity for each customer
-- This query retrieves all possible combinations of customers and their orders, showing the total quantity for each customer. If a customer has no orders, the total quantity will be zero.
