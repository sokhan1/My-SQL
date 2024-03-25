SELECT CustomerName AS Name, City, Country, 'Customer'
FROM Customers
UNION
SELECT SupplierName AS Name, City, Country, 'Supplier'
FROM Suppliers
ORDER BY Name;

SELECT CategoryID AS ID FROM Categories
WHERE CategoryID > 4
UNION
SELECT EmployeeID AS ID FROM Employees
WHERE EmployeeID % 2 = 0;

SELECT CategoryID AS ID FROM Categories
WHERE CategoryID > 4
UNION ALL
SELECT EmployeeID AS ID FROM Employees
WHERE EmployeeID % 2 = 0;

SELECT CategoryID AS ID
FROM Categories C, Employees E
WHERE
	C.CategoryID > 4
    AND E.EmployeeID % 2 = 0
    AND C.CategoryID =E.EmployeeID;

SELECT CategoryID AS ID
FROM Categories
WHERE
	CategoryID > 4
    AND CategoryID NOT IN(
		SELECT EmployeeID
        FROM Employees
        WHERE EmployeeID % 2 = 0
    )

SELECT ID FROM (
	SELECT CategoryID AS ID FROM Categories
    WHERE CategoryID > 4
    UNION ALL
    SELECT EmployeeID AS ID FROM Employees
    WHERE EmployeeID % 2 = 0)
    AS Temp
GROUP BY ID HAVING COUNT(*) = 1 ;
