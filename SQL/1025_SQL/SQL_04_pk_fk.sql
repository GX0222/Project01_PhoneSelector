-- MySQL PRIMARY KEY Constraint
-- https://www.w3schools.com/MySQL/mysql_primarykey.asp
-- 
-- MySQL FOREIGN KEY Constraint
-- https://www.w3schools.com/MySQL/mysql_foreignkey.asp
-- 
-- MySQL UNIQUE Constraint
-- https://www.w3schools.com/MySQL/mysql_unique.asp
-- 
-- MySQL AUTO INCREMENT Field
-- https://www.w3schools.com/MySQL/mysql_autoincrement.asp


-- 10. 定義 primary key 主索引鍵
--
-- 目標：設定 shop_employee 和 shop 這兩張資料表的 primary key 
--
-- 方法：
--     a. 介面: 資料表> 結構> 某欄位列> 動作> 更多> 主鍵
-- 
--     b. 介面: 資料表> 結構> 勾選欄位> 表格下方> 主鍵
-- 
--     c. 語法: 參考上方連結 MySQL PRIMARY KEY Constraint

ALTER TABLE shop_employee ADD PRIMARY KEY (emp_id)

-- 20. 定義 foreign key 外部索引鍵
--
-- 目標：設定 shop_employee 資料表的 foreign key 
--
-- 方法：
--     a. 介面: 資料表> 結構> 表格上方> 關聯檢視
--     
--     b. 語法：參考上方連結 MySQL FOREIGN KEY Constraint


ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE shop_employee ADD shop_id int;

ALTER TABLE shop_employee
ADD FOREIGN KEY (shop_id) REFERENCES shop(shop_id);

-- 30. 不允許出現重複值 UNIQUE
-- 
--     a. 介面: 資料表> 結構> 某欄位列> 動作> 更多> 獨一|唯一
--     
--     b. 介面: 資料表> 結構> 勾選欄位> 表格下方> 獨一|唯一
-- 
--     c. 語法: 參考上方連結 MySQL UNIQUE Constraint

ALTER TABLE shop_employee ADD UNIQUE (emp_phone);




