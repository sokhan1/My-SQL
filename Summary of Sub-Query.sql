SELECT
	CategoryID, CategoryName, Description,
    (SELECT ProductName FROM Products WHERE ProductID = 1)
FROM Categories;

SELECT * FROM Products
WHERE Price < (
SELECT AVG(Price) FROM Products
);

SELECT
	CategoryID, CategoryName, Description
FROM Categories
WHERE
CategoryID = 
(SELECT CategoryID FROM Products
WHERE ProductName = 'Chais' );

SELECT
	CategoryID, CategoryName, Description
FROM Categories
WHERE
CategoryID IN
(SELECT CategoryID FROM Products
WHERE Price > 50  );

SELECT * FROM Products
WHERE Price > ALL(
SELECT Price FROM Products
WHERE CategoryID = 2);

SELECT * FROM Products
WHERE CategoryID = ANY (
SELECT CategoryID FROM Products
WHERE Price > 50);

SELECT 
	ProductID, ProductName,
    (SELECT CategoryName FROM Categories C
    WHERE C.categoryID = P.CategoryID
    ) AS CategoryName
FROM Products P;

SELECT
	SupplierName, Country, City,
    (
		SELECT COUNT(*) FROM Customers C
        WHERE C.Country = S.Country
	) AS CustomerInTheCountry,
    (
		SELECT COUNT(*) FROM Customers C
        WHERE C.Country = S.Country
			AND C.City = S.City
	) AS CustomerInTheCountry
FROM Suppliers S;

SELECT
	CategoryID, CategoryName,
    (
		SELECT MAX(Price) FROM Products P
        WHERE P.categoryID = C.categoryID
	) AS MaximumPrice,
    (
		SELECT AVG(Price) FROM Products P
        WHERE P.CategoryID = C.CategoryID
	) AS AveragePrice
FROM Categories C;

SELECT
	ProductID, ProductName, CategoryID, Price,
    (SELECT AVG(Price) FROM Products P2
    WHERE P2.categoryID = P1.CategoryID) AS AVG
FROM Products P1
WHERE Price < (
	SELECT AVG(Price) FROM Products P2
    WHERE P2.CategoryID = P1.CategoryID
	);

SELECT
	CategoryID, CategoryName
FROM Categories C
WHERE EXISTS(
	SELECT * FROM Products P
    WHERE P.CategoryID = C.CategoryID
    AND P.Price > 80
    );

SELECT
	CategoryID, CategoryName
    ,(SELECT MAX(P.Price) FROM Products P
    WHERE P.CategoryID = C.CategoryID) AS MaxPrice
FROM Categories C
WHERE EXISTS(
	SELECT * FROM Products P
    WHERE P.CategoryID = C.CategoryID
    AND P.Price > 80
    );
