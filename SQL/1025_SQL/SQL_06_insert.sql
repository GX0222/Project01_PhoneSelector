

-- MySQL INSERT INTO Statement
-- https://www.w3schools.com/MySQL/mysql_insert.asp
-- 
-- MySQL ALTER TABLE Statement
-- https://www.w3schools.com/MySQL/mysql_alter.asp

INSERT INTO shop (shop_name) VALUES ("得正公益");
--> #1364 - Field 'shop_address' doesn't have a default value

INSERT INTO shop (shop_name,shop_address) VALUES ("得正公益","台中市南屯區公益路二段51號18樓");
--> #1364 - Field 'shop-phone' doesn't have a default value

INSERT INTO shop (shop_name,shop_address,shop_capital,shop_phone) 
VALUES ("得正公益","台中市南屯區公益路二段51號18樓",88,"0988777666");
--> 成功，ID因為有設自動增值，所以可以不用給資料

INSERT INTO shop (shop_id,shop_name,shop_address,shop_capital,shop_phone) 
VALUES (7,"得正公益","台中市南屯區公益路二段51號18樓",88,"0988777666");
--> 若7沒有重複則可以成功
--  下一個會從7+1


--10. 透過語法建立資料表
--	 確認所選取的資料庫為 Lab 後，貼上底下程式碼執行

    create table lab06
    (
        ProductID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        ProductName varchar(5),
        Price int NULL
    );

    select * from lab06;


--11. 透過語法新增資料，當資料欄位被定義為 AUTO_INCREMENT ，是否能再透過指令新增？
INSERT INTO lab06 (ProductID)
VALUES (99);

--12. 透過語法新增一筆價格為 100 的資料，觀察 ProductID
INSERT INTO lab06 (Price) VALUES (100);


--20. 建立資料表與部分資料後，如何透過語法增加欄位？ 
--    => 例如增加新增日期 CreateDate
ALTER TABLE lab06 ADD CreateDate DATETIME

--21. 增加以後再重新撈資料庫的資料
--    先前的資料列中， CreateDate 欄位是否會有值? 


--22. 再追加一個有預設值的欄位，例如異動時間 UpdateDate
--    先前的資料列中， UpdateDate 欄位是否會有值? 
ALTER TABLE lab06 ADD UpdateDate DATETIME
DEFAULT NOW();

--28. 新增時若欄位順序沒有一致，是否會引發錯誤訊息？
INSERT INTO lab06 (Price,CreateDate) VALUES (NOW(),499);
--> #1264 - Out of range value for column 'Price' at row 1

INSERT INTO lab06 (Price,ProductName) VALUES (499,"STARBURSTSTREAM");
--> #1406 - Data too long for column 'ProductName' at row 1

--30. insert 語法介紹完畢後，請練習寫入 shop 和 shop_employee
--  * 觀察資料寫入時 PK、FK、default、check 等設定如何發揮影響

-- 測試 PRIMARY KEY
-- PRIMARY KEY 不能重複，所以只要丟重複的值就可以測試
INSERT INTO shop_employee (emp_id) VALUES (1);

-- 測試 FOREIGN KEY
-- FOREIGN KEY 要連到另一個表格，所以選擇另一表格沒有的值就可以測試
INSERT INTO shop_employee (shop_id) VALUES shop(shop_xx);

--------------------------------------------------
CREATE TABLE `shop_employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(26) DEFAULT NULL,
  `emp_gender` char(1) DEFAULT NULL,
  `emp_age` tinyint(4) DEFAULT NULL,
  `emp_phone` char(10) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `shop_employee_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
--------------------------------------------------