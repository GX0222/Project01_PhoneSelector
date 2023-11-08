

-- MySQL CREATE DATABASE Statement
-- https://www.w3schools.com/MySQL/mysql_create_db.asp
-- 
-- MySQL CREATE TABLE Statement
-- https://www.w3schools.com/MySQL/mysql_create_table.asp


-- 10. 建立資料庫
-- 
--     . 物件總管> 新增> 資料庫> 
--         資料庫名稱輸入 Lab> 
--         編碼預設 utf8mb4_general_ci > 建立


-- 20. 透過【介面】，建立飲料店員工資料表 shop_employee
-- 
--     . 如果是全新的資料庫，初次點選，會直接在畫面右側進行操作
-- 
--     . 物件總管> lab> 展開> 新增
--         a. 資料表名稱> shop_employee
--         b. 名稱 | 類型 | 長度 依照順序輸入
--         c. 輸入完畢後，選擇 儲存

ENGINE=InnoDB DEFAULT CHARSET=utf8

-- 25. 透過介面產生 shop_employee 資料表的 create 指令碼


-- 30. 透過【指令】，建立飲料店資料表 shop
-- 
--     . CREATE TABLE 資料表名稱 (
--         欄位名稱  資料型態,
--         ...
--     )

CREATE TABLE shop_employee(
    emp_id int,
    emp_name varchar(26),
    emp_gender char(1),
    emp_age tinyint,
    emp_phone char(10)
)