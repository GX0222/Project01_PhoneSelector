

-- MySQL Functions
-- 【IF()、ELT ()、CASE()、IFNULL()】
-- https://www.w3schools.com/mysql/mysql_ref_functions.asp
-- 
-- Chapter 12 Functions and Operators
-- https://dev.mysql.com/doc/refman/8.0/en/functions.html



--10. 如果訂單數量大於 100，標示為請再次確認
SELECT IF(500<1000,'true','false');

SELECT * FROM orderdetails;
SELECT orderID, IF(Quantity>=100,'請再次確認','') AS SysMsg
FROM orderdetails order by Quantity DESC;


--20. 透過數值清單傳回指定之索引的項目
ELT(N, str1, str2, .......);
-- N 代表索引直，索引後面的資料清單
-- ex: 
    SELECT ELT(3,1,22,333,4444,55,66);    -- =>  333


--30. 統計員工資料表的資料，分類出 70歲以上、60歲以上、59歲以下
SELECT EmployeeID, (YEAR(NOW()) - CAST(YEAR(BirthDate) AS CHAR)) AS 年紀,
CASE    -- 順序很重要
    WHEN (YEAR(NOW()) - CAST(YEAR(BirthDate) AS CHAR)) >= 70 THEN "70歲以上"
    WHEN (YEAR(NOW()) - CAST(YEAR(BirthDate) AS CHAR)) >= 60 THEN "60歲以上"
    ELSE "59歲以下"
END AS 年紀範圍
FROM Employees;


--40. 假如電話簿中有手機、家裡電話、辦公室電話
    -- 這三者欄位可能有些會是空白
    -- 我們想要依照順序挑選，手機優先、家裡電話次之、辦公室電話最末
    -- 請在Lab資料庫加入底下資料表和資料，並練習挑選

-- 1. CASE WHEN
SELECT *,
CASE
    WHEN MobilePhone != 'NULL' THEN MobilePhone
    WHEN HomePhone IS NOT NULL THEN HomePhone
    WHEN OfficePhone != 'NULL' THEN OfficePhone
    ELSE "C8763"
END AS 聯絡電話 FROM lab24;

-- 2. IFNULL()
SELECT ID,
IFNULL(MobilePhone,
    IFNULL(HomePhone,
        IFNULL(OfficePhone,'C8763')
    )
)
AS 聯絡電話 FROM lab24;

-- 3. COALESCE()
SELECT COALESCE(MobilePhone, HomePhone, OfficePhone, "88")
FROM lab24;










-------------------------------------------------------------

    CREATE TABLE lab24(
        ID int AUTO_INCREMENT PRIMARY KEY,
        MobilePhone varchar(10) null,
        HomePhone  varchar(10) null,
        OfficePhone varchar(10) null
    );

    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES ('M1','H1','O1');
    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES ( null,'H2','O2');
    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES ('M3',null,'O3');
    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES ('M4','H4',null);
    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES (null,null,'O5');
    INSERT INTO lab24 (MobilePhone, HomePhone, OfficePhone) VALUES (null,null,null);

    SELECT * FROM lab24;
