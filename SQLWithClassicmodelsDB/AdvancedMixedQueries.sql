-- Example 1: SUM with GROUP BY and JOIN
-- Calculate the total quantity ordered for each product along with the product name and product line
SELECT products.productName, products.productLine, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select the product name, product line, and the total quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
GROUP BY products.productName, products.productLine;
-- Group by product name and product line

-- Example 2: AVG with JOIN and HAVING
-- Calculate the average payment amount for each customer in 2004 along with the customer name, but only include customers with an average payment amount greater than 500
SELECT customers.customerName, AVG(payments.amount) AS averagePayment
-- Select the customer name and the average payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2004-01-01' AND '2004-12-31'
-- Where the payment date is in 2004
GROUP BY customers.customerName
-- Group by customer name
HAVING AVG(payments.amount) > 500;
-- Having an average payment amount greater than 500

-- Example 3: COUNT with JOIN and WHERE
-- Count the number of orders placed in 2005 along with the customer name
SELECT customers.customerName, COUNT(orders.orderNumber) AS numberOfOrders
-- Select the customer name and the number of orders
FROM customers
-- From the customers table
JOIN orders ON customers.customerNumber = orders.customerNumber
-- Join with the orders table on customerNumber
WHERE orders.orderDate BETWEEN '2005-01-01' AND '2005-12-31'
-- Where the order date is in 2005
GROUP BY customers.customerName;
-- Group by customer name

-- Example 4: MAX with JOIN and WHERE
-- Find the highest payment amount made in 2006 along with the customer name
SELECT customers.customerName, MAX(payments.amount) AS maxPayment
-- Select the customer name and the highest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2006-01-01' AND '2006-12-31'
-- Where the payment date is in 2006
GROUP BY customers.customerName;
-- Group by customer name

-- Example 5: MIN with JOIN and WHERE
-- Find the smallest payment amount made in 2007 along with the customer name
SELECT customers.customerName, MIN(payments.amount) AS minPayment
-- Select the customer name and the smallest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2007-01-01' AND '2007-12-31'
-- Where the payment date is in 2007
GROUP BY customers.customerName;
-- Group by customer name

-- Example 6: SUM with JOIN and HAVING and WILDCARD
-- Calculate the total quantity ordered for each product with 'S%' in the product code, but only include products with a total quantity ordered greater than 100
SELECT productCode, SUM(quantityOrdered) AS totalQuantity
-- Select the product code and the total quantity ordered
FROM orderdetails
-- From the orderdetails table
WHERE productCode LIKE 'S%'
-- Where the product code starts with 'S'
GROUP BY productCode
-- Group by product code
HAVING SUM(quantityOrdered) > 100;
-- Having a total quantity ordered greater than 100

-- Example 7: AVG with JOIN and HAVING and WILDCARD
-- Calculate the average payment amount for each customer with 'A%' in the customer name, but only include customers with an average payment amount greater than 500
SELECT customerNumber, AVG(amount) AS averagePayment
-- Select the customer number and the average payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'A%'
-- Where the customer name starts with 'A'
GROUP BY customerNumber
-- Group by customer number
HAVING AVG(amount) > 500;
-- Having an average payment amount greater than 500

-- Example 8: COUNT with JOIN and HAVING and WILDCARD
-- Count the number of orders for each customer with 'C%' in the customer name, but only include customers with more than 5 orders
SELECT customerNumber, COUNT(orderNumber) AS numberOfOrders
-- Select the customer number and the number of orders
FROM orders
-- From the orders table
JOIN customers ON orders.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'C%'
-- Where the customer name starts with 'C'
GROUP BY customerNumber
-- Group by customer number
HAVING COUNT(orderNumber) > 5;
-- Having more than 5 orders

-- Example 9: MAX with JOIN and HAVING and WILDCARD
-- Find the highest payment amount for each customer with 'B%' in the customer name, but only include customers with a highest payment amount greater than 1000
SELECT customerNumber, MAX(amount) AS maxPayment
-- Select the customer number and the highest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'B%'
-- Where the customer name starts with 'B'
GROUP BY customerNumber
-- Group by customer number
HAVING MAX(amount) > 1000;
-- Having a highest payment amount greater than 1000

