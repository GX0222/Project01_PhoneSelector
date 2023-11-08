

-- MySQL Functions
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp
-- 
-- Chapter 12 Functions and Operators
-- https://dev.mysql.com/doc/refman/8.0/en/functions.html



--10. 測試 LENGTH() 與 CHAR_LENGTH() 

--    在實際執行前，請預測產生的資料為何？
    
--    a. 
        select CHAR_LENGTH('abc'), CHAR_LENGTH('a b c'), CHAR_LENGTH('a b c ') ;
    
--    b. 
        select LENGTH('abc'), LENGTH('a b c'), LENGTH('a b c ') ; 



--11. LENGTH() 與 CHAR_LENGTH() 在計算中文和英文是否有所不同？

-- 3 3 6 10     => 算幾個字
SELECT CHAR_LENGTH('大中天'),CHAR_LENGTH('abc'),CHAR_LENGTH('大 中 天 '), CHAR_LENGTH('a b 大 中 天 ');

-- 9 3 12 16    => 算記憶體長度
SELECT LENGTH('大中天'),LENGTH('abc'),LENGTH('大 中 天 '), LENGTH('a b 大 中 天 ');


--15. 測試 資料型態 char 和 varchar
CREATE TABLE lab22 ( id int PRIMARY KEY AUTO_INCREMENT ,v VARCHAR(4), c CHAR(4));
--  放入: #ab#     #ab#
--  預期: #ab#     #ab  #
--  實際: #ab#     #ab#
INSERT INTO lab22 (v, c) VALUES ('ab', 'ab');
--  放入: #cd #     #cd #
--  預期: #cd #     #cd #
--  預期: #cd #     #cd#
INSERT INTO lab22 (v, c) VALUES ('cd ', 'cd ');

SELECT CONCAT('#', v, '#'), CONCAT('#', c, '#') FROM lab22;

-- 技術文件中說明，SELECT 時 CHAR 預設刪除後面的空白，若要開啟要輸入以下指令
SET sql_mode = 'PAD_CHAR_TO_FULL_LENGTH';
SELECT CONCAT('#', v, '#'), CONCAT('#', c, '#') FROM lab22;


--18. 小複習：該如何挑選出 v 欄位中包含空白的資料？
SELECT * FROM lab22 WHERE v LIKE '% %';


--20. 假設員工資料表中 HomePhone 電話()中的號碼為區碼，該如何取得？

--	a. 擷取字串的方法討論
--	b. 找出指定文字的所在位置
SELECT MID('ABCDEFG',1,3);
SELECT SUBSTR('ABCDEFG',1,3);
SELECT SUBSTRING('ABCDEFG',1,3);

-- 很像 indexOf ;從1開始算，若不存在回傳0
SELECT INSTR('ABCDEFG','B');
-------------------------------------------
SELECT EmployeeID, HomePhone, MID(HomePhone,1,7) FROM employees;

SELECT EmployeeID, HomePhone, 
MID(HomePhone,(INSTR(HomePhone,'(')+1),(INSTR(HomePhone,')')-2)) 
FROM employees;



--30. 請調查 LEFT() 和 REPLACE() 的使用方式
-- LEFT(?, ?)
-- REPLACE(?, ?, ?)

-- 目標：請嘗試透過 left() 和 replace() 獲得和 步驟 20 一樣的結果



		

--40. 【小練習】轉出資料時，為了保護資料的安全，

--	希望 LastName 不要全部提供，只顯示前三碼，後面全數改以 * 取代

--	請試著找出這個未知函式，達到需求目的
SELECT LastName, left(LastName,3), REPEAT('*',CHAR_LENGTH(LastName)-3), 
CONCAT(left(LastName,3), REPEAT('*',CHAR_LENGTH(LastName)-3)) 
FROM employees;

-----------------------------
SELECT LastName, 
replace(LastName,SUBSTR(LastName,4,CHAR_LENGTH(LastName)),REPEAT('*',CHAR_LENGTH(LastName)-3)) X
FROM employees;


REPEAT('A','B',x);

