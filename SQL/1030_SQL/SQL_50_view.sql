

-- MySQL Views
-- https://www.w3schools.com/mySQl/mysql_view.asp



-- 10. 先將 Northwind 資料庫的 Employees 搬移至 Lab 資料庫中

create table Lab_Employees like Northwind.Employees;

insert into Lab_Employees select * from Northwind.Employees;


-- 20. 新增 檢視表 v_Employee_Boss 可帶出員工和對應的長官名字
--   複習：self join

select emp.Employeeid, emp.firstname, ifnull(boss.firstname,'BIGBOSS')
from Lab_Employees emp 
left join Lab_Employees boss on emp.reportsto = boss.Employeeid;

create view v_Employee_Boss as 
select emp.Employeeid, emp.firstname, ifnull(boss.firstname,'BIGBOSS')
from Lab_Employees emp 
left join Lab_Employees boss on emp.reportsto = boss.Employeeid;

drop view v_Employee_Boss;

-- 21. 查詢檢視表 v_Employee_Boss

select * from v_Employee_Boss;


-- 30. 更新 Lab_Employees 資料表的資料
--     並查看 檢視表 v_Employee_Boss 是否有改變？ => Y 

update Lab_Employees e set e.firstname = 'kirito' where e.Employeeid = 1;


-- 31. 更新 檢視表 v_Employee_Boss 同一筆資料，是否可以成功？

update v_Employee_Boss e set e.firstname = 'kirito2' where e.Employeeid = 1;
-- #1288 - The target table e of the UPDATE is not updatable
-- VEIW 不可被更新


-- 40. 將訂單明細資料表寫入 Lab 資料庫中

create table lab_orderdetails from Northwind.orderdetails;
insert into lab_orderdetails select * from Northwind.orderdetails;


-- 41. 新增 訂單的檢視表 v_Order_Info ，依照訂單號碼加總總金額

select od.orderid, SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) Total
from lab_orderdetails od group by od.orderid;

create view v_Order_Info as
select od.orderid, SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) Total
from lab_orderdetails od group by od.orderid;


-- 42. 讀取 v_Order_Info 查看是否成功

select * from v_order_info;


-- 43. 試著更新 訂單編號為 10248 的總金額為 999，是否可以成功？

update v_Order_Info set Total = 99999 where orderid = 1;
-- #1288 - The target table v_Order_Info of the UPDATE is not updatable
