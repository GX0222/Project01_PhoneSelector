-- PM 16:10
UPDATE orderdetails 
   SET Discount = 0.3 
 WHERE OrderID = 10248 AND ProductID = 11;

ALTER TABLE orderdetails MODIFY COLUMN Discount DOUBLE(8,1);


-- PM 14:11 
SELECT ProductID, unitPrice, '28.86', unitPrice-28.86 FROM products

-- AM 10:50
    -- 1. 請描述 ELT() 函數/函式/方法
    -- 2. 請自己寫一個範例

-- AM 10:00

    -- 1. 目標資料表是哪一個？
    -- 2. 真的有數量大於100的訂單嗎？
    -- 3. IF() 如何使用 (請參考文件說明)
    -- 4. 將 IF() 放在 SELECT 後面
    -- 5. 目標結果：表格中出現數量大於100


-- AM 09:00

    -- 這是週二跳過的一題，採用員工資料表
    -- 這一行是所有SQL的開始
    -- ** 必須要先確認挑選的表格存在 **
    SELECT * FROM employees;

    -- LEFT(資料行名稱or資料本人, 要擷取多少)
    12345  12345
    -- (206)  (71) 
    SELECT EmployeeID,
        LEFT(HomePhone, 5) 
    FROM employees

    -- REPLACE(資料行名稱or資料本人, 目標字串, 替換字串)
    --   原始: (206) 555-9857
    -- 執行後:  206) 555-9857
    SELECT EmployeeID,
        REPLACE(HomePhone, "(", "")
    FROM employees

    -- 從這裡開始底下的每一段SQL都是在「組合」上述的句子
    -- 206)   71)
    SELECT EmployeeID,
        HomePhone,
        REPLACE(   LEFT(HomePhone, 5)   , "(", "")
    FROM employees	

    -- 最終結果
    SELECT EmployeeID, 
        REPLACE( REPLACE( LEFT(HomePhone, 5) , "(", "") , ")", "") 
    FROM employees;