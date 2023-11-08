---- PM 16:00  mssql 執行順序
https://dev.mysql.com/doc/refman/8.0/en/problems-with-alias.html

--  An alias can be used in a query select list 
--  to give a column a different name. 
--  You can use the alias in GROUP BY, ORDER BY, 
--  or HAVING clauses to refer to the column

Standard SQL disallows references to column aliases 
in a WHERE clause. 
because when the WHERE clause is
evaluated, the column value may not yet have been determined. 
(執行)                                            (決定)
For example, the following query is illegal:


---- PM 13:30
因為找不到mysql 所以提供 mssql
https://learn.microsoft.com/zh-tw/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver16

---- AM 09:00

. 輸入 int 沒有 11 但是 有 11
    UNSIGNED ZEROFILL

--建立資料表
CREATE TABLE TEST01(
    id INT AUTO_INCREMENT PRIMARY KEY,
    TEST_A TINYINT,
    TEST_B TINYINT UNSIGNED,
    TEST_C TINYINT ZEROFILL,
    TEST_D TINYINT UNSIGNED ZEROFILL,
);

-- 查看機器人執行後的結果
SHOW CREATE TABLE TEST01;
CREATE TABLE `test01` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_A` tinyint(4) DEFAULT NULL,
  `TEST_B` tinyint(3) unsigned DEFAULT NULL,
  `TEST_C` tinyint(3) unsigned zerofill DEFAULT NULL,
  `TEST_D` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- 寫入 INSERT INTO 資料表名稱 (欄位/資料行) VALUES (值/資料)
-- 預期: id: 1   TEST_A: 1   TEST_B: 1   TEST_C: 001   TEST_D: 001 
INSERT INTO TEST01 (TEST_A, TEST_B, TEST_C, TEST_D) VALUES (1, 1, 1, 1);

-- 預期=> id: 2   TEST_A: 255   TEST_B:    TEST_C:    TEST_D:  
-- 實際=> #1264 - Out of range value for column 'TEST_A' at row 1
INSERT INTO TEST01 (TEST_A) VALUES (255);

-- 預期=> id: 2     TEST_A:    TEST_B:255    TEST_C:      TEST_D:  
-- 實際=> id: 2     TEST_A:    TEST_B:255    TEST_C:      TEST_D:  
INSERT INTO TEST01 (TEST_B) VALUES (255);

-- 預期=> id: 3     TEST_A:    TEST_B:       TEST_C:255   TEST_D:  
-- 實際=> id: 3     TEST_A:    TEST_B:       TEST_C:255   TEST_D:  
INSERT INTO TEST01 (TEST_C) VALUES (255);

-- 預期=> id: 4     TEST_A:    TEST_B:       TEST_C:      TEST_D:255  
-- 實際=> id: 4     TEST_A:    TEST_B:       TEST_C:      TEST_D:255  
INSERT INTO TEST01 (TEST_D) VALUES (255);


-- OK
INSERT INTO TEST01 (TEST_A) VALUES (-128);
-- 底下三個會出錯
INSERT INTO TEST01 (TEST_B) VALUES (-128);
INSERT INTO TEST01 (TEST_C) VALUES (-128);
INSERT INTO TEST01 (TEST_D) VALUES (-128);

-- 資料表存在，想要修改資料行設定: ALTER TABLE
ALTER TABLE TEST01 ALTER TEST_A SET DEFAULT 0;
ALTER TABLE TEST01 ALTER TEST_B SET DEFAULT 0;
ALTER TABLE TEST01 ALTER TEST_C SET DEFAULT 0;
ALTER TABLE TEST01 ALTER TEST_D SET DEFAULT 0;


-- DEFAULT => 預設 => 再新增的時候沒給值的話就擺上預設值
-- ( 2023.10 + MAMP 當前針對 日期的預設 有點令人意外。 )
INSERT INTO TEST01 (TEST_A) VALUES (99);


. UTF-8
https://stackoverflow.com/questions/30074492/what-is-the-difference-between-utf8mb4-and-utf8-charsets-in-mysql
https://dev.mysql.com/doc/refman/8.0/en/charset-unicode-sets.html


. InnoDB
SHOW ENGINES;
https://dev.mysql.com/doc/refman/8.0/en/mysql-acid.html
https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html