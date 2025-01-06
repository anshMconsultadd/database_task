-- sql windows function 
-- A window function makes a calculation across multiple rows that are related to the current row.
--A window function in SQL is a type of function that allows us to perform calculations across a specific set of rows related to the current row. These calculations happen within a defined window of data, and they are particularly useful for aggregates, rankings, and cumulative totals without altering the dataset.
T --he OVER clause is key to defining this window. It partitions the data into different sets (using the PARTITION BY clause) and orders them (using the ORDER BY clause). These windows enable functions like SUM(), AVG(), ROW_NUMBER(), RANK(), and DENSE_RANK() to be applied in a sophisticated manner.



SELECT window_function() OVER(
        PARTITION BY partition_expression
        ORDER BY order_expression window_frame_extent
    ) AS window_column_alias
FROM table_name

-- there are various types of windows function like aggregate,ranking and cumulative 

-- ex 
CREATE DATABASE IF NOT EXISTS temp;
use temp;
CREATE TABLE emp(
    f_name VARCHAR(255),
    age INT,
    dept VARCHAR(255),
    salary INT
);

drop table emp ;
INSERT INTO emp (f_name, age, dept, salary)
VALUES
    ('Alice Johnson', 30, 'Engineering', 80000),
    ('Bob Smith', 45, 'Marketing', 68000),
    ('Carol Lee', 28, 'Human Resources', 62000),
    ('David Brown', 35, 'Engineering', 80000),
    ('Eva Green', 40, 'Marketing', 68000),
    ('Arnold s', 40, 'Marketing', 70000);

SELECT * FROM emp;



-- finding the avg salary using group  by and then by using the aggregate function 
select dept, avg(salary) as avg_salary from employee group by dept;
-- but what it did is it reduced the number of rows into a single row or grouoped them 
-- but by usibng the windows function we can still keep the rows as it is as well as 
-- group them 
SELECT AVG(salary) FROM emp;

SELECT dept,f_name ,age,salary, 
        AVG(salary) OVER (PARTITION BY dept) AS "avg_salary" 
FROM emp;

-- similary we can have this many aggregate window functions 

/*SUM()
AVG()
COUNT()
MAX()
MIN()
*/


-- ALL AGREGATE WINDOW FUNCTIONS
SELECT dept,f_name, 
        AVG(salary) OVER (PARTITION BY dept) AS "avg_salary" ,
         SUM(salary) OVER (PARTITION BY dept) AS "SUM_SALARY" ,
         MIN(salary) OVER (PARTITION BY dept) AS "MIN_SALARY" ,
         MAX(salary) OVER (PARTITION BY dept) AS "MAX_SALARY" ,
        COUNT(salary) OVER (PARTITION BY dept) AS "COUNT_SALARY" 
        
FROM emp;

-- there are 3 common ranking function 
-- RANKING WINDOW FUNCTIONS
-- These functions provide rankings of rows within a partition based on specific criteria. 

ROW_NUMBER()
-- it gives each row a unique number from 1 to the total count of the rows
-- in e­ach partition, rows get numbers one afte­r another. No two rows have the same­ number in a partition.

RANK()
/*
the rank function assigns rank to all the rows within every partition. 
Rank is assigned such that rank 1 given to the first row and rows having same value are assigned same rank. 
For the next rank after two same rank values, one rank value will be skipped. For instance, if two rows share­ rank 1, the next row gets rank 3, not 2.
*/
DENSE_RANK()
/*
It assigns rank to each row within partition. Just like rank function first row is assigned rank 1 and rows having same value have same rank. 
The difference between RANK() and DENSE_RANK() is that in DENSE_RANK(), 
for the next rank after two same rank, consecutive integer is used, no rank is skipped. */


-- ex 
use temp;
select 
            ROW_NUMBER() over (partition by dept ORDER BY salary desc) as "emp_row_num",
            f_name,dept,salary,
            rank() over( partition BY dept ORDER BY salary desc ) as "emp_rank",
            DENSE_RANK() over ( partition by dept ORDER BY salary desc) as "dense_ep_rank" 
from emp;

-- nitle () 
-- this distributes the rows of an ordered partition into roughly equal number of '
-- predefined groups 
-- assigns each grouop a number expression ranginfg from 1 

select f_name  ,dept, NTILE(3)
over ( PARTITION BY dept order by salary) group_number 
from emp;

-- lead and lag window functions 

-- With LAG and LEAD, you must specify ORDER BY in the OVER clause.
-- LEAD and LAG are most commonly used to find the value of a previous row or the next row. 

select * ,LEAD(age) OVER (ORDER BY salary DESC) as "lead_age"
from emp;

select * ,LAG(age) OVER (ORDER BY salary DESC) as "lead_age"
from emp;

-- coomon tasble exopressions 
cte is temporaray named result set created using a simple select statement hat can 
be further used un subsequent select statements 

-- with clause can include one or more cte in a DATABASE
-- syntax 

/*

WITH my_cte AS 
(select a,b,c from table_1)
select a,c from my_cte

can be used in subsequnt select statements 

*/

