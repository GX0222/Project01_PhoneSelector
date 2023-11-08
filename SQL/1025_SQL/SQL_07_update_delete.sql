

-- MySQL UPDATE Statement
-- https://www.w3schools.com/MySQL/mysql_update.asp
-- 
-- MySQL DELETE Statement
-- https://www.w3schools.com/MySQL/mysql_delete.asp
-- 
-- MySQL DROP TABLE Statement
-- https://www.w3schools.com/MySQL/mysql_drop_table.asp



--10. 透過語法建立資料表
--	  確認所選取的資料庫為 Lab 後，貼上底下程式碼執行

    create table lab07
    (
        CategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        AvgPrice DECIMAL(5,2) NULL,  -- 共5位，2位小數
        Memo varchar(50) NULL,
        UpdateDate datetime NULL
    );

    insert into lab07 (AvgPrice) values (37.9791);
    insert into lab07 (AvgPrice) values (23.0625);
    insert into lab07 (AvgPrice) values (25.16);
    insert into lab07 (AvgPrice) values (28.73);
    insert into lab07 (AvgPrice) values (20.25);
    insert into lab07 (AvgPrice) values (54.0066);
    insert into lab07 (AvgPrice) values (32.37);
    insert into lab07 (AvgPrice) values (20.6825);

    select * from lab07;    


--20. 更新異動日期欄位 UpdateDate，執行後有多少資料被異動了？
UPDATE lab07 SET UpdateDate = NOW();

--21. 更新 類別編號 為1號的平均單價為 10 元
UPDATE lab07 SET AvgPrice=3333 WHERE CategoryID = 1

--29. delete 特定資料
DELETE FROM lab07 WHERE CategoryID = 1;

--30. 執行 delete 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化
INSERT INTO lab07 (AvgPrice) VALUES (123.45);
DELETE FROM lab07;
INSERT INTO lab07 (AvgPrice) VALUES (123.45);



--31. 執行 truncate 資料表指令 ，然後再次重新新增資料
--	   觀察流水號的變化
INSERT INTO lab07 (AvgPrice) VALUES (123.45);
TRUNCATE TABLE lab07;
INSERT INTO lab07 (AvgPrice) VALUES (123.45);

--32. 執行 drop 資料表指令 ，然後再次重新新增資料
--	  觀察流水號的變化
DROP TABLE lab07;    -- 整個 TABLE 全部刪掉