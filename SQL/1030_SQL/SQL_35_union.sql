

-- MySQL UNION Operator
-- https://www.w3schools.com/mySQl/mysql_union.asp



-- 10. 測試 union & union all 語法

-- 10-1. 試試看，將 員工姓名 和 供應商姓名 整理成一份資料表
-- UNION     : 無重複
-- UNION ALL : 有重複

SELECT FirstName FROM employees
UNION
SELECT ContactName FROM suppliers

-------------------------------------

SELECT FirstName FROM employees
UNION ALL
SELECT ContactName FROM suppliers


-- 10-2. 試試看，將 員工編號 和 供應商編號 整理成一份資料表

SELECT employeeid FROM employees
UNION
SELECT supplierid FROM suppliers

-------------------------------------

SELECT employeeid FROM employees
UNION ALL
SELECT supplierid FROM suppliers