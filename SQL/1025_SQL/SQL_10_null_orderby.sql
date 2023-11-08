

-- MySQL NULL Values
-- https://www.w3schools.com/mysql/mysql_null_values.asp
-- 
-- MySQL Operators
-- https://www.w3schools.com/mysql/mysql_operators.asp



--10. 挑選供應商資料中，傳真號碼為空值(NULL)的資料

-- NULL 是個資料行(?)
SELECT * FROM suppliers WHERE Fax = NULL;

--傳真號碼資料行的值為 字串NULL 
SELECT * FROM suppliers WHERE Fax = 'NULL';

--傳真號碼資料行的值為 字串APPLE 
SELECT * FROM suppliers WHERE Fax = 'APPLE';

-- 要用 IS 
SELECT * FROM suppliers WHERE Fax is NULL;


--15. 討論幾種不等於的寫法 != 、 <> 、 not
SELECT * FROM suppliers WHERE SupplierID = 1 ;
SELECT * FROM suppliers WHERE SupplierID != 1 ;
SELECT * FROM suppliers WHERE SupplierID <> 1 ;
SELECT * FROM suppliers WHERE NOT SupplierID = 1 ;

--20. 挑選供應商資料中，傳真號碼不等於 '43844115' 的資料
SELECT * FROM suppliers WHERE (Fax != '43844115' or Fax is NULL) ;


--25. 排序的欄位挑選 Fax 觀察執行結果
--  ASC:小到大(預設)
-- DESC:大到小
SELECT * FROM suppliers ORDER BY Fax DESC;


--30. 別名是否可以在 order by 中使用？
--    別名是否可以在   where  中使用？

-- OK
SELECT SupplierID AS APPLE , Fax FROM suppliers 
ORDER BY APPLE;

------------------------------------------------

--#1054 - Unknown column 'APPLE' in 'where clause'
SELECT SupplierID AS APPLE , Fax FROM suppliers 
WHERE APPLE = 1;



