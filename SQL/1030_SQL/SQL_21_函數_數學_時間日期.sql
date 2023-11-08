

-- MySQL Functions
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp



--11. ABS() 取絕對值
--12. POWER(數值, N次方)
--14. ROUND() 小數點四捨五入
SELECT ABS(3-5);            -- 2
SELECT POWER(3,3);          -- 27
SELECT ROUND(1.234567,2);   -- 1.23

--20. 如何取得系統時間？
SELECT NOW();
SELECT SYSDATE();
SELECT CURDATE();
SELECT CURRENT_DATE();

SELECT NOW(),SYSDATE(),CURDATE(),CURRENT_DATE();


--22. 透過 Year() 取得日期中的「年」
--23. 透過 Month() 取得日期中的「月」
SELECT Year(NOW()),Month(NOW());

--30. 如何取得 北風資料庫中， 7 月份的訂單
SELECT OrderID,OrderDate FROM orders;

SELECT OrderID,OrderDate,Month(OrderDate) FROM orders;

SELECT OrderID,OrderDate,Month(OrderDate) FROM orders
WHERE Month(OrderDate) = 7 AND Year(OrderDate) = 1997;


--31. 直接用字串取去比較是否可行？
    -- 目標: 搜尋 1996年7月10號  到 1996年7月20號 => 預計獲得9筆訂單
    -- 方法A: 不使用字串搜尋
    SELECT OrderID,OrderDate,Month(OrderDate) FROM orders
    WHERE Year(OrderDate) = 1996 AND Month(OrderDate) = 7 
    AND (Day(OrderDate) BETWEEN 10 AND 20);
    
    -- 方法B: 使用字串搜尋
    SELECT OrderID,OrderDate FROM orders
    WHERE OrderDate BETWEEN "1996/07/10" AND "1996-07-20";    -- 隨便放「-」、「/」欸
    
    -- 方法C: LIKE
    SELECT OrderID,OrderDate FROM orders
    WHERE (OrderDate LIKE "1996-07-1%") OR (OrderDate LIKE "1996-07-20%");

    -- 方法D: 函數轉換 (-、/不能亂放了)
    SELECT OrderID,OrderDate FROM orders
    WHERE DATE_FORMAT(OrderDate,'%Y/%m/%d') BETWEEN "1996/07/10" AND "1996/07/20";


--32. 請透過語法於 Lab 資料庫中建立一個資料表，並寫入今天日期
CREATE TABLE Lab21 (
  myid int PRIMARY KEY,
  apple datetime
)

INSERT INTO Lab21 (myid,apple) VALUES (1,SYSDATE());
INSERT INTO Lab21 (myid,apple) VALUES (2,CURDATE());

--33. 是否可以透過字串查詢的到今天的日期？
-- 日期 跟 字串 做比較
SELECT * FROM Lab21 WHERE apple = "2023-10-31";       -- =>X
SELECT * FROM Lab21 WHERE apple LIKE "2023-10-31%";    -- =>O







CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` varchar(5) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `RequiredDate` datetime DEFAULT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `ShipVia` int(11) DEFAULT NULL,
  `Freight` decimal(10,4) DEFAULT '0.0000',
  `ShipName` varchar(40) DEFAULT NULL,
  `ShipAddress` varchar(60) DEFAULT NULL,
  `ShipCity` varchar(15) DEFAULT NULL,
  `ShipRegion` varchar(15) DEFAULT NULL,
  `ShipPostalCode` varchar(10) DEFAULT NULL,
  `ShipCountry` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `OrderDate` (`OrderDate`),
  KEY `ShippedDate` (`ShippedDate`),
  KEY `ShipPostalCode` (`ShipPostalCode`),
  KEY `FK_Orders_Customers` (`CustomerID`),
  KEY `FK_Orders_Employees` (`EmployeeID`),
  KEY `FK_Orders_Shippers` (`ShipVia`),
  CONSTRAINT `FK_Orders_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `FK_Orders_Employees` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `FK_Orders_Shippers` FOREIGN KEY (`ShipVia`) REFERENCES `shippers` (`ShipperID`)
) ENGINE=InnoDB AUTO_INCREMENT=11078 DEFAULT CHARSET=utf8