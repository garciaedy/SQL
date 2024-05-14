-- Problem 1: Find the total quantity ordered for each product
SELECT productCode, SUM(quantityOrdered) AS totalQuantityOrdered FROM orderdetails GROUP BY productCode;

-- Problem 2: Calculate the total sales amount for each customer
SELECT customerNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY customerNumber;

-- Problem 3: Find the maximum, minimum, and average buy price for each product vendor
SELECT productVendor, MAX(buyPrice) AS maxBuyPrice, MIN(buyPrice) AS minBuyPrice, AVG(buyPrice) AS avgBuyPrice 
FROM products 
GROUP BY productVendor;

-- Problem 4: Calculate the total number of orders placed each year
SELECT YEAR(orderDate) AS orderYear, COUNT(*) AS totalOrders 
FROM orders 
GROUP BY orderYear;

-- Problem 5: Find the total payments made by each customer in each month
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, MONTH(paymentDate) AS paymentMonth, SUM(amount) AS totalPayments 
FROM payments 
GROUP BY customerNumber, paymentYear, paymentMonth;

-- Problem 6: Calculate the total credit limit for each sales rep
SELECT salesRepEmployeeNumber, SUM(creditLimit) AS totalCreditLimit 
FROM customers 
GROUP BY salesRepEmployeeNumber;

-- Problem 7: Find the average order value for each customer
SELECT customerNumber, AVG(orderdetails.quantityOrdered * orderdetails.priceEach) AS avgOrderValue 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY customerNumber;

-- Problem 8: Calculate the total number of products sold by each employee
SELECT salesRepEmployeeNumber, SUM(orderdetails.quantityOrdered) AS totalProductsSold 
FROM orders 
JOIN customers ON orders.customerNumber = customers.customerNumber 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY salesRepEmployeeNumber;

-- Problem 9: Find the maximum, minimum, and average quantity in stock for each product line
SELECT productLine, MAX(quantityInStock) AS maxStock, MIN(quantityInStock) AS minStock, AVG(quantityInStock) AS avgStock 
FROM products 
GROUP BY productLine;

-- Problem 10: Calculate the total sales amount for each year
SELECT YEAR(orderDate) AS orderYear, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY orderYear;

-- Problem 11: Find the average credit limit for each country
SELECT country, AVG(creditLimit) AS avgCreditLimit 
FROM customers 
GROUP BY country;

-- Problem 12: Calculate the total payments made by each customer in each year
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, SUM(amount) AS totalPayments 
FROM payments 
GROUP BY customerNumber, paymentYear;

-- Problem 13: Find the maximum and minimum payment amount for each customer
SELECT customerNumber, MAX(amount) AS maxPayment, MIN(amount) AS minPayment 
FROM payments 
GROUP BY customerNumber;

-- Problem 14: Calculate the total number of products sold each month
SELECT YEAR(orderDate) AS orderYear, MONTH(orderDate) AS orderMonth, SUM(orderdetails.quantityOrdered) AS totalProductsSold 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY orderYear, orderMonth;

-- Problem 15: Find the average buy price for each product line
SELECT productLine, AVG(buyPrice) AS avgBuyPrice 
FROM products 
GROUP BY productLine;

-- Problem 16: Calculate the total sales amount for each product vendor
SELECT productVendor, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales 
FROM products 
JOIN orderdetails ON products.productCode = orderdetails.productCode 
GROUP BY productVendor;

-- Problem 17: Find the maximum and minimum quantity ordered for each customer
SELECT customerNumber, MAX(orderdetails.quantityOrdered) AS maxQuantityOrdered, MIN(orderdetails.quantityOrdered) AS minQuantityOrdered 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY customerNumber;

-- Problem 18: Calculate the total credit limit for each country
SELECT country, SUM(creditLimit) AS totalCreditLimit 
FROM customers 
GROUP BY country;

-- Problem 19: Find the average payment amount for each year
SELECT YEAR(paymentDate) AS paymentYear, AVG(amount) AS avgPayment 
FROM payments 
GROUP BY paymentYear;

-- Problem 20: Calculate the total sales amount for each office
SELECT officeCode, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales 
FROM employees 
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber 
JOIN orders ON customers.customerNumber = orders.customerNumber 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY officeCode;

-- Problem 21: Find the maximum and minimum MSRP for each product line
SELECT productLine, MAX(MSRP) AS maxMSRP, MIN(MSRP) AS minMSRP 
FROM products 
GROUP BY productLine;

-- Problem 22: Calculate the total quantity ordered for each product line
SELECT productLine, SUM(orderdetails.quantityOrdered) AS totalQuantityOrdered 
FROM products 
JOIN orderdetails ON products.productCode = orderdetails.productCode 
GROUP BY productLine;

-- Problem 23: Find the average quantity ordered for each year
SELECT YEAR(orderDate) AS orderYear, AVG(orderdetails.quantityOrdered) AS avgQuantityOrdered 
FROM orders 
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber 
GROUP BY orderYear;

-- Problem 24: Calculate the total sales amount for each payment date
SELECT paymentDate, SUM(amount) AS totalPayments 
FROM payments 
GROUP BY paymentDate;

-- Problem 25: Find the maximum and minimum quantity in stock for each product vendor
SELECT productVendor, MAX(quantityInStock) AS maxStock, MIN(quantityInStock) AS minStock 
FROM products 
GROUP BY productVendor;

-- Problem 26: Calculate the total number of payments made by each customer in each quarter
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, QUARTER(paymentDate) AS paymentQuarter, COUNT(*) AS totalPayments 
FROM payments 
GROUP BY customerNumber, paymentYear, paymentQuarter;

-- Problem 27: Find the average credit limit for each sales rep
SELECT salesRepEmployeeNumber, AVG(creditLimit) AS avgCreditLimit 
FROM customers 
GROUP BY salesRepEmployeeNumber;

-- Problem 28: Calculate the total quantity ordered for each product vendor
SELECT productVendor, SUM(orderdetails.quantityOrdered) AS totalQuantityOrdered 
FROM products 
JOIN orderdetails ON products.productCode = orderdetails.productCode 
GROUP BY productVendor;

-- Problem 29: Find the maximum, minimum, and average price of products for each product line
SELECT productLine, MAX(buyPrice) AS maxPrice, MIN(buyPrice) AS minPrice, AVG(buyPrice) AS avgPrice 
FROM products 
GROUP BY productLine;

-- Problem 30: Calculate the total number of payments made by each customer in each month
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, MONTH(paymentDate) AS paymentMonth, COUNT(*) AS totalPayments 
FROM payments 
GROUP BY customerNumber, paymentYear, paymentMonth;
