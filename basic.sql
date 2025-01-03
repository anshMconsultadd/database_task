show databases;
-- ddl - deals with descriptions of the database schema and is used to create and modify the structure of database
-- created a table worker usinng new database
-- create ,alter, drop ,truncate.

CREATE DATABASE IF NOT EXISTS ORG ;
use org;
-- create used to create a table in db
CREATE TABLE worker(
worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
f_name VARCHAR(25),
l_name VARCHAR(25),
salary INT,
join_date DATETIME,
dept VARCHAR(25));

-- alter is used to alter the structure of existing table like 
ALTER table worker ADD hobbies VARCHAR(255) ;
-- we have altered the table by adding a hobbies coloumn 

-- similarly we can add modify rename drop columns from the table 

-- we can also rename the coloumn using the alter comand 
 ALTER table worker RENAME COLUMN dept TO team;
  -- this will rename the dept column to team 
  
 ALTER TABLE worker MODIFY salary INT NOT NULL DEFAULT 10000;
 
 
-- to view the entire table  
SELECT * FROM worker;


-- it drops the entire tabler from the available database 
DROP table worker;

-- DML component of the SQL statement that controls access to data and to the database
-- select,insert,update ,delete

-- insert command insert data into a table 
INSERT INTO worker VALUES
-- SYNTAX : INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
(1,'rajesh','tyagi',250000,'2024-09-30 13:00:00','ecell'),
(2, 'suresh', 'kumar', 300000, '2023-06-15 09:30:00', 'cse'),
(3, 'ramesh', 'singh', 180000, '2022-12-01 10:00:00', 'ee'),
(4, 'mohan', 'verma', 280000, '2023-04-10 14:45:00', 'it'),
(5, 'pankaj', 'sharma', 220000, '2023-08-05 08:15:00', 'cse'),
(6, 'anita', 'jain', 260000, '2024-02-20 11:30:00', 'ecell'),
(7, 'neha', 'gupta', 190000, '2022-09-25 16:00:00', 'ee'),
(8, 'alok', 'mehta', 320000, '2021-11-30 12:45:00', 'it'),
(9, 'vikas', 'agrawal', 275000, '2023-01-12 17:20:00', 'cse'),
(10, 'deepa', 'bhatt', 240000, '2024-03-08 09:50:00', 'ee');

-- SELECT This command allows getting the data out of the database to perform operations with it.
-- simply retrives data from the table 
-- QUERIES 
SELECT * FROM worker WHERE dept='cse' OR dept='ecell';
-- better way is IN which reduces the OR statements 
SELECT * FROM worker WHERE dept IN ('ecell','ee','cse');

-- name matching 
SELECT * FROM worker where f_name LIKE '_a%' AND l_name LIKE '%a%';

-- order by 
select * from worker ORDER BY salary DESC;

-- AND IS USED IN WHERE CLAUSE WHERE WE WANT THE 2 CONDITINS TO BE FULLFILLED AT THE SAME TIME HERE USING AND IS OF NO USE 
SELECT * FROM worker WHERE  f_name LIKE '_a%' ORDER BY salary ;

-- GROUP BY is used to group rows that have the same values in specified columns 
-- GROUPING WE USE AGGREGATION SO WE USE GROUP BY AND SQL PROVIDES US SOME AGGREGATION FUNCTION 
-- IF WE DO NOT USE  ANY AGGREGATION FUNCTION IT WILL USE GROUP BY AS DISTINCT

select distinct(dept) from worker group by dept;

SELECT dept,COUNT(dept) FROM worker GROUP BY dept;
-- distinct and group by having 

-- lets find the avg salary of worker in each dept 
SELECT dept ,AVG(salary) FROM worker GROUP BY dept;


-- update The SQL UPDATE statement is used to modify the data that is already in the database.
-- UPDATE table_name SET column_name = value WHERE condition; 
UPDATE worker SET f_name="raj" ,l_name="tagore" where worker_id=1;
-- delete 
DELETE FROM worker where worker_id=1;

-- GRANT AND REVOKE ARE USED TO MANAGE USER PERMISSION 
-- GRANT privilege_type ON object TO user [WITH GRANT OPTION];



