

-- MySQL Functions
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp
-- 
-- Chapter 12 Functions and Operators
-- https://dev.mysql.com/doc/refman/8.0/en/functions.html



--10. CAST()、 CONVERT()
SELECT CAST('2017-08-28' AS DATE);

SELECT CONVERT("2017-08-29", DATE);

-- 故意給錯的日期，會回傳 NULL 但不會顯示錯誤訊息

SELECT CAST('2017-08-87' AS DATE);

SELECT CONVERT("2017-08-87", DATE);

------------------------------------------------

-- CAST()、CONVERT() 有限定轉換的格式
SELECT CAST('2017-08-11' AS DATETIME);    -- 會補零
SELECT CAST('2017-08-11' AS VARCHAR);     -- X
SELECT CAST('2017-08-11' AS INT);         -- X


--20. DATE_FORMAT()
-- 想獲得 2023 / 11 / 02
-- 格式    %Y  / %m / %d
SELECT DATE_FORMAT(NOW(), "%Y/%m/%d");   -- 後面%代碼查表
