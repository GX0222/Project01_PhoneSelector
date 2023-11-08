

-- MySQL WHERE Clause
-- https://www.w3schools.com/MySQL/mysql_where.asp
-- 
-- MySQL AND, OR and NOT Operators
-- https://www.w3schools.com/MySQL/mysql_and_or.asp
-- 
-- MySQL LIKE Operator
-- https://www.w3schools.com/MySQL/mysql_like.asp
-- 
-- MySQL BETWEEN Operator
-- https://www.w3schools.com/MySQL/mysql_between.asp
-- 
-- MySQL IN Operator
-- https://www.w3schools.com/MySQL/mysql_in.asp



--10. 請挑選國家(Country)來自日本(Japan)的供應商
    SELECT * FROM suppliers WHERE Country = Japan;
    -- #1054 - Unknown column 'Japan' in 'where clause'
    SELECT * FROM suppliers WHERE Country = Country;
    -- 全部(1=1)

    -- 觀察Country是甚麼資料型態
    SELECT * FROM suppliers WHERE Country = 'Japan';

    -- 
    SELECT * FROM suppliers WHERE SupplierID = 1;
    SELECT * FROM suppliers WHERE SupplierID = '1';
    

--15. 請挑選 ContactTitle = 'Sales Manager' 
--    且國家來自 'France' 或者 'Germany'
--    的供應商資料

JS:     A && B  ;  A || B
MySQL:  A and B ;  A or B 

SELECT * FROM suppliers WHERE SupplierID = 1 and SupplierID = 2 ;
SELECT * FROM suppliers WHERE SupplierID = 1 or SupplierID = 2 ;

-----------------------------------------------------

SELECT * FROM suppliers as listx
WHERE (Country='France'  or Country='Germany')
and ContactTitle = 'Sales Manager';
-- 可以用小括弧

-- 用 IN 改寫
SELECT * FROM suppliers as listx
WHERE Country IN ('France','Germany') 
and ContactTitle = 'Sales Manager';


--20. 將資料進行模糊比對
SELECT Country FROM suppliers WHERE Country LIKE "France";
SELECT Country FROM suppliers WHERE Country LIKE "F%";
SELECT Country FROM suppliers WHERE Country LIKE "%F";
SELECT Country FROM suppliers WHERE Country LIKE "%F%";
-- 要搭配%


--25. 練習使用區間的範圍取得
--    => 例如：供應商編號介於 3 到 7 之間的
SELECT * FROM suppliers 
WHERE SupplierID <= 7 AND SupplierID >= 3 ;

SELECT * FROM suppliers 
WHERE SupplierID BETWEEN 3 AND 7 ;


--28. 練習搜尋同一資料行中的多重值
--    => 例如：供應商城市在大阪(Osaka)或東京(Tokyo)
SELECT * FROM suppliers
WHERE City = 'Osaka' OR City = 'Tokyo';

SELECT * FROM suppliers
WHERE City IN ('Osaka','Tokyo');


-- https://learn.microsoft.com/zh-tw/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver16