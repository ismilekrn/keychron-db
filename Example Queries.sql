-- 1. Example of running a query on a M:M relationship

SELECT product_name, quantity, order_date
FROM Products
JOIN Ordered_Product ON Products.product_id = Ordered_Product.product_id
JOIN Orders ON Ordered_Product.order_id=Orders.order_id;

-- 2. Example of running a query on a 1:1 relationship 

SELECT order_id, customer_name, invoice_date, invoice_amount
FROM Invoices INNER JOIN Customers ON invoices.customer_id = customers.customer_id
WHERE invoice_id IN (SELECT invoice_id
FROM Orders);

-- 3. Example of running a query on a recursive relationship of your model

SELECT employee.staff_first_name, employee.staff_last_name, employee.staff_birth_date
FROM Staff employee, Staff boss
WHERE boss.staff_first_name = 'Eric'
AND employee.staff_id=boss.supervisor_id;

-- 4. In this query we are listing supplier names, product names, product prices where product_name is not ‘Keychron K3 Brown Switch’

SELECT DISTINCT supplier_name, product_name, product_price
FROM Products, Suppliers
WHERE Products.supplier_id=Suppliers.supplier_id
AND product_name <> 'Keychron K3 Brown Switch';

-- 5. In this query we are listing the employees who were born in the 1990s.

SELECT staff_first_name, staff_last_name, staff_birth_date
FROM Staff
WHERE staff_birth_date LIKE '199%';

-- 6. With this query we are trying to retrieve columns of customer_name, order_date, invoice_date, invoice_amount whose order date is different then invoice date ordered by invoice amount descending

SELECT customer_name, order_date, invoice_date, invoice_amount
FROM Customers
INNER JOIN Orders ON customers.customer_id=orders.customer_id INNER JOIN Invoices ON orders.invoice_id=invoices.invoice_id
WHERE order_date <> invoice_date
ORDER BY invoice_amount DESC;

-- 7. In this query, we are trying to see how many products are priced above the average.

SELECT COUNT(*) AS Number_of_Products_Above_Average_Price
FROM Products
WHERE product_price > (SELECT AVG(product_price)
FROM Products);

-- 8. In this query we are trying to see the number of orders made by each customer in a descending order based on invoice amount.

SELECT COUNT(Orders.order_id) AS Number_of_Orders, customer_name, invoice_amount
FROM Customers
JOIN Orders ON Orders.customer_id=Customers.customer_id
JOIN Invoices ON Orders.order_id=Invoices.order_id
GROUP BY Customers.customer_id
ORDER BY invoice_amount DESC;

-- 9. In this query we are trying to retrieve total sales for countries where customers are located in

SELECT customers.customer_country as Country, SUM(product_price*quantity) AS total_sales
FROM Products
INNER JOIN Ordered_Product ON Products.product_id=Ordered_Product.product_id
INNER JOIN Orders ON Ordered_Product.order_id=Orders.order_id
INNER JOIN Customers ON orders.customer_id=customers.customer_id
GROUP BY Country;

-- 10. In this query we are trying to retrieve the amount of orders handled by each staff member with condition of more than 1 order

SELECT staff.staff_first_name AS EmployeeFirstName, COUNT(Orders.Order_id) AS NumberOfOrders
FROM (Orders INNER JOIN staff ON orders.staff_id = staff.staff_id)
GROUP BY staff_first_name
HAVING COUNT(Orders.Order_id) > 1;

-- 11. In this query, we are using the “in” operator with subqueries. This will return customers whose order in quantity were greater than or equal to one.

SELECT DISTINCT Customer_id, customer_name, customer_email_address
FROM CUSTOMERS
WHERE CUSTOMER_ID IN (SELECT DISTINCT CUSTOMER_ID
FROM ORDERS
WHERE ORDER_ID IN (SELECT DISTINCT ORDER_ID
FROM ordered_product
WHERE quantity >=1));

-- 12. In this query we are trying to retrieve the name of the managers and their associated birthdays, as well as the number of people they manage (recursive relationship)

SELECT employee.staff_first_name, employee.staff_birth_date, COUNT(employee.staff_id) AS NumberofPeopleManaged
FROM Staff employee
JOIN Staff manager ON employee.staff_id=manager.supervisor_id
GROUP BY manager.supervisor_id