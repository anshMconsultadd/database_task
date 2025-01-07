# Database Concepts README

## 1. Introduction to Databases
- **History and evolution:** Understand the journey from file-based systems to modern databases.
- **Types:** Relational (structured tables) vs. Non-relational (flexible schemas).
- **DBMS:** Tools for creating, managing, and interacting with databases.
- **SQL vs. NoSQL:** SQL for structured data; NoSQL for flexibility and scalability.

## 2. Relational Database Fundamentals
- **Database design:** Plan schemas for efficient data storage and retrieval.
- **ER model:** Visualize data entities and relationships.
- **Tables:** Structures with rows and columns to store data.
- **Keys:** Primary keys for uniqueness, foreign keys for relationships.
- **Normalization:** Organize data to reduce redundancy (1NF, 2NF, 3NF, BCNF).
- **Denormalization:** Use for performance trade-offs when needed.

## 3. Basic SQL Commands
- **DDL:** Create, modify, or delete database structures (CREATE, ALTER, DROP).
- **DML:** Manipulate data (SELECT, INSERT, UPDATE, DELETE).
- **DCL:** Manage permissions (GRANT, REVOKE).
- **TCL:** Control transactions (BEGIN, COMMIT, ROLLBACK).

## 4. Advanced SQL Queries
- **Joins:** Combine rows from multiple tables (Inner, Outer, Cross).
- **Subqueries:** Nested queries for advanced filtering.
- **Set operations:** Combine results (UNION, INTERSECT, EXCEPT).
- **Window functions:** Perform row-wise calculations (ROW_NUMBER, RANK).
- **CTEs:** Simplify complex queries with temporary result sets.
- **Pivoting:** Transform rows into columns and vice versa.

## 5. Database Design and Optimization
- **Indexing:** Speed up queries (clustered, non-clustered, covering).
- **Query optimization:** Techniques for efficient query execution.
- **Explain plans:** Analyze and optimize query execution paths.
- **Partitioning/Sharding:** Divide data for performance and scalability.
- **Concurrency:** Ensure data consistency in multi-user environments.
- **Deadlocks:** Detect and resolve resource contention.

## 6. Stored Procedures and Functions
- **Stored procedures:** Encapsulate logic for reusability.
- **Functions:** Return values for calculations or transformations.
- **Triggers:** Automate actions on data changes.
- **Error handling:** Manage exceptions in procedures.
