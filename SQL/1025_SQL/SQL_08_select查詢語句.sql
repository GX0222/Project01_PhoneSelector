

-- MySQL SELECT Statement
-- https://www.w3schools.com/MySQL/mysql_select.asp
-- 
-- SELECT Statement
-- https://dev.mysql.com/doc/refman/8.0/en/select.html


--10. 練習：指定需要使用的資料庫
USE TABLES;

--20. 定義並查看變數
var x = 10 ;
console.log(x);
----------
SET @x = 10;
SELECT @x;

--30. select 語法結構練習
SELECT 'APPLE';
SELECT 999;
SELECT 10/3;
SELECT 10 DIV 3;  -- 整除

-- ** 底下使用 northwind 北風資料庫 ** 

--40. 以供應商資料表(suppliers)為例子，練習挑選聯絡資訊等欄位
    -- 挑全部
    SELECT * FROM suppliers;
    -- 挑資料要有「情境」，老闆要「電訪」供應商
    SELECT CompanyName,ContactName,ContactTitle,Phone,Fax FROM suppliers;


-- CREATE TABLE `suppliers` (
--   `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
--   `CompanyName` varchar(40) NOT NULL,
--   `ContactName` varchar(30) DEFAULT NULL,
--   `ContactTitle` varchar(30) DEFAULT NULL,
--   `Address` varchar(60) DEFAULT NULL,
--   `City` varchar(15) DEFAULT NULL,
--   `Region` varchar(15) DEFAULT NULL,
--   `PostalCode` varchar(10) DEFAULT NULL,
--   `Country` varchar(15) DEFAULT NULL,
--   `Phone` varchar(24) DEFAULT NULL,
--   `Fax` varchar(24) DEFAULT NULL,
--   `HomePage` mediumtext,
--   PRIMARY KEY (`SupplierID`),
--   KEY `CompanyName` (`CompanyName`),
--   KEY `PostalCode` (`PostalCode`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8


--41. 欄位別名，觀察將兩個欄位合併後，查詢結果該欄位是否還有名稱？
--    => 以合併供應商資料表的國家(Country)-城市(City)為例子
----- 一整排0 -----
SELECT Country,City FROM suppliers;
SELECT Country+City FROM suppliers;
SELECT Country + "_" + City FROM suppliers;
----- 一整排0 -----

-- MySQL 有一個 CONCAT函式，用來合併資料行
SELECT CONCAT(Country,City) FROM suppliers;
-- ### 可隨意換掉
SELECT CONCAT(Country,"###",City) FROM suppliers;

-- 給別名(暫存變數)，XXX可隨意替換
-- 1. 合併資料行
SELECT CONCAT(Country,"###",City) AS XXX FROM suppliers;
SELECT CONCAT(Country,"###",City) AS 'XXX' FROM suppliers;
SELECT CONCAT(Country,"###",City) AS "XXX" FROM suppliers;
SELECT CONCAT(Country,"###",City) AS `XXX` FROM suppliers;
SELECT CONCAT(Country,"###",City) XXX FROM suppliers;

-- 2. 資料行換名字呈現
SELECT City AS XXX FROM suppliers;


--42. 供應商來自那些國家？
--    => 如何取得不重複的清單？
    -- 29筆資料
    SELECT Country FROM suppliers;

    -- 16筆不重複的資料
    SELECT DISTINCT Country FROM suppliers;

    -- 29筆資料
    SELECT DISTINCT Country,City FROM suppliers;


--50. 挑選指定的欄位進行排序
SELECT CompanyName,ContactName,ContactTitle,Phone,Fax 
FROM suppliers ORDER BY CompanyName;

--60. 指定資料表回傳的 開始資料列 以及 資料筆數
SELECT * FROM suppliers LIMIT 10;
SELECT * FROM suppliers LIMIT 10 OFFSET 10;

