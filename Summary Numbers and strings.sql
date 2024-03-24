SELECT
	Price,
    ROUND(price),
    Ceil(price),
    FLOOR(price)
FROM Products;

SELECT * FROM OrderDetails
WHERE ABS(Quantity -10) <5 ;

SELECT
  OrderDetailID, ProductID, Quantity,
  GREATEST(OrderDetailID, ProductID, Quantity),
  LEAST(OrderDetailID, ProductID, Quantity)
FROM OrderDetails;

SELECT
	MAX(Quantity),
    MIN(Quantity),
    COUNT(Quantity),
    SUM(Quantity),
    AVG(Quantity)
FROM OrderDetails
WHERE OrderDetailID BETWEEN 20 AND 30;

SELECT Price, POWER(Price, 1/2)
FROM Products
WHERE SQRT(Price) < 4;


SELECT CONCAT('HELLO','','THIS IS',2021);

SELECT CONCAT_WS('-',2021,8,15,'AM');

SELECT
	CONCAT_WS(' ',FirstName, Lastname) AS FullName
FROM Employees;

SELECT
	OrderDate,
    LEFT(OrderDate,4) AS Year,
    SUBSTR(OrderDate,6,2) AS Month,
    RIGHT(OrderDate,2) AS day
FROM Orders;

SELECT
 length('안녕하세요'),
 char_length('안녕하세요');

SELECT * FROM Categories
WHERE Categoryname =TRIM(' Beverages' );

SELECT
	LPAD(supplierID,5,0),
    RPAD(supplierID,6,0)
FROM Products;

SELECT
	REPLACE(Description,',','and')
FROM Categories;

SELECT
	Description,
    REPLACE(Description,',','and'),
    REPLACE(REPLACE(Description,', and',','),',','and')
FROM Categories;

SELECT
	'01'='1',
    CONVERT('01',DECIMAL)=CONVERT('1',DECIMAL);