-- Example 10: MIN with JOIN and HAVING and WILDCARD
-- Find the smallest payment amount for each customer with 'D%' in the customer name, but only include customers with a smallest payment amount less than 100
SELECT customerNumber, MIN(amount) AS minPayment
-- Select the customer number and the smallest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'D%'
-- Where the customer name starts with 'D'
GROUP BY customerNumber
-- Group by customer number
HAVING MIN(amount) < 100;
-- Having a smallest payment amount less than 100

-- Example 11: SUM with JOIN and WHERE and HAVING
-- Calculate the total quantity ordered for each product in 2003 along with the product name, but only include products with a total quantity ordered greater than 100
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select the product name and the total quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
-- Join with the orders table on orderNumber
WHERE orders.orderDate BETWEEN '2003-01-01' AND '2003-12-31'
-- Where the order date is in 2003
GROUP BY products.productName
-- Group by product name
HAVING SUM(orderdetails.quantityOrdered) > 100;
-- Having a total quantity ordered greater than 100

-- Example 12: AVG with JOIN and WHERE and HAVING
-- Calculate the average payment amount for each customer in 2004 along with the customer name, but only include customers with an average payment amount greater than 500
SELECT customers.customerName, AVG(payments.amount) AS averagePayment
-- Select the customer name and the average payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2004-01-01' AND '2004-12-31'
-- Where the payment date is in 2004
GROUP BY customers.customerName
-- Group by customer name
HAVING AVG(payments.amount) > 500;
-- Having an average payment amount greater than 500

-- Example 13: COUNT with JOIN and WHERE and HAVING
-- Count the number of orders placed in 2005 along with the customer name, but only include customers with more than 5 orders
SELECT customers.customerName, COUNT(orders.orderNumber) AS numberOfOrders
-- Select the customer name and the number of orders
FROM customers
-- From the customers table
JOIN orders ON customers.customerNumber = orders.customerNumber
-- Join with the orders table on customerNumber
WHERE orders.orderDate BETWEEN '2005-01-01' AND '2005-12-31'
-- Where the order date is in 2005
GROUP BY customers.customerName
-- Group by customer name
HAVING COUNT(orders.orderNumber) > 5;
-- Having more than 5 orders

-- Example 14: MAX with JOIN and WHERE and HAVING
-- Find the highest payment amount made in 2006 along with the customer name, but only include customers with a highest payment amount greater than 1000
SELECT customers.customerName, MAX(payments.amount) AS maxPayment
-- Select the customer name and the highest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2006-01-01' AND '2006-12-31'
-- Where the payment date is in 2006
GROUP BY customers.customerName
-- Group by customer name
HAVING MAX(payments.amount) > 1000;
-- Having a highest payment amount greater than 1000

-- Example 15: MIN with JOIN and WHERE and HAVING
-- Find the smallest payment amount made in 2007 along with the customer name, but only include customers with a smallest payment amount less than 100
SELECT customers.customerName, MIN(payments.amount) AS minPayment
-- Select the customer name and the smallest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2007-01-01' AND '2007-12-31'
-- Where the payment date is in 2007
GROUP BY customers.customerName
-- Group by customer name
HAVING MIN(payments.amount) < 100;
-- Having a smallest payment amount less than 100

-- Example 16: SUM with GROUP BY, JOIN, and WHERE
-- Calculate the total quantity ordered for each product along with the product name and product line, for orders placed in 2004
SELECT products.productName, products.productLine, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select the product name, product line, and the total quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
-- Join with the orders table on orderNumber
WHERE orders.orderDate BETWEEN '2004-01-01' AND '2004-12-31'
-- Where the order date is in 2004
GROUP BY products.productName, products.productLine;
-- Group by product name and product line

-- Example 17: AVG with GROUP BY, JOIN, and WHERE
-- Calculate the average payment amount for each customer along with the customer name and city, for payments made in 2005
SELECT customers.customerName, customers.city, AVG(payments.amount) AS averagePayment
-- Select the customer name, city, and the average payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2005-01-01' AND '2005-12-31'
-- Where the payment date is in 2005
GROUP BY customers.customerName, customers.city;
-- Group by customer name and city

