
-- 練習: 執行SQL指令

CREATE DATABASE testDB;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)    
VALUES ('101', 'Erichsen', 'Tom', 'Street no-21', 'New York');  

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)    
VALUES ('102', 'Johnson', 'Marry', 'Old Street Road-43', 'California');

-- CREATE DATABASE 資料來源： https://www.w3schools.com/mysql/mysql_create_db.asp
-- CREATE TABLE 資料來源： https://www.w3schools.com/mysql/mysql_create_table.asp
-- INSERT INTO 資料來源： https://www.c-sharpcorner.com/blogs/different-methods-of-sql-queries-to-insert-data-in-tables
 