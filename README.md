### 1. What is PostgreSQL?
PostgreSQL is an open-source database system and it is  highly scalable. It supports almost all  common database functions like foreign key, subqueries ,triggers and user-defined types and functions. This makes it very useful for storing and managing data in mobile and web applications. It also supports things like joins ,views, and stored procedures. Essentially, PostgreSQL is powerful and flexible,. It includes most data types of SQL like that of INTEGER, VERCHAR, BOOLEAN. PostgreSQL is a powerful database management system well-suited for the financial industry and other data-intensive applications making it a great choice for many developers.


### 2. What is the purpose of a database schema in PostgreSQL?
A schema is like a storage box that holds different parts of a database, such as tables, data types, functions, and other objects. When a database is created, it starts with a default schema called the public schema. A database can have many of these schemas, each with its own name. Schemas help keep everything organized by separating things into different sections.

Purpose of Using Schema in PostgreSQL: 
 
- Schemas help users to keep database objects organized.
- Multiple users can use the same database without interfering with each other by using different schemas.
- It’s easier to back up data when it's stored in a separate schema.
- If users need to recover data, it's simpler when it's stored in its own schema.
- Users can control what users can access by limiting them to specific schemas.
- Keeping user’s app's data in separate schemas makes managing and organizing it much easier.


### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**Primary Key:** 

A primary key is a column or combination of columns that uniquely identifies a table or row. The condition of a primary key is that it must be unique and NOT NULL, otherwise it cannot be uniquely identified.

Example: 
In a Student Table ‘Student_ID’ is Primary Key.


CREATE TABLE STUDENT 

(
  
  **Student_ID’ INT PRIMARY KEY,**
  
  Student_Name VARCHAR(150),
  
  Student_Phone VARCHAR(15),
  
  );
 
**Foreign Key:**

If the primary key of a column in a table is used as a reference key for a column in another table, it is called a foreign key. A foreign key establishes a relationship between one table and another table. A foreign key can contain a NULL value.

Example: 
In a COURSE_ENROLLMENT Table ‘Student_ID’ is Foreign Key.


CREATE TABLE COURSE_ENROLLMENT (
  
  Enrollment_ID INT PRIMARY KEY,
  
  Course_Name VARCHAR(100),
  
  **FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID)**
);

### 4. What is the difference between the VARCHAR and CHAR data types?


| **CHAR**                                | **VARCHAR**                           |
|-----------------------------------------|---------------------------------------|
| CHAR is fixed length.                  | VARCHAR is variable length.          |
| CHAR(15) example is [ABC.............]            | VARCHAR(15) example is [ABC].                  |
| CHAR uses static memory allocation.    | VARCHAR uses dynamic memory allocation. |
| CHAR is mostly used in  telephone numbers, zip code, ect.                  | VARCHAR is mostly used in for Names          |
| CHAR is faster.                        | VARCHAR is slower.                   |
| CHAR is better for fixed-size data.    | VARCHAR is better for storage space. |


### 5. How can you modify data using UPDATE statements?

**Basic Syntex of UPDATE Operation:**

(

UPDATE Table_Name

SET column = value ,…

WHERE condition

);

Here, 

Table_Name: The table name of that table where want to update data.

Column: the column name whose value want to update.

Value: the new value want to set 

WHERE condition: which specific records want to update specify that.

Example:

 (

UPDATE NID_Info_Table

SET Name = "Mashrafil"

WHERE NID_Number= 45454524242

); 



