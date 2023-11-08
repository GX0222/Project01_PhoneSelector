-- PM 16:20
SELECT LastName, 
       LEFT(LastName, 3),
       REPEAT('*', LENGTH(LastName)-3),
       CONCAT(LEFT(LastName, 3),REPEAT('*', LENGTH(LastName)-3))
  FROM employees;
  

-- PM 16:00
https://stackoverflow.com/questions/17779744/regular-expression-to-get-a-string-between-parentheses-in-javascript


-- PM 15:30
SELECT EmployeeID, 
       HomePhone, 
       INSTR(HomePhone, '(') + 1  AS  '開始', 
       INSTR(HomePhone, ')') - 2  AS  '幾個字',
       MID(HomePhone, INSTR(HomePhone, '(') + 1, INSTR(HomePhone, ')') - 2) AS '結果'
  FROM employees;


-- PM 14:00 
https://dev.mysql.com/doc/refman/8.0/en/char.html
https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sqlmode_pad_char_to_full_length

-- 官方給的沒有 pk 
CREATE TABLE lab22 ( id int PRIMARY KEY AUTO_INCREMENT ,v VARCHAR(4), c CHAR(4));

-- 預計:  #ab#  #ab  #
-- 實際:  #ab#  #ab#
INSERT INTO lab22 (v, c) VALUES ('ab', 'ab');
SELECT CONCAT('#', v, '#'), CONCAT('#', c, '#') FROM lab22;

-- 預計:  #cd #  #cd#
-- 實際:  #cd #  #cd#
INSERT INTO lab22 (v, c) VALUES ('cd ', 'cd ');
SELECT CONCAT('#', v, '#'), CONCAT('#', c, '#') FROM lab22;

SET sql_mode = 'PAD_CHAR_TO_FULL_LENGTH';
SELECT CONCAT('#', v, '#'), CONCAT('#', c, '#') FROM lab22;
