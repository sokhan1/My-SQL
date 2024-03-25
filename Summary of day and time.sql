SELECT CURDATE(), CURTIME(), NOW();

SELECT
'2023-6-1' = '2023-06-01',
DATE('2023-6-1')=DATE('2023-06-01'),
'1:2:3' = '01:02:03',
TIME('1:2:3')=TIME('01:02,03');

SELECT * FROM Orders
WHERE
	OrderDate BETWEEN DATE('1997-1-1') AND DATE('1997-1-31');

SELECT
 OrderDate,
 YEAR(OrderDate) AS YEAR,
 MONTHNAME(OrderDate) AS MONTHNAME,
 MONTH(OrderDate) AS MONTH,
 WEEKDAY(OrderDate) AS WEEKDAY,
 DAYNAME(OrderDate) AS DAYNAME,
 DAY(OrderDate) AS DAY
FROM Orders;

SELECT
	OrderDate,
    CONCAT(
		CONCAT_WS(
        '/',YEAR(OrderDate), MONTH(OrderDate), DAY(OrderDate)),
        ' ',UPPER(LEFT(DAYNAME(OrderDate,3)))
        )
FROM Orders;

SELECT * FROM Orders
WHERE WEEKDAY(OrderDate) = 0;

SELECT
	HOUR(NOW()),MINUTE(NOW()),SECOND(NOW());

SELECT
	ADDDATE('2021-06-20',INTERVAL 1 YEAR),
    ADDDATE('2021-06-20', INTERVAL -2 MONTH);

SELECT
	OrderDate,
	ADDDATE(OrderDate,INTERVAL 1 YEAR),
    ADDDATE(OrderDate, INTERVAL -2 MONTH)
FROM Orders;

SELECT
	OrderDate,
	NOW(),
	DATEDIFF(OrderDate, NOW())
FROM Orders;

SELECT * FROM Orders
WHERE
	ABS(DATEDIFF(OrderDate, '1996-10-10'))<5;

SELECT
	OrderDate,
    LAST_DAY(OrderDate),
    DAY(LAST_DAY(OrderDate)),
    DATEDIFF(LAST_DAY(OrderDate),OrderDate)
FROM Orders;

SELECT REPLACE(
REPLACE(DATE_FORMAT(NOW(), '%y년 %m월 %d일 %p %h시 %i분 %초' ),
'AM', '오전'),'PM','오후'
)
FROM Orders;

SELECT
	OrderDate,
    DATEDIFF(
    STR_TO_DATE('1997-01-01 13:24:35','%Y-%m-%d-%T'),
    OrderDate),
    TIMEDIFF(STR_TO_DATE('1997-01-01 13:24:35','%Y-%m-%d-%T'),
    OrderDate)
    FROM Orders;

SELECT
	Price,
    IF(Price > 30, 'Expensive','Cheap') AS simple,
    CASE
		WHEN Price < 20 THEN 'low'
        WHEN Price BETWEEN 20 AND 30 THEN 'normal'
        ELSE 'high'
	END AS complicated
FROM Products;

SELECT
	IFNULL('A','B'),
    IFNULL('NULL','B');
