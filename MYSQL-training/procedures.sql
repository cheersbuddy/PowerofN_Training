CREATE TABLE procedure_eg (
    ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(5),
    Active BOOLEAN,
    Gender CHAR(1),
    Role_ID VARCHAR(5),
    D_O_B date
);

DELIMITER // 
create PROCEDURE procedure_eg1(
IN  ID VARCHAR(255) ,
   IN  Name VARCHAR(50),
   IN  Department VARCHAR(5),
   IN  Active BOOLEAN,
   IN  Gender CHAR(1),
   IN  Role_ID VARCHAR(5),
   IN  D_O_B date)
BEGIN
INSERT INTO procedure_eg (ID ,
    Name ,
    Department ,
    Active ,
    Gender ,
    Role_ID,
    D_O_B) VALUES
    (ID ,
    Name ,
    Department ,
    Active ,
    Gender ,
    Role_ID,
    D_O_B)
;
END
//
DELIMITER ; 
   
SELECT * FROM procedure_eg;
CALL procedure_eg1('E003', 'RAGHU', 'D001', 1, 'M', 'R003', '2000-06-18');

DELIMITER // 
create PROCEDURE director1(
OUT age int)
BEGIN
SELECT sum(age) from director;
END;
//
DELIMITER ;
CALL director5(@aid, @ss );
SELECT @aid,@ss;
---
DELIMITER // 
create PROCEDURE director5(
INOUT aid varchar(20),
OUT ss int)
BEGIN 
SELECT age,id INTO ss,aid FROM director where id=aid;
END
//
DELIMITER ; 

SET @aid = 'D001';
SET @aid = 'D002';
---
show procedure status;
drop procedure director6;