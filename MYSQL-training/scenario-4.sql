use sowmiya_sql;
create table book (ID int primary key,	NAME varchar(20),	ISBN  varchar(20),	EDITION int);
insert into book (ID,	NAME,	ISBN,	EDITION) VALUES (1,	'piligrim souls',	'9876011',	1),
(2	,'piligrim souls'	,'9876011'	,2),
(3,	'python for data science',	'9876012',	1),
(4,	'python for data science'	,'9876012'	,1),
(5	,'python for data science',	'9876012',	1),
(6	,'c# 7.0 All-in-one',	'9876016'	,1),
(7	,'c# 7.0 All-in-one',	'9876016',	2),
(8	,'c programming All-in-one',	'9876017'	,3),
(9	,'c programming All-in-one',	'9876017',	3),
(10	,'java programming for everyone',	'9876018',	1);
alter table book modify column name varchar(50);
CREATE TABLE AUTHOR		(ID	INT PRIMARY KEY, FIRST_NAME VARCHAR(30),	LAST_NAME VARCHAR(30));
INSERT INTO  AUTHOR (ID,	FIRST_NAME	,LAST_NAME) VALUES (1,	'Hortsman',	'Cay S'),
(2,	'John Paul',	'Mueller'),
(3,	'Mike',	'Chapple'),
(4,	'Barbara',	'Walter');
CREATE TABLE LIBRARIAN (ID INT PRIMARY KEY,	NAME VARCHAR(30));
INSERT INTO LIBRARIAN (ID	,NAME) VALUES (20211,	'Julia Roosevelt'),
(20233	,'Tom White');
CREATE TABLE CUSTOMER4		(ID INT PRIMARY KEY,	NAME VARCHAR(30),	ADDRESS VARCHAR(50));
INSERT INTO CUSTOMER4 (ID,	NAME,	ADDRESS) VALUES (111,	'Kala',	'03 Ranjith St'),
(112,	'Amy',	'6 Hudson St'),
(113,	'Ajay',	'56 Murugappa st'),
(114,	'Basker',	'23 Blue St'),
(115,	'Bella',	'10 New St'),
(116,	'Cynthia',	'107 Park St'),
(117,	'Zara',	'34 Lombard St');

CREATE TABLE BOOK_DETAILS	(BOOK_ID	INT, FOREIGN KEY (BOOK_ID) REFERENCES book(ID), AUTHOR_ID INT, FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(ID));
INSERT INTO BOOK_DETAILS	(BOOK_ID,	AUTHOR_ID) VALUES (1	,1),
(2,	1)
,(3,	4),
(4,	4),
(5,	4),
(6,	2),
(7,	2),
(8,	3),
(9,	3),
(10	,2);

create table book_request(
due_date date,
is_active boolean,
customer_id int ,
book_id int primary key,
librarian_id int,
foreign key (customer_id) references CUSTOMER4(ID),
foreign key (book_id) references book(ID),
foreign key (librarian_id) references LIBRARIAN(ID)); 

INSERT INTO book_request
VALUES
    ('2021-02-01', 1, 113, 1, 20211),
    ('2021-02-11', 1, 116, 8, 20211),
    ('2021-01-28', 1, 116, 3, 20233),
    ('2021-01-15', 0, 111, 7, 20211),
    ('2021-01-08', 0, 113, 5, 20233),
    ('2021-02-08', 1, 113, 4, 20233);

---#1    
SELECT  NAME,	ISBN,	EDITION	,FIRST_NAME	,LAST_NAME 
FROM BOOK_DETAILS	 
inner JOIN AUTHOR ON BOOK_DETAILS.AUTHOR_ID = AUTHOR.ID
inner JOIN book ON book.ID =BOOK_DETAILS.BOOK_ID;

---#2
SELECT NAME,	AUTHOR.ID AS ID,	concat(FIRST_NAME,LAST_NAME) AS AUTHOR_NAME
FROM BOOK_DETAILS	 
inner JOIN AUTHOR ON BOOK_DETAILS.AUTHOR_ID = AUTHOR.ID
inner JOIN book ON book.ID =BOOK_DETAILS.BOOK_ID
WHERE NAME like '% programming %';

---#3

SELECT NAME 
FROM book_request
INNER JOIN book ON book.ID =book_request.BOOK_ID
where IS_ACTIVE = 1;

---#4
SELECT distinct NAME,	ISBN,	EDITION	,FIRST_NAME	,LAST_NAME 
FROM BOOK_DETAILS	 
left JOIN AUTHOR ON BOOK_DETAILS.AUTHOR_ID = AUTHOR.ID
left JOIN book ON book.ID =BOOK_DETAILS.BOOK_ID;

---#5

SELECT distinct book.NAME , CUSTOMER4.NAME, LIBRARIAN.NAME
FROM book_request
INNER JOIN book ON book.ID =book_request.book_id
inner join LIBRARIAN ON LIBRARIAN.ID = book_request.librarian_id 
INNER JOIN CUSTOMER4 ON CUSTOMER4.ID = book_request.customer_id  LIMIT 3;

---#6
SELECT CUSTOMER4.ID, CUSTOMER4.NAME , sum((datediff(due_date,'2021-01-20'))) as DATE from book_request
INNER JOIN CUSTOMER4 ON CUSTOMER4.ID = book_request.customer_id WHERE is_active =1 group by CUSTOMER4.ID ;

---#7
select LIBRARIAN.NAME ,COUNT(librarian_id) as NO_OF_BOOKS FROM book_request
inner join LIBRARIAN ON LIBRARIAN.ID = book_request.librarian_id  group by LIBRARIAN.NAME ;

---#8
select CUSTOMER4.ID, CUSTOMER4.ADDRESS, CUSTOMER4.NAME FROM CUSTOMER4
LEFT JOIN  book_request ON  CUSTOMER4.ID=book_request.customer_id  where book_id is null;
SELECT * FROM book_request;