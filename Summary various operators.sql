SELECT 5-2.5 AS DIFFERENCE;
-- Generate 2.5 with column Difference
SELECT 3*(2+4) /2 AS number , 'Hello' AS TEXT;
-- AS means adding column
SELECT 'ABC' + 3;
-- if I add string and number, string is '0', that's why 'ABC'+3=0
SELECT '1' +'002'* 3;
-- even if it's string, if string includes number, Calculate.
SELECT
	OrderID, ProductID,
	OrderID + ProductID AS SUM
FROM OrderDetails;
-- each numbers in OrderID and each numbers in ProductID are summed
SELECT 
	ProductName,
    Price / 2 AS HalfPrice,
    Price * 2 AS DoublePrice,
    Price * 0.75 AS DISCOUNTEDPrice
FROM Products;

SELECT * FROM Orders
WHERE 
CustomerId = 15 AND EmployeeId = 4;
-- Get the one with CustomerId = 15 and EmployeeId =4


SELECT * FROM Products
WHERE
 ProductName = 'Tofu' OR CategoryId = 8;
-- ProductName = 'Tofu' CategoryId = 8 If either is satisfied, output

SELECT * FROM OrderDetails
WHERE
	ProductId = 20
    AND (OrderId = 10514 OR Quantity =50);

SELECT 
	ProductName, Price,
    Price > 20 AS Cheap
FROM Products;

SELECT * FROM OrderDetails
WHERE ProductID BETWEEN 1 AND 4;

SELECT * FROM Customers
WHERE City IN ('Torino' , 'Paris', 'Portland', 'Madrid')

SELECT * FROM Customers
WHERE City NOT IN ('Torino' , 'Paris', 'Portland', 'Madrid')

SELECT
	'HELLO' LIKE 'hel%',
    'HELLO' LIKE '%H'

SELECT * FROM Customers
WHERE CustomerName LIKE 'b%';

SELECT
	'HELLO' LIKE 'HEL__',
    'HELLO' LIKE '_HELLO'

SELECT * FROM Employees
WHERE Notes LIKE 'economics%';

SELECT * FROM OrderDetails
WHERE OrderID LIKE '1025_';
