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

-- Example 11: Count the number of offices
SELECT COUNT(*) AS officeCount FROM offices;

-- Example 12: Calculate the average quantity ordered for all products
SELECT AVG(quantityOrdered) AS averageQuantityOrdered FROM orderdetails;

-- Example 13: Find the total number of products
SELECT COUNT(*) AS productCount FROM products;

-- Example 14: Calculate the sum of all credit limits for customers
SELECT SUM(creditLimit) AS totalCreditLimit FROM customers;

-- Example 15: Find the minimum credit limit of customers
SELECT MIN(creditLimit) AS minCreditLimit FROM customers;

-- Example 16: Find the maximum payment amount
SELECT MAX(amount) AS maxPayment FROM payments;

-- Example 17: Count the number of products in each product line
SELECT productLine, COUNT(*) AS productCount FROM products GROUP BY productLine;

-- Example 18: Calculate the total amount of payments for each customer
SELECT customerNumber, SUM(amount) AS totalPayments FROM payments GROUP BY customerNumber;

-- Example 19: Find the average price of products
SELECT AVG(buyPrice) AS averageBuyPrice FROM products;

-- Example 20: Calculate the total quantity ordered for each order
SELECT orderNumber, SUM(quantityOrdered) AS totalQuantityOrdered FROM orderdetails GROUP BY orderNumber;

-- Example 21: Find the average order value
SELECT AVG(quantityOrdered * priceEach) AS averageOrderValue FROM orderdetails;

-- Example 22: Count the number of payments made by each customer
SELECT customerNumber, COUNT(*) AS paymentCount FROM payments GROUP BY customerNumber;

-- Example 23: Calculate the average MSRP of products
SELECT AVG(MSRP) AS averageMSRP FROM products;

-- Example 24: Find the minimum and maximum quantity ordered for each product
SELECT productCode, MIN(quantityOrdered) AS minQuantityOrdered, MAX(quantityOrdered) AS maxQuantityOrdered FROM orderdetails GROUP BY productCode;

-- Example 25: Calculate the total credit limit for customers in each country
SELECT country, SUM(creditLimit) AS totalCreditLimit FROM customers GROUP BY country;

-- Example 26: Find the average quantity in stock for each product vendor
SELECT productVendor, AVG(quantityInStock) AS averageStock FROM products GROUP BY productVendor;

-- Example 27: Calculate the total sales amount for each order
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalSales FROM orderdetails GROUP BY orderNumber;

-- Example 28: Find the maximum and minimum credit limit for each country
SELECT country, MAX(creditLimit) AS maxCreditLimit, MIN(creditLimit) AS minCreditLimit FROM customers GROUP BY country;

-- Example 29: Calculate the average payment amount for each payment date
SELECT paymentDate, AVG(amount) AS averagePayment FROM payments GROUP BY paymentDate;

-- Example 30: Count the number of orders for each status
SELECT status, COUNT(*) AS orderCount FROM orders GROUP BY status;
