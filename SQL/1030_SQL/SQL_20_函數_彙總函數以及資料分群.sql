

-- MySQL GROUP BY Statement
-- https://www.w3schools.com/mysql/mysql_groupby.asp
-- 
-- MySQL HAVING Clause
-- https://www.w3schools.com/mysql/mysql_having.asp
-- 
-- MySQL Functions
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp
-- 
-- Chapter 12 Functions and Operators
-- https://dev.mysql.com/doc/refman/8.0/en/functions.html


--10. 統計供應商資料表中有幾個供應商？
SELECT * FROM Suppliers;

SELECT COUNT(*) FROM Suppliers;

SELECT COUNT(*) AS total_Suppliers FROM Suppliers;


--11. count() 是否有統計到 null ?
SELECT COUNT(SupplierID) FROM Suppliers;

-- 排序 NULL 到最後面
SELECT COUNT(Region) FROM Suppliers;
SELECT COUNT(Region) FROM Suppliers ORDER BY Region DESC;

-- 不重複的
SELECT COUNT(DISTINCT Region) FROM Suppliers;


--13. 統計每個地區 (Region)有多少供應商
--    問題：Null 是否會自己形成一個群組？
SELECT Region,COUNT(*) FROM Suppliers GROUP BY Region;

--15. 統計供應商來自那些國家 (Country)
--	  透過 group by 語法 分組彙總
SELECT Country,COUNT(*) FROM Suppliers GROUP BY Country;

SELECT Country,COUNT(*) FROM Suppliers GROUP BY Country ORDER BY COUNT DESC;
-- #1054 - Unknown column 'COUNT' in 'order clause'

SELECT Country,COUNT(*) AS XX FROM Suppliers GROUP BY Country ORDER BY XX DESC;
SELECT Country,COUNT(*) XX FROM Suppliers GROUP BY Country ORDER BY XX DESC;

--21. 如何針對統計結果篩選，我想要找統計後數量大於1的國家？
SELECT Country,COUNT(*) XX FROM Suppliers 
GROUP BY Country HAVING XX > 1 
ORDER BY XX DESC;

SELECT Country,COUNT(*) 'XX' FROM Suppliers 
GROUP BY Country HAVING 'XX' > 1    -- 不可比較 字串 > 1
ORDER BY 'XX' DESC;

--22. having 是否可以使用欄位別名？


--25. 統計後查看數量較多的國家


--30. 平均值 Avg() 函式 的使用
SELECT AVG(1+2);

SELECT AVG(SupplierID) FROM Suppliers;


CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(40) NOT NULL,
  `ContactName` varchar(30) DEFAULT NULL,
  `ContactTitle` varchar(30) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `Region` varchar(15) DEFAULT NULL,
  `PostalCode` varchar(10) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Phone` varchar(24) DEFAULT NULL,
  `Fax` varchar(24) DEFAULT NULL,
  `HomePage` mediumtext,
  PRIMARY KEY (`SupplierID`),
  KEY `CompanyName` (`CompanyName`),
  KEY `PostalCode` (`PostalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8