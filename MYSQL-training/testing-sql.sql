show databases;
SET SQL_SAFE_UPDATES = 0;
create database sowmiya_sql;
create table demo(id int primary key AUTO_INCREMENT, name varchar(10), Age int, check(Age>18));
use sowmiya_sql;
show tables;
select * from demo;
describe demo;
insert into demo values (5, 'sowm3iya', 10) ;
update  demo set  name = 'sow' where id='1';
drop table demo;
insert into demo (name,Age) values ( 'sowmi', 20) ;
insert into demo (name,Age) values ( 'sowmi1', 24) ,( 'sowmi2', 21), ( 'sowmi3', 30), ( 'sowmi4', 60), ( 'sowmi5', 230);
insert into demo (id,name,Age) values ( 5,'sowmi', 10) ;
delete from demo where id = '4';
delete from demo where  id 	between 50 and 55;
alter table demo add gender varchar(10);
update demo set  gender = 'f' where name = "sowmiya";
alter table demo modify gender varchar(40); 
alter table demo drop gender;
 create table aggregate(id int primary key AUTO_INCREMENT, name varchar(10), Age int, check(Age>18), mark int, overall_rank int);
select count(Age) from demo;
create table movie_theatre1 (theater_id int primary key AUTO_INCREMENT, date DATE, time TIME, movie_name varchar(40), movie_genre varchar(40), guest_total int, ticket_cost decimal(4,2));
use sowmiya_sql;
INSERT INTO movie_theatre1
(theater_id, date, time, movie_name, movie_genre, guest_total, ticket_cost)
VALUES
(1, '2022-05-27', '10:00:00', 'Top Gun Maverick', 'Action', 131, 18.00),
(2, '2022-05-27', '10:00:00', 'Downton Abbey A New Era', 'Drama', 90, 18.00),
(3, '2022-05-27', '10:00:00', 'Men', 'Horror', 100, 18.00),
(4, '2022-05-27', '10:00:00', 'The Bad Guys', 'Animation', 83, 18.00),
(5, '2022-05-28', '09:00:00', 'Top Gun Maverick', 'Action', 112, 8.00),
(6, '2022-05-28', '09:00:00', 'Downton Abbey A New Era', 'Drama', 137, 8.00),
(7, '2022-05-28', '09:00:00', 'Men', 'Horror', 25, 8.00),
(8, '2022-05-28', '09:00:00', 'The Bad Guys', 'Animation', 142, 8.00),
(9, '2022-05-28', '05:00:00', 'Top Gun Maverick', 'Action', 150, 13.00),
(10, '2022-05-28', '05:00:00', 'Downton Abbey A New Era', 'Drama', 118, 13.00),
(11, '2022-05-28', '05:00:00', 'Men', 'Horror', 88, 13.00),
(12, '2022-05-28', '05:00:00', 'The Bad Guys', 'Animation', 130, 13.00);
select * from movie_theatre1;
describe movie_theatre;
SELECT movie_genre, AVG(guest_total) AS average
FROM movie_theatre1 
GROUP BY movie_genre;
select  movie_name  from movie_theatre1 order by  ticket_cost=' asc';
SELECT guest_total FROM movie_theatre1
ORDER BY guest_total = 'desc';
select movie_name from movie_theatre1 where movie_genre like 'A%' ;

