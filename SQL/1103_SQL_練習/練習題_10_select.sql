
-- ** 請練習撰寫底下指令 **
-- ** 使用 Products 產品資料表 ** 
-- ** 請確認打開的是 Northwind 資料庫 ** 



-- 110 挑選 所有 產品資料

SELECT * FROM Products;


-- 115 挑選 所有 產品資料，並用產品名稱排序

SELECT * FROM Products ORDER BY ProductName;


-- 120 挑選 指定欄位：ProductID, ProductName, UnitPrice

SELECT ProductID, ProductName, UnitPrice FROM Products;


-- 125 延續上題，請將欄位名稱改成以中文 產品編號, 產品名稱, 單價 顯示

SELECT ProductID 產品編號, 
ProductName 產品名稱,
 UnitPrice 單價 FROM Products;


-- 130 挑選 庫存量低於再訂購量 的產品資料

SELECT * FROM Products WHERE UnitsInStock < Reorderlevel;


-- 140 挑選 庫存量+在途數 低於再訂購量的產品資料

SELECT * FROM Products 
WHERE (UnitsInStock + UnitsOnOrder) < Reorderlevel;


-- 150 挑選 產品名稱 包含 ku 的資料

SELECT ProductName FROM Products
WHERE  ProductName LIKE "%ku%";


-- 160 挑選 類別編號 (CategoryID) 為 1, 4, 8 的產品資料
--     並依照 類別編號 和 產品名稱 排序

SELECT CategoryID FROM Products
WHERE (CategoryID in (1,4,8)) 
ORDER BY  ProductName and CategoryID;


-- 170 挑選 單價 介於 15 到 20 元之間(包含 15, 20)的產品資料
--     並且按照 單價 由大到小排序

SELECT * FROM Products
WHERE UnitPrice BETWEEN 15 and 20
ORDER BY UnitPrice DESC;
