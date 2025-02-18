--Library Management System: Database

-- Creating Tables
-- Creating Tables
-- Creating Tables


-- Create Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    publication_date DATE,
    availability_status VARCHAR(20) -- 'Available' or 'Not Available'
);

-- Create Book_Authors Table (Many-to-Many relationship)
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    join_date DATE,
    email VARCHAR(100)
);

-- Create Transactions Table (One-to-Many with Members and Books)
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    status VARCHAR(20), -- 'borrowed' or 'returned'
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

--1. Insert, Update, and Delete Data
--1. Insert, Update, and Delete Data



--Inserting data



-- Insert Authors
INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (1, 'John', 'Doe');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (2, 'Alice', 'Smith');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (3, 'James', 'Miller');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (4, 'Rachel', 'Adams');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (5, 'Michael', 'Green');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (6, 'Emily', 'Clark');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (7, 'David', 'Walker');

INSERT INTO Authors (author_id, first_name, last_name) 
VALUES (8, 'Sarah', 'Young');

--Inserting into Books

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (1, 'The Great Adventure', 'Fiction', TO_DATE('2010-05-10', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (2, 'Oracle for Beginners', 'Programming', TO_DATE('2015-08-20', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (3, 'Learning Python', 'Programming', TO_DATE('2022-03-05', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (4, 'The Mystery of Time', 'Mystery', TO_DATE('2018-11-10', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (5, 'Deep Learning 101', 'Technology', TO_DATE('2020-07-15', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (6, 'JavaScript for Kids', 'Programming', TO_DATE('2017-05-22', 'YYYY-MM-DD'), 'Checked out');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (7, 'Intro to Machine Learning', 'Technology', TO_DATE('2021-03-19', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (8, 'Detective’s Journal', 'Mystery', TO_DATE('2019-08-12', 'YYYY-MM-DD'), 'Available');
-- Add books published in the last 7 days
INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (9, 'Advanced SQL', 'Programming', TO_DATE('2025-02-14', 'YYYY-MM-DD'), 'Available');

INSERT INTO Books (book_id, title, genre, publication_date, availability_status) 
VALUES (10, 'Web Development for Beginners', 'Technology', TO_DATE('2025-02-17', 'YYYY-MM-DD'), 'Available');


--Insert into Book_Authors

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (1, 1);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (2, 2);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (3, 3);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (4, 4);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (5, 5);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (6, 6);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (7, 7);

INSERT INTO Book_Authors (book_id, author_id) 
VALUES (8, 8);


--Insert into Members Table

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (1, 'Emma', 'Johnson', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'emma.johnson@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (2, 'Lucas', 'Brown', TO_DATE('2023-06-20', 'YYYY-MM-DD'), 'lucas.brown@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (3, 'Charlie', 'Wilson', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'charlie.wilson@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (4, 'Sophia', 'Lee', TO_DATE('2023-03-11', 'YYYY-MM-DD'), 'sophia.lee@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (5, 'Benjamin', 'Miller', TO_DATE('2021-09-25', 'YYYY-MM-DD'), 'benjamin.miller@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (6, 'Isabella', 'Davis', TO_DATE('2022-04-14', 'YYYY-MM-DD'), 'isabella.davis@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (7, 'William', 'Martinez', TO_DATE('2022-12-07', 'YYYY-MM-DD'), 'william.martinez@example.com');

INSERT INTO Members (member_id, first_name, last_name, join_date, email) 
VALUES (8, 'Grace', 'Hernandez', TO_DATE('2021-11-30', 'YYYY-MM-DD'), 'grace.hernandez@example.com');

--Insert into Transactions Table

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (1, 1, 1, TO_DATE('2025-02-05', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (2, 2, 2, TO_DATE('2025-02-10', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), 'returned');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (3, 3, 3, TO_DATE('2025-02-08', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (4, 1, 3, TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'returned');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (5, 4, 4, TO_DATE('2025-02-11', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (6, 5, 5, TO_DATE('2025-02-03', 'YYYY-MM-DD'), TO_DATE('2025-02-06', 'YYYY-MM-DD'), 'returned');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (7, 6, 6, TO_DATE('2025-02-12', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (8, 7, 7, TO_DATE('2025-02-14', 'YYYY-MM-DD'), NULL, 'borrowed');

-- Add more transactions for member 1 (Emma Johnson)
INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (9, 1, 2, TO_DATE('2025-02-12', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (10, 1, 3, TO_DATE('2025-02-14', 'YYYY-MM-DD'), NULL, 'borrowed');

INSERT INTO Transactions (transaction_id, member_id, book_id, borrow_date, return_date, status)
VALUES (11, 1, 4, TO_DATE('2025-02-16', 'YYYY-MM-DD'), NULL, 'borrowed');


--Update querries
--Update querries

-- Update a book's availability status
UPDATE Books
SET availability_status = 'Checked out'
WHERE book_id = 1;

-- Update a member's email
-- Update a member's email



UPDATE Members
SET email = 'emma.newemail@example.com'
WHERE member_id = 1;

-- Delete a transaction
-- Delete a transaction
-- Delete a transaction


DELETE FROM Transactions
WHERE transaction_id = 9;

-- Delete a book and its associations
DELETE FROM Book_Authors
WHERE book_id = 9;

DELETE FROM Books
WHERE book_id = 9;

--2. Perform Joins to Retrieve Related Data Across Tables
--2. Perform Joins to Retrieve Related Data Across Tables

-- Retrieve all books and their corresponding authors
SELECT 
    b.title, 
    a.first_name || ' ' || a.last_name AS "Author Names"
FROM 
    Books b
JOIN 
    Book_Authors ba ON b.book_id = ba.book_id
JOIN 
    Authors a ON ba.author_id = a.author_id;



--3. Use DDL, DML, DCL, and TCL Operations

-- Create a new table for Publishers
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- Alter Books table to add a column for publisher_id
ALTER TABLE Books ADD publisher_id INT;

-- Add a foreign key constraint on publisher_id in Books table
ALTER TABLE Books 
ADD CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id);

-- To safely drop Publishers table, first remove the foreign key constraint
ALTER TABLE Books DROP CONSTRAINT fk_publisher;

-- Now, drop the Publishers table
DROP TABLE Publishers;


--DCL (Data Control Language)
--DCL (Data Control Language)

-- Step 1: Create the user if it doesn't exist
CREATE USER librarian_user IDENTIFIED BY a123;

-- Step 2: Grant SELECT privilege on Books to a specific user
GRANT SELECT ON Books TO librarian_user;


-- Step 3:Revoke the SELECT privilege from librarian_user
REVOKE SELECT ON Books FROM librarian_user;


--TCL (Transaction Control Language)


-- Commit the current transaction
COMMIT;

-- Rollback the current transaction
ROLLBACK;


--4. Execute Basic SQL Commands (SELECT, INSERT, UPDATE, DELETE)
--4. Execute Basic SQL Commands (SELECT, INSERT, UPDATE, DELETE)
--4. Execute Basic SQL Commands (SELECT, INSERT, UPDATE, DELETE)

--SELECT:

-- Select all books
SELECT * FROM Books;

-- Select all transactions where the status is 'borrowed'
SELECT * FROM Transactions
WHERE status = 'borrowed';

--INSERT: Already covered above.
--
--UPDATE: Already covered above.
--
--DELETE: Already covered above.




--5. Perform Joins and Subqueries
--5. Perform Joins and Subqueries
--5. Perform Joins and Subqueries


-- Find books that are currently borrowed
SELECT title
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Transactions
    WHERE status = 'borrowed'
);

--6. Identify Records Created in the Past Week
--6. Identify Records Created in the Past Week
--6. Identify Records Created in the Past Week


-- Find books added in the past week
SELECT title
FROM Books
WHERE publication_date > SYSDATE - INTERVAL '7' DAY;



--7. Write a Query to Find Records Added in the Past 7 Days
--7. Write a Query to Find Records Added in the Past 7 Days
--7. Write a Query to Find Records Added in the Past 7 Days


SELECT title
FROM Books
WHERE publication_date > SYSDATE - INTERVAL '7' DAY;



--8. Retrieve the Top 5 Highest Values in Each Category
--8. Retrieve the Top 5 Highest Values in Each Category
--8. Retrieve the Top 5 Highest Values in Each Category


SELECT * 
FROM Transactions
ORDER BY borrow_date DESC
FETCH FIRST 5 ROWS ONLY;



--9. Retrieve Records Where an Entity Has More Than 3 Related Transactions
--9. Retrieve Records Where an Entity Has More Than 3 Related Transactions
--9. Retrieve Records Where an Entity Has More Than 3 Related Transactions

-- Find members with more than 3 transactions
SELECT m.first_name, m.last_name, COUNT(t.transaction_id) AS transaction_count
FROM Members m
JOIN Transactions t ON m.member_id = t.member_id
GROUP BY m.first_name, m.last_name
HAVING COUNT(t.transaction_id) > 3;
