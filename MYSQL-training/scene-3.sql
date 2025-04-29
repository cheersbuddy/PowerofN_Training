use sowmiya_sql;
CREATE TABLE movies (
    id VARCHAR(10) primary key,
    name VARCHAR(100),
    IMDb DECIMAL(2, 1),
    released_on DATE,
    language VARCHAR(20)
);
desc movies;

INSERT INTO movies (id, name, IMDb, released_on, language) VALUES
('M001', 'Enthiran', 7.1, '2010-10-01', 'Tamil'),
('M002', 'Avengers Endgame', 8.4, '2019-04-26', 'English'),
('M003', '3 Idiots', 8.4, '2009-12-25', 'Hindi'),
('M004', 'Interstellar', 8.6, '2014-11-07', 'English'),
('M005', 'Munna Bhai', 8.1, '2003-12-19', 'Hindi'),
('M006', 'I', 7.4, '2015-01-14', 'Tamil'),
('M007', 'The Prestige', 8.5, '2006-10-20', 'English'),
('M008', 'PK', 8.1, '2014-12-19', 'Hindi'),
('M009', 'Tenet', 7.4, '2020-12-04', 'English');
select * FROM movies;
create table director (id varchar(20) primary key, 	name varchar(20),	age int);
desc director;
INSERT INTO director (id, name, age) VALUES
('D001', 'Anthony Joe Russo', 45),
('D002', 'Christopher Nolan', 51),
('D003', 'Quentin Tarantino', 58),
('D004', 'Rajkumar Hirani', 65),
('D005', 'S Shankar', 49);
select * from director;

CREATE TABLE budget (
    director_id VARCHAR(10),
    movie_id VARCHAR(10),
    budget INT,
    FOREIGN KEY (director_id) REFERENCES director(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);


INSERT INTO budget (director_id, movie_id, budget) VALUES
('D005', 'M001', 132),
('D004', 'M003', 550),
('D004', 'M008', 85),
('D005', 'M006', 100),
('D001', 'M002', 2642),
('D002', 'M004', 1224),
('D002', 'M009', 1480),
('D002', 'M007', 300),
('D004', 'M005', 36);

---#1

SELECT movies.name AS movie_name, 
       movies.IMDb, 
       director.name AS director_name, 
       director.age
FROM budget
JOIN movies ON budget.movie_id = movies.id
JOIN director ON budget.director_id = director.id
WHERE budget.budget > 500;
 ---
 
--- #2
SELECT director.name AS director_name, 
       COUNT(movies.id) AS movie_count
FROM budget
JOIN movies ON budget.movie_id = movies.id
JOIN director ON budget.director_id = director.id
WHERE movies.IMDb > 8
GROUP BY director.name ;
---

---#3

SELECT COUNT(budget.movie_id) AS movie_count
FROM budget
JOIN movies ON budget.movie_id = movies.id
JOIN director ON budget.director_id = director.id
WHERE movies.language = 'English'
  AND movies.released_on BETWEEN '2011-01-01' AND '2021-12-31'
  AND director.age > 50;
  
  ---#4
  
SELECT movies.name, 
       CASE 
           WHEN movies.IMDb >= 8 THEN 'best'
           ELSE 'good'
       END AS category
FROM movies
WHERE movies.language IN ('Hindi', 'Tamil');

SELECT * FROM movies;
update movies set released_on = '2026-04-19' where id ='M002';

SELECT id, IMDb, released_on,
group_concat(name ) as "name" 
FROM movies
GROUP BY language;

DELIMITER // 
create PROCEDURE director1(
OUT age int)
BEGIN
SELECT sum(age) from director;
END;
//
DELIMITER ;
CALL director4('D001',@ss );
SELECT @ss;
---
DELIMITER // 
create PROCEDURE director4(
IN aid varchar(20),
OUT ss int)
BEGIN 
SELECT age INTO ss FROM director where id=aid;
END
//
DELIMITER ; 
