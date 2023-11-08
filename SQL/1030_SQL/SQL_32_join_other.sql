

-- MySQL Joins
-- https://www.w3schools.com/mysql/mysql_join.asp



--10. 我們想要找註冊以後卻從未下過訂單的客戶，進行行銷動作，該如何挑選對應資料？
--	先用統計的方式進行資料確認，再進行比對動作
SELECT o.customerid, c.customerid
FROM orders o
JOIN customers c ON o.customerid = c.customerid;

SELECT DISTINCT o.customerid, DISTINCT c.customerid
FROM orders o
JOIN customers c ON o.customerid = c.customerid;

SELECT DISTINCT o.customerid, c.customerid
FROM orders o
RIGHT JOIN customers c ON o.customerid = c.customerid 
WHERE o.CustomerID is NULL 
ORDER BY o.CustomerID;


--20. "假設" 北風資料庫中，產品資料表(Products) 和 產品類別資料表(Categories) 目前沒有關聯
--	如果每一個產品類別都包含所有於產品資料表的品項，該如何得到這樣的資料?
SELECT * FROM Products;
SELECT * FROM Categories;

SELECT * FROM Products CROSS JOIN Categories;


--30. 觀察 Employees 資料表可以知道，員工的主管也包含在其中；
--	請幫忙整理出員工以及員工的主管姓名
SELECT A.employeeid, A.firstname, A.reportsto, B.FirstName FROM
(SELECT e.employeeid, e.firstname, e.reportsto FROM Employees e) A
LEFT join (SELECT e.employeeid, e.firstname FROM Employees e) B 
on A.reportsto = B.employeeid;

