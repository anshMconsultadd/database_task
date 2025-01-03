-- joins and subqueries 
USE org ;
-- Creating the Client table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50)
);
CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);
CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client(id)
);

INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City)
VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID)
VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 33, 'sushant@yahoo.com', '44554', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

drop table project ;
INSERT INTO Project (id, empID, name, startdate, clientID)
VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'D', '2021-05-01', 4);

-- inner join used to fetch all the enties common in both the tables 
-- all employee id's names aliong with project allocated to them
select e.id,e.fname as first_name ,p.name as project_name from employee as e inner join project as p on e.id=p.empID;

-- left join 
-- used to fetch all the entries from the left table as well as the matching entries from the right table 
--    Retrieve the list of clients along with their respective employees who are managing them, 
 --    including clients who do not have an assigned employee.
 select c.id as client_id , e.id as emp_id ,CONCAT(e.fname,e.lname) as emp_name from client as c left join employee as e 
 on c.empID =e.id ;
 
 -- fetch out each project allciated to each employee along with emloyee with no project 
 select p.name, e.fname,e.lname from project as p right join employee as e on p.empID=e.id;
 
 -- full join is used using UNION of left as well as right join 
 select e.*,p.* from employee as e left join project as p on e.id=p.empID
 union 
  select e.*,p.* from employee as e right join project as p on e.id=p.empID;
 
 
 -- nested subquery 
 -- With a normal nested subquery, the inner SELECT query runs first and executes once, 
 -- returning values to be used by the main query.
 
 select e.* from employee as e where age>(select avg(age) from employee);
 
 -- corelated subqueries A correlated subquery, however, executes once for each candidate 
  -- row considered by the outer query. In other words, the inner query is driven by the outer query.
  
 -- 3 oldest employee
 select * from employee as e1 where 
 2= (select count(distinct(age))
   from employee as e2 where e2.age>e1.age
 );


-- set opeartions 
-- union 
CREATE TABLE brokers (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);
INSERT INTO brokers (id, first_name, last_name, department)
VALUES
(1, 'John', 'Doe', 'HR'),
(2, 'Jane', 'Smith', 'Finance'),
(3, 'Alice', 'Johnson', 'IT'),
(4, 'Bob', 'Brown', 'Marketing');
CREATE TABLE contractors (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);
INSERT INTO contractors (id, first_name, last_name, department)
VALUES
(3, 'Alice', 'Johnson', 'IT'),
(4, 'Bob', 'Brown', 'Marketing'),
(5, 'Charlie', 'Davis', 'HR'),
(6, 'David', 'Wilson', 'Finance');
-- union 
select * from brokers union select * from contractors;

 -- intersection 
 select distinct(brokers.department) from brokers inner join contractors using (id);
 
 -- except 
 select brokers.department from brokers left join contractors on brokers.id=contractors.id
 where contractors.id is null ;
 