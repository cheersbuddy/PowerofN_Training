select user();
select user from mysql.user;
select * from mysql.user;
use mysql;
show tables;
desc user;
show variables;
CREATE USER 'sowmiya'@'localhost' IDENTIFIED BY 'sowmiya';
select * from user where user = 'sowmiya' ;
ALTER USER 'sowmiya'@'localhost' IDENTIFIED BY 'sowmiya123' ;
FLUSH PRIVILEGES;

GRANT SELECT ON mysql.user TO 'sowmiya'@'localhost' WITH GRANT OPTION;
show databases;
show privileges;
show grants;
show grants for sowmiya@localhost;

CREATE ROLE 'sql-testing'@'localhost';
CREATE ROLE 'what123';
SELECT user AS 'sql-testing', host
FROM mysql.user
WHERE host = '%'
  AND NOT LENGTH(authentication_string);

GRANT SELECT, INSERT ON mysql.user TO 'sql-testing'@'localhost';
show grants for 'sql-testing'@'localhost';
grant 'sql-testing'@'localhost' to 'sowmiya'@'localhost';
show grants for sowmiya@localhost;
grant 'what123' to 'sowmiya'@'localhost';

set role 'sql-testing'@'localhost';
drop role 'what123' ;