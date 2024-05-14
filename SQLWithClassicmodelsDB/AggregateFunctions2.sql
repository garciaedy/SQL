

-- Problem 1: Count the number of offices
SELECT COUNT(*) AS officeCount FROM offices;

-- Problem 2: Calculate the average quantity ordered for all products
SELECT AVG(quantityOrdered) AS averageQuantityOrdered FROM orderdetails;

-- Problem 3: Find the total number of products
SELECT COUNT(*) AS productCount FROM products;

-- Problem 4: Calculate the sum of all credit limits for customers
SELECT SUM(creditLimit) AS totalCreditLimit FROM customers;

-- Problem 5: Find the minimum credit limit of customers
SELECT MIN(creditLimit) AS minCreditLimit FROM customers;

-- Problem 6: Find the maximum payment amount
SELECT MAX(amount) AS maxPayment FROM payments;

-- Problem 7: Count the number of products in each product line
SELECT productLine, COUNT(*) AS productCount FROM products GROUP BY productLine;

-- Problem 8: Calculate the total amount of payments for each customer
SELECT customerNumber, SUM(amount) AS totalPayments FROM payments GROUP BY customerNumber;

-- Problem 9: Find the average price of products
SELECT AVG(buyPrice) AS averageBuyPrice FROM products;

-- Problem 10: Calculate the total quantity ordered for each order
SELECT orderNumber, SUM(quantityOrdered) AS totalQuantityOrdered FROM orderdetails GROUP BY orderNumber;

-- Problem 11: Find the average order value
SELECT AVG(quantityOrdered * priceEach) AS averageOrderValue FROM orderdetails;

-- Problem 12: Count the number of payments made by each customer
SELECT customerNumber, COUNT(*) AS paymentCount FROM payments GROUP BY customerNumber;

-- Problem 13: Calculate the average MSRP of products
SELECT AVG(MSRP) AS averageMSRP FROM products;

-- Problem 14: Find the minimum and maximum quantity ordered for each product
SELECT productCode, MIN(quantityOrdered) AS minQuantityOrdered, MAX(quantityOrdered) AS maxQuantityOrdered FROM orderdetails GROUP BY productCode;

-- Problem 15: Calculate the total credit limit for customers in each country
SELECT country, SUM(creditLimit) AS totalCreditLimit FROM customers GROUP BY country;

-- Problem 16: Find the average quantity in stock for each product vendor
SELECT productVendor, AVG(quantityInStock) AS averageStock FROM products GROUP BY productVendor;

-- Problem 17: Calculate the total sales amount for each order
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS totalSales FROM orderdetails GROUP BY orderNumber;

-- Problem 18: Find the maximum and minimum credit limit for each country
SELECT country, MAX(creditLimit) AS maxCreditLimit, MIN(creditLimit) AS minCreditLimit FROM customers GROUP BY country;

-- Problem 19: Calculate the average payment amount for each payment date
SELECT paymentDate, AVG(amount) AS averagePayment FROM payments GROUP BY paymentDate;

-- Problem 20: Count the number of orders for each status
SELECT status, COUNT(*) AS orderCount FROM orders GROUP BY status;

-- Problem 21: Find the maximum MSRP of products in each product line
SELECT productLine, MAX(MSRP) AS maxMSRP FROM products GROUP BY productLine;

-- Problem 22: Calculate the total number of orders for each order date
SELECT orderDate, COUNT(*) AS orderCount FROM orders GROUP BY orderDate;

-- Problem 23: Find the average quantity ordered for each product line
SELECT productLine, AVG(quantityOrdered) AS averageQuantityOrdered FROM orderdetails JOIN products ON orderdetails.productCode = products.productCode GROUP BY productLine;

-- Problem 24: Calculate the total payments made by each customer in each year
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, SUM(amount) AS totalPayments FROM payments GROUP BY customerNumber, paymentYear;

-- Problem 25: Find the minimum and maximum quantity in stock for each product vendor
SELECT productVendor, MIN(quantityInStock) AS minStock, MAX(quantityInStock) AS maxStock FROM products GROUP BY productVendor;

-- Problem 26: Calculate the total sales amount for each employee (assume employee salesRepEmployeeNumber is same as customer.salesRepEmployeeNumber)
SELECT salesRepEmployeeNumber, SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalSales FROM orders JOIN customers ON orders.customerNumber = customers.customerNumber JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber GROUP BY salesRepEmployeeNumber;

-- Problem 27: Find the average credit limit for each sales rep
SELECT salesRepEmployeeNumber, AVG(creditLimit) AS averageCreditLimit FROM customers GROUP BY salesRepEmployeeNumber;

-- Problem 28: Calculate the total quantity ordered for each product vendor
SELECT productVendor, SUM(orderdetails.quantityOrdered) AS totalQuantityOrdered FROM products JOIN orderdetails ON products.productCode = orderdetails.productCode GROUP BY productVendor;

-- Problem 29: Find the maximum, minimum, and average price of products for each product line
SELECT productLine, MAX(buyPrice) AS maxPrice, MIN(buyPrice) AS minPrice, AVG(buyPrice) AS avgPrice FROM products GROUP BY productLine;

-- Problem 30: Calculate the total number of payments made by each customer in each month
SELECT customerNumber, YEAR(paymentDate) AS paymentYear, MONTH(paymentDate) AS paymentMonth, COUNT(*) AS totalPayments FROM payments GROUP BY customerNumber, paymentYear, paymentMonth;
