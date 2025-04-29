create database triggers;
SET SQL_SAFE_UPDATES = 0;
use  triggers;
show triggers;
CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  
INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  

select *from employee;

INSERT INTO employee VALUES    
('Alexande95', 'Actor', '2020-10-012', 0);  

DELIMITER //  
Create Trigger after_insert_coccuINSERT
AFTER INSERT ON employee FOR EACH ROW  
BEGIN  
UPDATE employee SET occupation = 'uuh' where working_hours = 1;   
 
END // 

INSERT INTO employee VALUES    
('hh6666h', 'FormeU', '2020-10-08', 0);  

---
use triggers;
CREATE TABLE student_info1 (  
  stud_id int NOT NULL,  
  stud_code varchar(15) DEFAULT NULL,  
  stud_name varchar(35) DEFAULT NULL,  
  subject varchar(25) DEFAULT NULL,  
  marks int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL,  
  PRIMARY KEY (stud_id)  
)  

CREATE TABLE student_detail (  
  stud_id int NOT NULL,  
  stud_code varchar(15) DEFAULT NULL,  
  stud_name varchar(35) DEFAULT NULL,  
  subject varchar(25) DEFAULT NULL,  
  marks int DEFAULT NULL,  
  phone varchar(15) DEFAULT NULL,  
  Lasinserted Time,  
  PRIMARY KEY (stud_id)  
);  
 DELIMITER //  
Create Trigger after_insert_details123
AFTER UPDATE ON student_info FOR EACH ROW  
BEGIN  
INSERT INTO student_detail VALUES (new.stud_id, new.stud_code,   
new.stud_name, new.subject, new.marks, new.phone, curdate()) ;  
END //  

 INSERT INTO student_info VALUES   
(12, 1310, 'Ale4xandar', 'Bio7logy', 687, '2347346438');  
SELECT * FROM student_detail;  
SHOW triggers;

-- set `group_concat_max_len`
SET @@session.group_concat_max_len = @@global.max_allowed_packet;

-- select all the triggers and build the `DROP TRIGGER` SQL
-- replace <your_schema> with your schema name (e.g. your database name)
SELECT GROUP_CONCAT(sql_string SEPARATOR '\n')
FROM (
    SELECT CONCAT('DROP TRIGGER IF EXISTS `', TRIGGER_NAME, '`;') AS sql_string,'1'
    FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA = 'triggers'
    ) AS sql_strings
GROUP BY '1';

---

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (name, salary) VALUES ('John Doe', 50000.00);
INSERT INTO employees (name, salary) VALUES ('Jane Smith', 60000.00);

CREATE TABLE employee_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER log_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, old_salary, new_salary)
    VALUES (OLD.id, OLD.salary, NEW.salary);
    
END;
//
DELIMITER ;
UPDATE employees
SET salary = 5500.00
WHERE name = 'John Doe';
SELECT * FROM employee_audit;

SELECT 
    CONCAT('DROP TRIGGER ', Trigger_Name, ';')
FROM
    information_schema.TRIGGERS
WHERE
    TRIGGER_SCHEMA = 'triggers';
---'DROP TRIGGER IF EXISTS `before_insert_empworkinghours`;\nDROP TRIGGER IF EXISTS `after_insert_empworkinghours`;\nDROP TRIGGER IF EXISTS `after_insert_details`;\nDROP TRIGGER IF EXISTS `after_insert_details123`;\nDROP TRIGGER IF EXISTS `after_insert_empworkinghours123`;\nDROP TRIGGER IF EXISTS `after_insert_curdate`;\nDROP TRIGGER IF EXISTS `after_insert_cnew`;\nDROP TRIGGER IF EXISTS `after_insert_cnew123`;\nDROP TRIGGER IF EXISTS `after_insert_coccu`;\nDROP TRIGGER IF EXISTS `after_insert_coccuINSERT`;\nDROP TRIGGER IF EXISTS `log_salary_update`;'
mysql-connector-python:
import mysql.connector

# Connect to the database
connection = mysql.connector.connect(
    host='your_host',
    user='your_user',
    password='your_password',
    database='your_database_name'
)

cursor = connection.cursor()
cursor.execute("SELECT TRIGGER_NAME FROM information_schema.TRIGGERS WHERE TRIGGER_SCHEMA = 'your_database_name';")
triggers = cursor.fetchall()

for (trigger_name,) in triggers:
    cursor.execute(f"DROP TRIGGER {trigger_name};")

connection.commit()
cursor.close()
connection.close()



DELIMITER //

CREATE FUNCTION no_of_years(date1 date) RETURNS int DETERMINISTIC
BEGIN



