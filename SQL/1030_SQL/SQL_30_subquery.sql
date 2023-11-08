

-- 13.2.11 Subqueries
-- https://dev.mysql.com/doc/refman/8.0/en/subqueries.html



--10. 目前訂單編號 10847 中 有六個產品編號 1,19,37,45,60,71
--    a. 透過  in (..)  的方式，在產品資料表中取得產品資料
--    b. 透過  子查詢   的方式，在產品資料表中取得產品資料
SELECT * FROM orders WHERE OrderID = 10847;
SELECT * FROM orderdetails WHERE OrderID = 10847;

SELECT * FROM products;

-- 1. in
SELECT * FROM products WHERE ProductID in (1,19,37,45,60,71);

-- 2. 子查詢 SELECT ... IN (SELECT ...)
SELECT * FROM products WHERE ProductID 
in (SELECT ProductID FROM orderdetails WHERE OrderID = 10847);


--20. 產品資料表中，所有產品的平均單價為何？
SELECT AVG(unitPrice) FROM products;    -- => 28.86


--21. 如何得知每一項產品與平均單價差異多少？ 
SELECT ProductID, unitPrice, 
(SELECT AVG(unitPrice) FROM products) AS 平均, 
(unitPrice-(SELECT AVG(unitPrice) FROM products)) 價差 
FROM products;

--30. 檢查是否所有訂單的產品編號都來自產品資料表中？
--  製作測試資料
CREATE TABLE lab301 ( ProductID int );
CREATE TABLE lab302 ( OrderID char(1),  ProductID int);

INSERT INTO  lab301 (ProductID) VALUES (1);
INSERT INTO  lab301 (ProductID) VALUES (2);
INSERT INTO  lab301 (ProductID) VALUES (3);

INSERT INTO  lab302 (OrderID, ProductID) VALUES ('A', 1);
INSERT INTO  lab302 (OrderID, ProductID) VALUES ('B', 98);
INSERT INTO  lab302 (OrderID, ProductID) VALUES ('C', 99);

SELECT * FROM lab301;
SELECT * FROM lab302;

-------------------------------------------------------------------

-- 找出不同的資料
SELECT *, (SELECT * FROM lab301) FROM lab302 
WHERE ProductID NOT in (SELECT ProductID FROM lab301);

SELECT *
FROM lab302 A 
LEFT JOIN lab301 B ON A.ProductID = B.ProductID;