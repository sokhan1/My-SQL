SELECT Country FROM Customers
GROUP BY Country;

SELECT CategoryID FROM Products
GROUP BY CategoryID;

SELECT
	Country, City,
    CONCAT_WS(',',City,Country)
FROM Customers
GROUP BY Country, City;

SELECT
	COUNT(*), OrderDate
FROM Orders
GROUP BY OrderDate;

SELECT
	ProductID,
    SUM(Quantity) AS QuantitySum
FROM OrderDetails
GROUP BY ProductID
ORDER BY QuantitySum;

SELECT 
	CategoryID,
    MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    TRUNCATE((MAX(Price)+MIN(Price)) / 2, 2 ) AS MedianPrice,
    TRUNCATE(AVG(Price),2) AS AVGa
FROM Products
GROUP BY CategoryID;

SELECT
	CONCAT_WS(',',City,Country) AS Location,
    COUNT(*)
FROM Customers
GROUP BY Country, City;

SELECT
	Country, COUNT(*)
FROM Suppliers
GROUP BY Country
WITH ROLLUP;

SELECT
	ProductID,
    SUM(Quantity) AS QuantitySum
FROM OrderDetails
GROUP BY ProductID
WITH ROLLUP;

SELECT
	MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    TRUNCATE(MAX(Price) + MIN(Price)/2 , 2) AS MedianPrice,
    TRUNCATE(AVG(Price),2) AS AveragePrice
FROM Products
GROUP BY CategoryID
WITH ROLLUP;

SELECT
	Country, COUNT(*) AS Count
FROM Suppliers
GROUP BY Country
HAVING Count >=3;

SELECT
	COUNT(*) AS Count, OrderDate
FROM Orders
WHERE OrderDate > DATE('1996-12-31')
GROUP BY OrderDate
HAVING Count > 2;

SELECT
	CategoryID,
	MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    TRUNCATE((MAX(Price) + MIN(Price)) / 2, 2) AS MediaPrice,
    TRUNCATE(AVG(Price),2) AS AveragePrice
FROM Products
HAVING
	AveragePrice BETWEEN 20 AND 30
    AND MedianPrice < 40;

SELECT
	CategoryID,
	MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    TRUNCATE((MAX(Price) + MIN(Price)) / 2, 2) AS MedianPrice,
    TRUNCATE(AVG(Price),2) AS AveragePrice
FROM Products
GROUP BY CategoryID
HAVING
	AveragePrice BETWEEN 20 AND 30
    AND MedianPrice < 40;

SELECT DISTINCT Country
FROM Customers
ORDER BY Country;

SELECT DISTINCT Country, City
FROM Customers
ORDER BY Country, City;

SELECT
	Country,
