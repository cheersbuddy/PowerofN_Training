use sowmiya_sql;
SET SQL_SAFE_UPDATES = 0;
create table student (student_id int, student_name varchar(23), dept_id int);
create table dept(dept_id int, dept_name varchar(20));
insert into student(student_id, student_name)values (1,'sowmiya'), (2,'1sowmiya'), (3,'sowmiya213'), (4,'432sowmiya');
insert into student(dept_id) values (41), (42), (43), (44);
insert into dept(dept_id, dept_name) values (41, 'IT'), (42, 'CSE'), (41, 'IT1');
update student set dept_id = 12 where student_name='sowmiya';
update student set dept_id = 13 where student_name='1sowmiya';
update student set dept_id = 14 where student_name='sowmiya213';
update student set dept_id = 15 where student_name='432sowmiya';
update student set  student_name='ee' where dept_id = 41;
update student set  student_name='tt' where dept_id = 44;
select * from dept;
select * from student;
select * from student left join dept on student.dept_id = dept.dept_id
union all select * from student right  join dept on student.dept_id = dept.dept_id;
select * from student cross join dept ;
select student.dept_id  from student cross join dept ;
select student.dept_id , dept.dept_id from student cross join dept ;

SELECT *
FROM student dept_id, dept dept_id
;