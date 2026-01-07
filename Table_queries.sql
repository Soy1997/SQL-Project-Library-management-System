--Library management system
--Creating Branch Table
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
branch_id VARCHAR(10) PRIMARY KEY,
manager_id VARCHAR(10),
branch_address VARCHAR(55),
contact_no VARCHAR(10))

ALTER TABLE branch
ALTER COLUMN contact_no TYPE VARCHAR(25);

--Creating Employee Table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
emp_id VARCHAR(10) PRIMARY KEY,
emp_name VARCHAR(25),
position VARCHAR(15),	
salary INT,
branch_id VARCHAR(25)); --FK

--Creating Books Table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books
(
isbn VARCHAR(20) PRIMARY KEY,
book_title VARCHAR(75),
category VARCHAR(10),	
rental_price FLOAT,	
status VARCHAR(20),
author VARCHAR(35),	
publisher VARCHAR(55));

ALTER TABLE Books
ALTER COLUMN category TYPE VARCHAR(20);

--Creating member Table
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
member_id VARCHAR(10) PRIMARY KEY,
member_name	VARCHAR(25),
member_address	VARCHAR(75),
reg_date DATE
);

--creating a table for issue detail
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
issued_id VARCHAR(10) PRIMARY KEY,
issued_member_id VARCHAR(10), --FK
issued_book_name VARCHAR(75),
issued_date	DATE,
issued_book_isbn VARCHAR(25), --FK
issued_emp_id VARCHAR(10) --FK
)

--Creating table for return status
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(75),	
return_date	DATE,
return_book_isbn VARCHAR(20)
)

--Foreign Key
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members (member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES Books (isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_Employees
FOREIGN KEY (issued_emp_id)
REFERENCES Employees (emp_id);

ALTER TABLE Employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch (branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);