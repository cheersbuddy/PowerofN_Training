use sowmiya_sql;
CREATE TABLE housing_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    crim DECIMAL(10,5),
    zn DECIMAL(10,5),
    indus DECIMAL(10,5),
    chas INT,
    nox DECIMAL(10,5),
    rm DECIMAL(10,5),
    age DECIMAL(10,5),
    dis DECIMAL(10,5),
    rad INT,
    tax INT,
    ptratio DECIMAL(10,5),
    black DECIMAL(10,5),
    lstat DECIMAL(10,5),
    medv DECIMAL(10,5)
);
create table iris2(
h1 DECIMAL(10,5),
h2 DECIMAL(10,5),
h3 DECIMAL(10,5),
h4 DECIMAL(10,5),
h5 int);
select * from iris2;
show tables from triggers;

CREATE TABLE MyTable
(
  name VARCHAR(10),
  value int
);
-- Inserting the data into the table 
INSERT into MyTable(name, value) VALUES ('ABC', 1);
INSERT into MyTable(name, value) VALUES ('DEF', 2);
INSERT into MyTable(name, value) VALUES ('GHI', 3);
INSERT into MyTable(name, value) VALUES ('JKL', 4);
INSERT into MyTable(name, value) VALUES ('MNO', 5);

CREATE TABLE MyTable2
(
  name VARCHAR(10),
  value int
);
-- Inserting the data into the table 
INSERT into MyTable(name, value) VALUES ('ABC', 6);
INSERT into MyTable(name, value) VALUES ('DEF', 8);
INSERT into MyTable(name, value) VALUES ('GHI', 55);
INSERT into MyTable(name, value) VALUES ('JKL', 47);
INSERT into MyTable(name, value) VALUES ('MNO', 59);

SET SQL_SAFE_UPDATES = 0;
SET @@local.net_read_timeout=360;
SET @@global.net_read_timeout=360;
-- Printing the Table
SELECT * from MyTable;
select * from MyTable;

DELIMITER //
CREATE FUNCTION Demoavg() RETURNS INT DETERMINISTIC
    BEGIN
        DECLARE result INT;
            SET result = (SELECT AVG(`value`) FROM MyTable);
        RETURN result;
    END 
//
DELIMITER ;
SELECT Demoavg();
SELECT name,AVG(`value`) FROM MyTable;
SELECT AVG(`value`) FROM MyTable2;
DELIMITER $$
CREATE FUNCTION ADD_NUM(a INT, b INT) RETURNS INT DETERMINISTIC
BEGIN
RETURN a + b;
END$$
DELIMITER ;

SELECT ADD_NUM(10, 12);
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //

CREATE PROCEDURE DynamicAvg(IN tableName VARCHAR(64), OUT avgResult INT)
BEGIN
    SET @sql = CONCAT('SELECT AVG(`value`) INTO @result FROM ', tableName);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET avgResult = @result;
END //

DELIMITER ;

CALL DynamicAvg('MyTable', @average);
SELECT @average;

CALL DynamicAvg('MyTable2', @average);
SELECT @average;

---
SELECT  routine_schema,  
        routine_name,  
        routine_type 
FROM information_schema.routines 
WHERE routine_schema = 'sowmiya_sql' 
ORDER BY routine_name;

show triggers;

show function status ;


CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT
);
INSERT INTO Product (ProductID, ProductName, Price, Quantity) VALUES
(1, 'Laptop', 800.00, 10),
(2, 'Phone', 500.00, 20),
(3, 'Tablet', 300.00, 15),
(4, 'Monitor', 150.00, 25),
(5, 'Keyboard', 30.00, 50);
select ProductName, Total(Price , Quantity) AS TotalPrice from Product;

DELIMITER $$
CREATE FUNCTION Total(P int , Q int)
RETURNS FLOAT
BEGIN
    -- DECLARE Totalprice FLOAT;
    -- SELECT INTO Totalprice ;
    RETURN  P * Q;
END $$
DELIMITER ;
---
DELIMITER $$
CREATE FUNCTION Total123(P int , Q int)
RETURNS FLOAT
BEGIN
    DECLARE Totalprice FLOAT;
    -- SELECT INTO Totalprice ;
    SET Totalprice = P * Q;
    RETURN Totalprice ;
END $$
DELIMITER ;
SELECT TotalProducts() AS TotalPrice;

SET result = (SELECT AVG(`value`) FROM MyTable);
