create database secene4;
use  secene4;

CREATE TABLE Employee (
    ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(5),
    Active BOOLEAN,
    Gender CHAR(1),
    Role_ID VARCHAR(5)
);
INSERT INTO Employee (ID, Name, Department, Active, Gender, Role_ID) VALUES
('E001', 'RAJKUMAR', 'D001', 1, 'M', 'R001'),
('E002', 'GANESH', 'D001', 1, 'M', 'R002'),
('E003', 'RAGHU', 'D001', 1, 'M', 'R003'),
('E004', 'CHITRA', 'D001', 1, 'F', 'R001'),
('E005', 'PRIYA', 'D001', 1, 'F', 'R002'),
('E006', 'PREM KUMAR', 'D001', 1, 'M', 'R003'),
('E007', 'KRISHNA', 'D002', 1, 'M', 'R006'),
('E008', 'PREETHI', 'D002', 1, 'F', 'R005'),
('E009', 'RAVI', 'D002', 0, 'M', 'R004'),
('E010', 'MEENA', 'D002', 1, 'F', 'R004');
CREATE TABLE Department (
    ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50)
);
INSERT INTO Department (ID, Name) VALUES
('D001', 'DEVELOPMENT'),
('D002', 'HR');
CREATE TABLE Roles (
    ID VARCHAR(5) PRIMARY KEY,
    Name VARCHAR(50)
);
INSERT INTO Roles (ID, Name) VALUES
('R001', 'TEAM LEAD'),
('R002', 'SR. DEVELOPER'),
('R003', 'DEVELOPER'),
('R004', 'MANAGER'),
('R005', 'SR. MANAGER'),
('R006', 'EXE. MANAGER');
CREATE TABLE Reporting (
    ID VARCHAR(5),
    L2 VARCHAR(5),
    L1 VARCHAR(5),
    PRIMARY KEY (ID)
);
INSERT INTO Reporting (ID, L2, L1) VALUES
('E001', NULL, NULL),
('E002', NULL, 'E001'),
('E003', 'E002', 'E001'),
('E004', NULL, NULL),
('E005', NULL ,'E004'),
('E006', 'E005','E004'),
('E007', NULL, NULL),
('E008',NULL, 'E007'),
('E009',  'E008','E007'),
('E010',  'E008','E007');
CREATE TABLE Emp_Active_Date (
    ID VARCHAR(5) PRIMARY KEY,
    Active_From DATE,
    Resigned_On DATE
);
INSERT INTO Emp_Active_Date (ID, Active_From, Resigned_On) VALUES
('E001', '2015-01-02', NULL),
('E002', '2016-03-01', NULL),
('E003', '2018-01-02', NULL),
('E004', '2014-11-01', NULL),
('E005', '2015-01-02', NULL),
('E006', '2024-01-05', NULL),
('E007', '2013-01-02', NULL),
('E008', '2015-01-02', NULL),
('E009', '2017-11-05', '2020-10-31'),
('E010', '2015-01-02', NULL);

-- #1
DELIMITER //
create function QUES1(D VARCHAR(255)) RETURNS VARCHAR(255) DETERMINISTIC
 BEGIN
        DECLARE result INT;
            SET result = (SELECT count('Department') FROM Employee where Department = D);
        RETURN result;
    END 
//
DELIMITER ;
SELECT  Department, QUES1(Department) AS Count from Employee GROUP BY Department; -- both works
SELECT DISTINCT Department, QUES1(Department) AS Count from Employee GROUP BY Department; -- both works
--


-- #2
DELIMITER //
create function QUES222() RETURNS INT DETERMINISTIC
 BEGIN
        DECLARE result INT;
            SET result = (SELECT count('Id') FROM Employee where  Active =1);
        RETURN result;
    END 
//
DELIMITER ;
SELECT QUES222() AS NUMBER_OF_EMPLYEES;
-- #3
DELIMITER //
create function QUES_3(D VARCHAR(255)) RETURNS VARCHAR(255) DETERMINISTIC
 BEGIN
        DECLARE result INT;
            SET result = (SELECT count('Gender') AS FEMALE FROM Employee where Gender = 'F'  );
           -- SET result1 = (SELECT count('Gender') FROM Employee where Gender = 'G' && Department = D);
        RETURN result;
    END 
//
DELIMITER ;
DELIMITER //
create function QUES_4(D VARCHAR(255)) RETURNS VARCHAR(255) DETERMINISTIC
 BEGIN
        DECLARE result INT;
            SET result = (SELECT count('Gender') AS FEMALE FROM Employee where Gender = 'M'  );
           -- SET result1 = (SELECT count('Gender') FROM Employee where Gender = 'G' && Department = D);
        RETURN result;
    END 
//
DELIMITER ;
SELECT DISTINCT Department, QUES_3(Department) AS FEMALE, QUES_4(Department) AS MALE from Employee;

-- 3
DELIMITER //

CREATE PROCEDURE GetGenderCountByDepartment()
BEGIN
    SELECT 
        d.Name AS Department, 
        SUM(CASE WHEN e.Gender = 'M' THEN 1 ELSE 0 END) AS Male_Count, 
        SUM(CASE WHEN e.Gender = 'F' THEN 1 ELSE 0 END) AS Female_Count
    FROM 
        Employee e
    JOIN 
        Department d ON e.Department = d.ID
    GROUP BY 
        d.Name;
END //

DELIMITER ;

CALL GetGenderCountByDepartment();

-- 4
DELIMITER //

CREATE PROCEDURE GetLongerStayEmployees()
BEGIN
    DECLARE e009_days INT;
    SELECT DATEDIFF('2020-10-31', '2017-11-05') INTO e009_days;
    SELECT 
        e.ID, e.Name, 
        IF(ead.Resigned_On IS NULL, DATEDIFF(CURDATE(), ead.Active_From), DATEDIFF(ead.Resigned_On, ead.Active_From)) AS Days_Stayed
    FROM 
        Employee e
    JOIN 
        Emp_Active_Date ead ON e.ID = ead.ID
    WHERE 
        IF(ead.Resigned_On IS NULL, DATEDIFF(CURDATE(), ead.Active_From), DATEDIFF(ead.Resigned_On, ead.Active_From)) > e009_days;
END //

DELIMITER ;

CALL GetLongerStayEmployees();
---
DELIMITER //

CREATE PROCEDURE GetLongerStayEmployees1()
BEGIN
    DECLARE e009_days INT;
    SET e009_days = DATEDIFF('2020-10-31', '2017-11-05');  
    SELECT 
        e.ID, e.Name, 
        IF(ead.Resigned_On IS NULL, DATEDIFF(CURDATE(), ead.Active_From), DATEDIFF(ead.Resigned_On, ead.Active_From)) AS Days_Stayed
    FROM 
        Employee e
    JOIN 
        Emp_Active_Date ead ON e.ID = ead.ID
    WHERE 
        IF(ead.Resigned_On IS NULL, DATEDIFF(CURDATE(), ead.Active_From), DATEDIFF(ead.Resigned_On, ead.Active_From)) > e009_days;
END //

DELIMITER ;

CALL GetLongerStayEmployees();



