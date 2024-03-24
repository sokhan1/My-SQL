SELECT * FROM Categories C
JOIN Products P
	ON C.CategoryID = P.CategoryID;

SELECT C.CategoryID, C.CategoryName, P.ProductName
FROM Categories C
JOIN Products P
	ON C.CategoryID = P.CategoryID;

SELECT 
	CONCAT(
		P.ProductName, ' by ', S.SupplierName) 
        AS Product,
        S.Phone, P.Price
FROM Products P
JOIN Suppliers S
ON P.SupplierID = S.SupplierID
WHERE Price > 50
ORDER BY ProductName;

SELECT
	C.CategoryID, C.CategoryName,
    P.ProductName,
    O.OrderDate,
    D.Quantity
FROM Categories C
JOIN Products P
ON C.categoryID = P.categoryID
JOIN OrderDetails D
ON P.ProductID = D.ProductID
JOIN Orders O
ON O.OrderID = D.OrderID;

SELECT
	E1.EmployeeID, CONCAT_WS(' ',E1.FirstName, E1.LastName) AS Employee,
    E2.EmployeeID, CONCAT_WS(' ',E2.FirstName, E2.LastName) AS NextEmployee
FROM Employees E1 JOIN Employees E2
ON E1.EmployeeID + 1 = E2.EmployeeID;

SELECT
	E1.EmployeeID, CONCAT_WS(' ',E1.FirstName, E1.LastName) AS Employee,
	IFNULL(E2.EmployeeID,'N'), CONCAT_WS(' ',E2.FirstName,E2.LastName) AS NextEmployee
FROM Employees E1
LEFT JOIN Employees E2
ON E1.EmployeeID + 1 = E2.EmployeeID;

SELECT 
C.CustomerName, S.SupplierName,
C.City, C.Country
FROM Customers C
LEFT JOIN Suppliers S
ON C.City = S.City AND C.Country = S.Country;

SELECT
	IFNULL(S.SupplierName, '-- NO SUPPLIER --'),
    IFNULL(C.CustomerName, '-- NO CUSTOMER --'),
	IFNULL(C.City, S.City),
	IFNULL(C.Country, S.Country)
FROM Customers C
LEFT JOIN Suppliers S
ON C.City = S.city AND C.Country = S.Country;

SELECT
	E1.LastName, E2.FirstName
FROM Employees E1
CROSS JOIN Employees E2
ORDER BY E1.EmployeeID;