-- Example 18: COUNT with GROUP BY, JOIN, and WHERE
-- Count the number of orders for each customer along with the customer name and city, for orders placed in 2006
SELECT customers.customerName, customers.city, COUNT(orders.orderNumber) AS numberOfOrders
-- Select the customer name, city, and the number of orders
FROM customers
-- From the customers table
JOIN orders ON customers.customerNumber = orders.customerNumber
-- Join with the orders table on customerNumber
WHERE orders.orderDate BETWEEN '2006-01-01' AND '2006-12-31'
-- Where the order date is in 2006
GROUP BY customers.customerName, customers.city;
-- Group by customer name and city

-- Example 19: MAX with GROUP BY, JOIN, and WHERE
-- Find the highest payment amount for each customer along with the customer name and city, for payments made in 2007
SELECT customers.customerName, customers.city, MAX(payments.amount) AS maxPayment
-- Select the customer name, city, and the highest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2007-01-01' AND '2007-12-31'
-- Where the payment date is in 2007
GROUP BY customers.customerName, customers.city;
-- Group by customer name and city

-- Example 20: MIN with GROUP BY, JOIN, and WHERE
-- Find the smallest payment amount for each customer along with the customer name and city, for payments made in 2008
SELECT customers.customerName, customers.city, MIN(payments.amount) AS minPayment
-- Select the customer name, city, and the smallest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
WHERE payments.paymentDate BETWEEN '2008-01-01' AND '2008-12-31'
-- Where the payment date is in 2008
GROUP BY customers.customerName, customers.city;
-- Group by customer name and city

-- Example 21: SUM with JOIN, WHERE, and GROUP BY
-- Calculate the total quantity ordered for each product, but only include products with a total quantity ordered greater than 50, and product codes starting with 'S'
SELECT productCode, SUM(quantityOrdered) AS totalQuantity
-- Select the product code and the total quantity ordered
FROM orderdetails
-- From the orderdetails table
WHERE productCode LIKE 'S%'
-- Where the product code starts with 'S'
GROUP BY productCode
-- Group by product code
HAVING SUM(quantityOrdered) > 50;
-- Having a total quantity ordered greater than 50

-- Example 22: AVG with JOIN, WHERE, and GROUP BY
-- Calculate the average payment amount for each customer, but only include customers with an average payment amount greater than 400, and customer names containing 'Inc'
SELECT customerNumber, AVG(amount) AS averagePayment
-- Select the customer number and the average payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE '%Inc%'
-- Where the customer name contains 'Inc'
GROUP BY customerNumber
-- Group by customer number
HAVING AVG(amount) > 400;
-- Having an average payment amount greater than 400

-- Example 23: COUNT with JOIN, WHERE, and GROUP BY
-- Count the number of orders for each customer, but only include customers with more than 3 orders, and customer names starting with 'A'
SELECT customerNumber, COUNT(orderNumber) AS numberOfOrders
-- Select the customer number and the number of orders
FROM orders
-- From the orders table
JOIN customers ON orders.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'A%'
-- Where the customer name starts with 'A'
GROUP BY customerNumber
-- Group by customer number
HAVING COUNT(orderNumber) > 3;
-- Having more than 3 orders

-- Example 24: MAX with JOIN, WHERE, and GROUP BY
-- Find the highest payment amount for each customer, but only include customers with a highest payment amount greater than 800, and customer names containing 'Ltd'
SELECT customerNumber, MAX(amount) AS maxPayment
-- Select the customer number and the highest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE '%Ltd%'
-- Where the customer name contains 'Ltd'
GROUP BY customerNumber
-- Group by customer number
HAVING MAX(amount) > 800;
-- Having a highest payment amount greater than 800

-- Example 25: MIN with JOIN, WHERE, and GROUP BY
-- Find the smallest payment amount for each customer, but only include customers with a smallest payment amount less than 200, and customer names containing 'Co'
SELECT customerNumber, MIN(amount) AS minPayment
-- Select the customer number and the smallest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE '%Co%'
-- Where the customer name contains 'Co'
GROUP BY customerNumber
-- Group by customer number
HAVING MIN(amount) < 200;
-- Having a smallest payment amount less than 200

