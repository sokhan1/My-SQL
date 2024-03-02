SELECT * FROM Customers;
-- Get all information from Table Customers;

SELECT CustomerName, ContactName, Country from Customers;
--Get only columns that I want to get 

SELECT CustomerName, 1, 'Hello', NULL FROM Customers;
-- Get CustomerName, 1, 'Hello' and NULL ( NULL is empty)

SELECT CustomerID, EmployeeID FROM Orders WHERE EmployeeID = 3;
-- get rows with EmployeeID=3 are loaded 

SELECT * FROM OrderDetails WHERE Quantity < 3;
-- get rows that are less than 3 in Quantity

SELECT * FROM OrderDetails ORDER BY ProductID ASC, Quantity DESC 
-- Set order of table displayed on a screen by using ORDER BY
  
SELECT * FROM Customers LIMIT 30, 10;
-- LIMIT {the number of items that I get} OR LIMIT {the number of items that I skip} {the number of items that I get}

SELECT 
	CustomerId AS A,
    CustomerName AS B,
    Address AS addr
FROM Customers;
-- Change column name to another name
