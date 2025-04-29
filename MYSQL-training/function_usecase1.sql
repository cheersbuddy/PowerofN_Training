CREATE TABLE citizen (
    ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(5),
    Active BOOLEAN,
    Gender CHAR(1),
    Role_ID VARCHAR(5),
    D_O_B date
);
SET SQL_SAFE_UPDATES = 0;
INSERT INTO citizen (ID, Name, Department, Active, Gender, Role_ID, D_O_B) VALUES
('E001', 'RAJKUMAR', 'D001', 1, 'M', 'R001','2010-08-09' ),
('E002', 'GANESH', 'D001', 1, 'M', 'R002', '2024-02-28'),
('E003', 'RAGHU', 'D001', 1, 'M', 'R003', '2000-06-18'),
('E004', 'CHITRA', 'D001', 1, 'F', 'R001', '2021-03-10'),
('E005', 'PRIYA', 'D001', 1, 'F', 'R002', '2010-11-25'),
('E006', 'PREM KUMAR', 'D001', 1, 'M', 'R003', '2020-11-25'),
('E007', 'KRISHNA', 'D002', 1, 'M', 'R006', '2001-03-10'),
('E008', 'PREETHI', 'D002', 1, 'F', 'R005', '1997-11-25'),
('E009', 'RAVI', 'D002', 0, 'M', 'R004', '2010-11-25'),
('E010', 'MEENA', 'D002', 1, 'F', 'R004','2002-06-18');
ALTER TABLE citizen ADD COLUMN IsAdult VARCHAR(3);
DELIMITER //

CREATE FUNCTION IsAdult(DOB DATE, input_year INT) 
RETURNS VARCHAR(3) DETERMINISTIC
BEGIN
    DECLARE age INT;
    DECLARE result VARCHAR(3);
    SET age = input_year - YEAR(DOB);
    IF MONTH(DOB) > MONTH(CURDATE()) OR (MONTH(DOB) = MONTH(CURDATE()) AND DAY(DOB) > DAY(CURDATE())) THEN
        SET age = age - 1;
    END IF;
    IF age >= 18 THEN
        SET result = 'Yes';
    ELSE
        SET result = 'No';
    END IF;
    
    RETURN result;
END //

DELIMITER ;

UPDATE citizen 
SET IsAdult = IsAdult(D_O_B, YEAR(CURDATE()));

SELECT * FROM citizen;
-- trigger
DELIMITER //
CREATE TRIGGER before_citizen_insert 
BEFORE INSERT ON citizen
FOR EACH ROW 
BEGIN
    SET NEW.IsAdult = IF(TIMESTAMPDIFF(YEAR, NEW.D_O_B, CURDATE()) >= 18, 'Yes', 'No');
END //
DELIMITER ;
DELIMITER //
INSERT INTO citizen (ID, Name, Department, Active, Gender, Role_ID, D_O_B) VALUES
('E0021', 'aaaaaaaa', 'D001', 1, 'M', 'R001','2000-08-09' );

---
DELIMITER //

CREATE FUNCTION IsAdult_display(DOB DATE, input_year INT) 
RETURNS VARCHAR(3) DETERMINISTIC
BEGIN
    DECLARE age INT;
    DECLARE result VARCHAR(3);
    SET age = input_year - YEAR(DOB);
    IF MONTH(DOB) > MONTH(CURDATE()) OR (MONTH(DOB) = MONTH(CURDATE()) AND DAY(DOB) > DAY(CURDATE())) THEN
        SET age = age - 1;
    END IF;
    IF age >= 18 THEN
        SET result = 'Yes';
    ELSE
        SET result = 'No';
    END IF;
    
    RETURN result ;
END //

DELIMITER ;
SELECT name, IsAdult(D_O_B, 2024) AS Is_citizen from citizen;