-- Example 26: SUM with JOIN, WHERE, GROUP BY, and ORDER BY
-- Calculate the total quantity ordered for each product along with the product name, ordered by total quantity in descending order
SELECT products.productName, SUM(orderdetails.quantityOrdered) AS totalQuantity
-- Select the product name and the total quantity ordered
FROM products
-- From the products table
JOIN orderdetails ON products.productCode = orderdetails.productCode
-- Join with the orderdetails table on productCode
GROUP BY products.productName
-- Group by product name
ORDER BY totalQuantity DESC;
-- Order by total quantity in descending order

-- Example 27: AVG with JOIN, WHERE, GROUP BY, and ORDER BY
-- Calculate the average payment amount for each customer along with the customer name, ordered by average payment amount in ascending order
SELECT customers.customerName, AVG(payments.amount) AS averagePayment
-- Select the customer name and the average payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
GROUP BY customers.customerName
-- Group by customer name
ORDER BY averagePayment ASC;
-- Order by average payment amount in ascending order

-- Example 28: COUNT with JOIN, WHERE, GROUP BY, and ORDER BY
-- Count the number of orders for each customer along with the customer name, ordered by number of orders in descending order
SELECT customers.customerName, COUNT(orders.orderNumber) AS numberOfOrders
-- Select the customer name and the number of orders
FROM customers
-- From the customers table
JOIN orders ON customers.customerNumber = orders.customerNumber
-- Join with the orders table on customerNumber
GROUP BY customers.customerName
-- Group by customer name
ORDER BY numberOfOrders DESC;
-- Order by number of orders in descending order

-- Example 29: MAX with JOIN, WHERE, GROUP BY, and ORDER BY
-- Find the highest payment amount for each customer along with the customer name, ordered by highest payment amount in ascending order
SELECT customers.customerName, MAX(payments.amount) AS maxPayment
-- Select the customer name and the highest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
GROUP BY customers.customerName
-- Group by customer name
ORDER BY maxPayment ASC;
-- Order by highest payment amount in ascending order

-- Example 30: MIN with JOIN, WHERE, GROUP BY, and ORDER BY
-- Find the smallest payment amount for each customer along with the customer name, ordered by smallest payment amount in descending order
SELECT customers.customerName, MIN(payments.amount) AS minPayment
-- Select the customer name and the smallest payment amount
FROM customers
-- From the customers table
JOIN payments ON customers.customerNumber = payments.customerNumber
-- Join with the payments table on customerNumber
GROUP BY customers.customerName
-- Group by customer name
ORDER BY minPayment DESC;
-- Order by smallest payment amount in descending order

-- Example 31: SUM with JOIN, WHERE, GROUP BY, and HAVING
-- Calculate the total quantity ordered for each product, but only include products with a total quantity ordered greater than 75, and order by total quantity in descending order
SELECT productCode, SUM(quantityOrdered) AS totalQuantity
-- Select the product code and the total quantity ordered
FROM orderdetails
-- From the orderdetails table
GROUP BY productCode
-- Group by product code
HAVING SUM(quantityOrdered) > 75
-- Having a total quantity ordered greater than 75
ORDER BY totalQuantity DESC;
-- Order by total quantity in descending order

-- Example 32: AVG with JOIN, WHERE, GROUP BY, and HAVING
-- Calculate the average payment amount for each customer, but only include customers with an average payment amount greater than 450, and order by average payment amount in ascending order
SELECT customerNumber, AVG(amount) AS averagePayment
-- Select the customer number and the average payment amount
FROM payments
-- From the payments table
GROUP BY customerNumber
-- Group by customer number
HAVING AVG(amount) > 450
-- Having an average payment amount greater than 450
ORDER BY averagePayment ASC;
-- Order by average payment amount in ascending order

-- Example 33: COUNT with JOIN, WHERE, GROUP BY, and HAVING
-- Count the number of orders for each customer, but only include customers with more than 4 orders, and order by number of orders in descending order
SELECT customerNumber, COUNT(orderNumber) AS numberOfOrders
-- Select the customer number and the number of orders
FROM orders
-- From the orders table
GROUP BY customerNumber
-- Group by customer number
HAVING COUNT(orderNumber) > 4
-- Having more than 4 orders
ORDER BY numberOfOrders DESC;
-- Order by number of orders in descending order

