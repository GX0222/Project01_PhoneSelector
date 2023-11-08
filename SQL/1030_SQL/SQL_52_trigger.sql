

-- 23.3.1 Trigger Syntax and Examples
-- https://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html
-- https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html



-- 10. 設計一個 TRIGGER
--  讓使用者在異動產品資料前，寫一份LOG紀錄

create table Lab_Log(
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Before_Apple int,
    After_Apple int,
    Date_Cat datetime default now()
)

insert into Lab_Log (Before_Apple, After_Apple) values (111, 222);

-- 搬資料
create table Lab_products like Northwind.products;
insert  into Lab_products select * from Northwind.products;

-- 官方
CREATE TRIGGER ins_sum BEFORE INSERT ON account FOR EACH ROW
-- 結構
CREATE TRIGGER 名稱 時機 動作/事件 ON 資料表 FOR EACH ROW
     名稱: 自訂
     時機: BEFORE / AFTER
動作/事件: INSERT UPDATE DELETE
   資料表: 一個存在資料庫的資料表名稱

-- 請機器人「監看」 Lab_products 資料表
-- 當發生指定事情的時候，去 寫入一筆 log
-- OLD: 異動前
-- NEW: 異動後
CREATE TRIGGER TR_TEST BEFORE UPDATE ON Lab_products FOR EACH ROW
    insert into Lab_Log 
    (Before_Apple, After_Apple) 
    values 
    (OLD.unitPrice, NEW.unitPrice );

-- 目前一號產品18元。
select productid, unitPrice  from Lab_products  where productid = 1
-- 執行 update 為了觸發 TR_TEST
update Lab_products set unitPrice = 77  where productid = 1





