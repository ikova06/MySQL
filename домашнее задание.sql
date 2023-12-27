DROP DATABASE IF EXISTS `hometask`;
CREATE DATABASE IF NOT EXISTS `hometask`;
USE `hometask`;

-- Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов. 
DROP PROCEDURE secintodate;
DELIMITER //
CREATE PROCEDURE secintodate(seconds INT)
BEGIN
DECLARE days INT default 0;
DECLARE hours INT default 0;
DECLARE minutes INT default 0;

SET days = seconds / 86400;
SET seconds = seconds % 86400;

SET hours = seconds / 3600;
SET seconds = seconds % 3600;

SET minutes = seconds / 60;
SET seconds = seconds % 60;

SELECT CONCAT(
days, 'days',
hours, 'hours',
minutes, 'minutes',
seconds, 'seconds'
) AS date_time;
END //
DELIMITER ;

CALL secintodate(789456246);

-- Создайте функцию, которая выводит только четные числа от 1 до 10.

DELIMITER //
CREATE FUNCTION even (num INT) 
RETURNS VARCHAR(10) 
DETERMINISTIC 
BEGIN 
DECLARE i INT DEFAULT 0; 
DECLARE result VARCHAR(10); 
SET result = ''; 
WHILE i < num DO 
SET i = i + 2; 
SET result = concat(result, '  ', i); 
END WHILE; 
RETURN result; 
END //
DELIMITER ;

SELECT even(10);