-- Example 34: MAX with JOIN, WHERE, GROUP BY, and HAVING
-- Find the highest payment amount for each customer, but only include customers with a highest payment amount greater than 900, and order by highest payment amount in ascending order
SELECT customerNumber, MAX(amount) AS maxPayment
-- Select the customer number and the highest payment amount
FROM payments
-- From the payments table
GROUP BY customerNumber
-- Group by customer number
HAVING MAX(amount) > 900
-- Having a highest payment amount greater than 900
ORDER BY maxPayment ASC;
-- Order by highest payment amount in ascending order

-- Example 35: MIN with JOIN, WHERE, GROUP BY, and HAVING
-- Find the smallest payment amount for each customer, but only include customers with a smallest payment amount less than 150, and order by smallest payment amount in descending order
SELECT customerNumber, MIN(amount) AS minPayment
-- Select the customer number and the smallest payment amount
FROM payments
-- From the payments table
GROUP BY customerNumber
-- Group by customer number
HAVING MIN(amount) < 150
-- Having a smallest payment amount less than 150
ORDER BY minPayment DESC;
-- Order by smallest payment amount in descending order

-- Example 36: SUM with JOIN, WHERE, GROUP BY, and HAVING
-- Calculate the total quantity ordered for each product, but only include products with a total quantity ordered greater than 60, and product codes containing 'S', and order by total quantity in descending order
SELECT productCode, SUM(quantityOrdered) AS totalQuantity
-- Select the product code and the total quantity ordered
FROM orderdetails
-- From the orderdetails table
WHERE productCode LIKE '%S%'
-- Where the product code contains 'S'
GROUP BY productCode
-- Group by product code
HAVING SUM(quantityOrdered) > 60
-- Having a total quantity ordered greater than 60
ORDER BY totalQuantity DESC;
-- Order by total quantity in descending order

-- Example 37: AVG with JOIN, WHERE, GROUP BY, and HAVING
-- Calculate the average payment amount for each customer, but only include customers with an average payment amount greater than 500, and customer names starting with 'T', and order by average payment amount in ascending order
SELECT customerNumber, AVG(amount) AS averagePayment
-- Select the customer number and the average payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'T%'
-- Where the customer name starts with 'T'
GROUP BY customerNumber
-- Group by customer number
HAVING AVG(amount) > 500
-- Having an average payment amount greater than 500
ORDER BY averagePayment ASC;
-- Order by average payment amount in ascending order

-- Example 38: COUNT with JOIN, WHERE, GROUP BY, and HAVING
-- Count the number of orders for each customer, but only include customers with more than 5 orders, and customer names containing 'Shop', and order by number of orders in descending order
SELECT customerNumber, COUNT(orderNumber) AS numberOfOrders
-- Select the customer number and the number of orders
FROM orders
-- From the orders table
JOIN customers ON orders.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE '%Shop%'
-- Where the customer name contains 'Shop'
GROUP BY customerNumber
-- Group by customer number
HAVING COUNT(orderNumber) > 5
-- Having more than 5 orders
ORDER BY numberOfOrders DESC;
-- Order by number of orders in descending order

-- Example 39: MAX with JOIN, WHERE, GROUP BY, and HAVING
-- Find the highest payment amount for each customer, but only include customers with a highest payment amount greater than 800, and customer names starting with 'R', and order by highest payment amount in ascending order
SELECT customerNumber, MAX(amount) AS maxPayment
-- Select the customer number and the highest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE 'R%'
-- Where the customer name starts with 'R'
GROUP BY customerNumber
-- Group by customer number
HAVING MAX(amount) > 800
-- Having a highest payment amount greater than 800
ORDER BY maxPayment ASC;
-- Order by highest payment amount in ascending order

-- Example 40: MIN with JOIN, WHERE, GROUP BY, and HAVING
-- Find the smallest payment amount for each customer, but only include customers with a smallest payment amount less than 120, and customer names containing 'LLC', and order by smallest payment amount in descending order
SELECT customerNumber, MIN(amount) AS minPayment
-- Select the customer number and the smallest payment amount
FROM payments
-- From the payments table
JOIN customers ON payments.customerNumber = customers.customerNumber
-- Join with the customers table on customerNumber
WHERE customers.customerName LIKE '%LLC%'
-- Where the customer name contains 'LLC'
GROUP BY customerNumber
-- Group by customer number
HAVING MIN(amount) < 120
-- Having a smallest payment amount less than 120
ORDER BY minPayment DESC;
-- Order by smallest payment amount in descending order

