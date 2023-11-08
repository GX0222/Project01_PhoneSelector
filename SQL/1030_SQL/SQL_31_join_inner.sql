

-- MySQL Joins
-- https://www.w3schools.com/mysql/mysql_join.asp



--10. 觀察 Orders 和 OrderDetails 資料表，兩張資料表內各自存放了什麼資料？
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

複合式主鍵

--11. 如果想要知道客戶有多少訂單，在哪一個資料表裡面？
SELECT CustomerID, COUNT(*) FROM Orders 
GROUP BY CustomerID;


--12. 如果想要知道一張明細的金額小計，在哪一個資料表裡面？
--問題：訂單總金額是否有被記錄下來？



--13. 如何找到有包含折扣的訂單？
--    以及有幾種折扣？
SELECT * FROM OrderDetails WHERE Discount != 0;
SELECT * FROM OrderDetails WHERE 
SELECT DISTINCT Discount FROM OrderDetails; 

------------------------------------------------

-- ALTER 編輯前要三思!!!!!!!!!!!
ALTER TABLE orderdetails 
MODIFY column Discount DOUBLE(8,1);

------------------------------------------------

-- 東西放不進去，有可能是格式問題
UPDATE orderdetails SET discount = 0.3 
where orderid = 10248 and productid = 11;

------------------------------------------------

SELECT *, UnitPrice*Quantity*(1-Discount) 小計
FROM orderdetails;


--20. 訂單編號 10847 一共購買了幾個產品？
--21. 延續 20. 該如何得知產品名稱？

SELECT * FROM orderdetails;
SELECT * FROM products;

----------------------------------------------------------------

-- JOIN()把表單連結起來
SELECT * FROM OrderDetails
JOIN products ON orderdetails.productid = products.productid;

SELECT * FROM OrderDetails od
JOIN products p ON od.productid = p.productid;

-- JOIN 前面沒加東西，預設為 INNER JOIN
SELECT * FROM OrderDetails od
INNER JOIN products p ON od.productid = p.productid;


--22. 透過 join 語法，把需要的資料表連接再一起
--   需要的欄位：訂單編號、產品名稱、單價、數量、折扣、小計 等
SELECT orderid, ProductName, od.UnitPrice, od.Quantity, od.Discount
, od.UnitPrice*od.Quantity*(1-od.Discount) 小計
FROM OrderDetails od
INNER JOIN products p ON od.productid = p.productid;
