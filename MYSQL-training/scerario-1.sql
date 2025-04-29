SET SQL_SAFE_UPDATES = 0;
show databases;
use sowmiya_sql;
create table CUSTOMER (CUST_CODE int,	CUST_NAME varchar(20),	CUST_CITY varchar(20),	PHONE_NO int,	AGENT_CODE varchar(10));
describe CUSTOMER;
insert into CUSTOMER (CUST_NAME,	CUST_CITY,	PHONE_NO,	AGENT_CODE,CUST_CODE) values ('Albert',	'Chennai'	,9798865876,	'A001','C001'),
( 'Ravi',	'Bangalore',	9876123456	,'A002','C002'),
('Archana',	'Chennai',	94523098123,	'A004', 'C003'	),
('Riya',	'Trichy',	9612309876	,'A002','C004'),
('Pavithra',	'Kanyakumari',	9612309856,	'A005','C005');
select * from CUSTOMER;
select * from AGENT;
alter table  CUSTOMER drop column CUST_CODE ;
ALTER TABLE  CUSTOMER
ADD CUST_CODE varchar(20);
alter table CUSTOMER modify column PHONE_NO varchar(15);

create table AGENT (AGENT_CODE varchar(20),	AGENT_NAME varchar(20),	COUNTRY varchar(20),	PHONE_NO varchar(20),	STATUS varchar(20));
describe AGENT;
insert into AGENT (AGENT_CODE,	AGENT_NAME,	COUNTRY,	PHONE_NO,	STATUS) values ('A001', 'Joe', 'Canada' ,'2345623452', 0),
('A002', 'Sara', 'India' ,'1234567890', 1),
('A003', 'Wiley', 'Bahamas' ,'987654321', 1),
('A004', 'Katniss', 'Ireland' ,'3456543698', 1),
('A005', 'Arjun', 'India' ,'9844342345', 0);
select * from AGENT;

create table ORDER1 (ORDER_NUM varchar(20),	CUST_CODE varchar(20),	AGENT_CODE varchar(20),	AMOUNT	float, ORDER_DATE varchar(20)); 
select * from ORDER1;
INSERT into ORDER1 (ORDER_NUM	,CUST_CODE	,AGENT_CODE	,AMOUNT,	ORDER_DATE	) values ( 'O001', 'C001 ', 'A001', '50000.5'  , '44532 ' ),
( 'O002', 'C002', 'A002','3000.35'  , '26/03/2021 ' ), ( 'O003', 'C005', 'A004', ' 25000.1', '    21/01/2021 ' ), ( 'O004', 'C003', 'A003','6000.5 ' , ' 44350' ),
( 'O006', 'C004', 'A005', '100000.4' , '13/09/2019 ' );

alter table ORDER1 modify column  AMOUNT varchar(20);
alter table ORDER1 add primary key(ORDER_NUM);
alter table AGENT add primary key(AGENT_NAME);
alter table CUSTOMER add primary key(CUST_CODE);

ALTER TABLE ORDER1 add   FOREIGN KEY (AGENT_CODE) REFERENCES AGENT(AGENT_CODE);
SELECT AGENT_CODE FROM ORDER1 WHERE AGENT_CODE NOT IN (SELECT AGENT_CODE FROM AGENT);
ALTER TABLE ORDER1 ADD FOREIGN KEY (AGENT_CODE) REFERENCES AGENT(AGENT_CODE);
SELECT AGENT_CODE 
FROM ORDER1 
WHERE AGENT_CODE NOT IN (SELECT AGENT_CODE FROM AGENT);


ALTER TABLE AGENT DROP PRIMARY KEY;
ALTER TABLE AGENT ADD PRIMARY KEY (AGENT_CODE);

ALTER TABLE CUSTOMER ADD FOREIGN KEY (AGENT_CODE) REFERENCES AGENT(AGENT_CODE);
ALTER TABLE ORDER1 ADD FOREIGN KEY (AGENT_CODE) REFERENCES AGENT(AGENT_CODE);
describe AGENT;
describe ORDER1;
desc CUSTOMER;
truncate table ORDER1;
insert into CUSTOMER (CUST_NAME,	CUST_CITY,	PHONE_NO,	AGENT_CODE,CUST_CODE) values ('Albert',	'Chennai'	,9798865876,	'A001','C001'),
( 'Ravi',	'Bangalore',	9876123456	,'A002','C002'),
('Archana',	'Chennai',	94523098123,	'A004', 'C003'	),
('Riya',	'Trichy',	9612309876	,'A002','C004'),
('Pavithra',	'Kanyakumari',	9612309856,	'A005','C005');

ALTER TABLE AGENT ADD COLUMN Comission varchar(20);
ALTER TABLE AGENT DROP COLUMN PHONE_NO;
SELECT * from AGENT;
INSERT into AGENT (Comission) values ('0.2'), ('0.96'), ('0.23'), ('0.12'), ('0.76');
update AGENT set Comission=0.2 where AGENT_CODE='A001';
update AGENT set Comission=0.96 where AGENT_CODE='A002';
update AGENT set Comission=0.23 where AGENT_CODE='A003';
update AGENT set Comission=0.12 where AGENT_CODE='A004';
update AGENT set Comission=0.76 where AGENT_CODE='A005';

ALTER TABLE AGENT RENAME COLUMN Comission TO Commision_Percentage;
CREATE TABLE AGENT_DETAILS LIKE AGENT; 
desc AGENT_DETAILS;
SELECT * FROM AGENT_DETAILS;
SELECT * FROM ORDER1;
INSERT INTO AGENT_DETAILS SELECT * FROM AGENT;
truncate table ORDER1;
alter table ORDER1 modify column AMOUNT float default(2.2);
desc ORDER1;
