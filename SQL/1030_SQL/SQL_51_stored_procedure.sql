

-- SQL CREATE PROCEDURE Keyword
-- https://www.w3schools.com/sql/sql_ref_create_procedure.asp


-- 13.1.17 CREATE PROCEDURE and CREATE FUNCTION Statements
-- https://dev.mysql.com/doc/refman/5.7/en/create-procedure.html
-- https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html



-- 10. 設計一個 PROCEDURE
--  讓使用者傳入 國家 後，統計國家數量回傳

create table lab_suppliers like Northwind.suppliers;
insert into lab_suppliers select * from Northwind.suppliers;
select * from lab_suppliers;

select supplierid, country from lab_suppliers;

select count(*) from lab_suppliers where country = "Japan";

create PROCEDURE count_country (IN Country varchar(15), OUT Cnt int)
    -- BEGIN
        select count(*) into Cnt
        from lab_suppliers  s
        where s.country = Country;
    -- END

CALL count_country("Japan", @xx);
select @xx;