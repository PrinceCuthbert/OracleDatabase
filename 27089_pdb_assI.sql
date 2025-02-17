
--PL/SQL Assignment



--Question I

--creating tables
create table Customers(
CustomerID int,
Customer_name varchar2(15),
Email varchar2(50),
City varchar2(30)
);


create table Orders(
orderID int,
OrderDate date,
CustomerID int,
Amount int
);


         -- I.2:Modifying tables to establish integrity

alter table Customers add constraints pk_customer_id primary key (CustomerID);
alter table Orders add constraints pk_order_id primary key (orderID) ;
alter table Orders add constraints fk_customer_id foreign key (CustomerID) references Customers(CustomerID); 


        --Inserting data into tables

        --1 Customer table

insert into Customers(CustomerID,Customer_name,Email,City) values (1,'Alice','alice@example.com','Kigali');
insert into Customers(CustomerID,Customer_name,Email,City) values (2,'Bob','bob@example.com','Musanze');
insert into Customers(CustomerID,Customer_name,Email,City) values (3,'Charlie','charlie@example.com','Huye');
insert into Customers(CustomerID,Customer_name,Email,City) values (4,'David','david@example.com','Rubavu');



        --2 Orders table

insert into Orders(OrderID,CustomerID,OrderDate,Amount) values (101,1,TO_DATE('2024-01-10','YY-MM-DD'),100);
insert into Orders(OrderID,CustomerID,OrderDate,Amount) values (102,2,TO_DATE('2024-02-15','YY-MM-DD'),200);
insert into Orders(OrderID,CustomerID,OrderDate,Amount) values (103,1,TO_DATE('2024-03-05','YY-MM-DD'),150);
insert into Orders(OrderID,CustomerID,OrderDate,Amount) values (104,3,TO_DATE('2024-04-20','YY-MM-DD'),300);


        -- Question I.3(Write a SQL query to find the total amount spent by each customer.)

SELECT c.CustomerID,c.Customer_name,SUM(o.Amount) As "Total Amount Spent" from Customers c 
left join Orders o on c.CustomerID=o.CustomerID Group by c.CustomerID, c.Customer_name;

        -- Question I.4(Write an SQL query to find all orders placed by "Alice")

sel
ect c.Customer_name,o.OrderID,o.CustomerID,o.OrderDate,o.Amount from Orders o Join 
Customers c On o.CustomerID=c.CustomerID Where c.Customer_name='Alice';

        --Question I.5(Write an SQL query to join Customers and Orders tables to display customer names along with their order details. )

select  c.Customer_name,c.CustomerID,o.OrderID,o.OrderDate,o.Amount 
from Orders o Join Customers c on c.CustomerID=o.CustomerID;

          --Question I.6 (Write an SQL query to retrieve a list of all customers along with their order details)
select c.CustomerID,c.Customer_name,c.City,o.OrderID,o.OrderDate,o.Amount 
from Customers c left join Orders o on o.CustomerID=c.CustomerID;

         --Question I.7(Write a query to list all customers who haven't placed any orders. )
         
select c.CustomerID,c.Customer_name,c.Email,c.City from Customers c left join Orders 
o on c.CustomerID=o.CustomerID where o.OrderID IS NULL;     
            
          --Question I.8(Write an SQL query to retrieve a list of all customers along with their order details='Same as Question I.6 ')   

select c.CustomerID,c.Customer_name,c.City,o.OrderID,o.OrderDate,o.Amount 
from Customers c left join Orders o on o.CustomerID=c.CustomerID;



--Question II
--Question II
--Question II


Create table Department(
DepartmentID Number Primary Key,
DepartmentName varchar2(100),
Location varchar2(100) 
);

Create table Employees(
EmployeeID int primary key,
FirstName varchar2(50),
LastName Varchar2(50),
DepartmentID number,
constraint fk_department foreign key (DepartmentID) references Department(DepartmentID)
);



Create table Salary(
SalaryID number Primary Key,
EmployeeID int,
SalaryAmount number(10,2),
PayDate date,
constraint fk_employee foreign key (EmployeeID) references Employees(EmployeeID)
);


--Insert into Department

INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES (1, 'HR', 'Kigali');
INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES (2, 'IT', 'Musanze');
INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES (3, 'Finance', 'Huye');
INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES (4, 'Marketing', 'Rubavu');
INSERT INTO Department (DepartmentID, DepartmentName, Location) VALUES (5, 'Sales', 'Nyanza');


--Insert into Departments

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (101, 'Niyonsaba', 'Jean Marie', 1);
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (102, 'Mugisha', 'Alice', 2); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (103, 'Munezero', 'Emmanuel', 3);
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (104, 'Mukamusoni', 'Claire', 4); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (105, 'Hakizimana', 'Patrice', 5); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (106, 'Gwiza', 'Gisele', 2); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (107, 'Mugisha', 'John', 1); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (108, 'Uwase', 'Aline', 3); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (109, 'Mahoro', 'Viviane', 4); 
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES (110, 'Gakire', 'Emilie', 5); 


-- Insert Data into Salary Table
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (1, 101, 4500.00, TO_DATE('2024-01-15', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (2, 102, 6000.00, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (3, 103, 5200.00, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (4, 104, 4800.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (5, 105, 5500.00, TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (6, 106, 6200.00, TO_DATE('2024-01-25', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (7, 107, 4700.00, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (8, 108, 5100.00, TO_DATE('2024-01-30', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (9, 109, 4900.00, TO_DATE('2024-02-20', 'YYYY-MM-DD'));
INSERT INTO Salary (SalaryID, EmployeeID, SalaryAmount, PayDate) VALUES (10, 110, 5300.00, TO_DATE('2024-01-18', 'YYYY-MM-DD'));



     --Question II:1(Retrieve all employees with their department names)
     
select e.EmployeeID,e.FirstName, e.LastName, d.DepartmentName  from Employees e join Department d on e.DepartmentID=d.DepartmentID;
     
    --Question II:2( employees who receive the highest salary in the database)
    
 SELECT e.EmployeeID, e.FirstName, e.LastName, s.SalaryAmount
FROM Employees e
JOIN Salary s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, s.SalaryAmount
HAVING s.SalaryAmount = (SELECT MAX(SalaryAmount) FROM Salary);


    --Question II:3 (List of all employees who have not received any salary.)


UPDATE Salary
SET SalaryAmount = NULL
WHERE SalaryID = 5 AND EmployeeID = 105;

SELECT e.EmployeeID, e.FirstName, e.LastName, s.SalaryAmount
FROM Employees e
JOIN Salary s ON e.EmployeeID = s.EmployeeID Where s.SalaryAmount is NULL;

    --Question II:4 (Count the number of employees in each department. )
    
 SELECT COUNT(*) AS "Employees per Department", e.DepartmentID, d.DepartmentName FROM 
 Employees e JOIN Department d ON  e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID,  d.DepartmentName;
 
      --Question II:5 (Find employees who work in the "IT" department. )
      
 select e.EmployeeID,e.FirstName,e.LastName,d.DepartmentName from Employees e Join 
 Department d on e.DepartmentID=d.DepartmentID where DepartmentName='IT';
 
      --Question II:6 (Find employees who earn more than 5000. )
      
 select  e.EmployeeID,e.FirstName,e.LastName, AVG(s.SalaryAmount) from Employees e Join Salary s on e.EmployeeID=s.EmployeeID 
 Group by e.EmployeeID,e.FirstName,e.LastName, s.SalaryAmount  Having AVG(s.SalaryAmount)>5000;
 
   --Question II:7 (Retrieve employees who received their salary in January 2024.) 
   
SELECT e.EmployeeID, e.FirstName, e.LastName, s.PayDate FROM Employees e JOIN 
Salary s ON e.EmployeeID = s.EmployeeID WHERE TO_CHAR(s.PayDate, 'YYYY-MM-DD') LIKE '%-01-%';

    --Question II:8 (Count the number of employees in each department='Same as Question II.4 ') 

 SELECT COUNT(*) AS "Employees per Department", e.DepartmentID, d.DepartmentName FROM 
 Employees e JOIN Department d ON  e.DepartmentID = d.DepartmentID GROUP BY e.DepartmentID, d.DepartmentName;    





--Question III
--Question III
--Question III

-- Creating database tables

Create table Students(
StudentID number Primary Key,
FirstName Varchar2(50),
LastName Varchar2(50),
DateOfBirth date,
Gender Varchar2(10),
Contact varchar2(20)
);


Create table Courses(

CourseID number primary key,
CourseName varchar2(50),
Credits Number,
Instructor varchar2(50)
);


Create table Enrollments (
EnrollmentsID number primary key,
StudentID number,
CourseID number,
EnrollmentDate date,
Grade Varchar2(2),
constraint fk_StudentID foreign key (StudentID) references Students(StudentID),
constraint fk_CourseID foreign key (CourseID) references Courses(CourseID)
);

Create table Payments(

PaymentID number primary key,
StudentID number,
AmountPaid number(10,2),
PaymentDate date,
PaymentMethod Varchar2(50),

constraint fk_Payment_StudentID foreign key(StudentID) references Students(StudentID)

);


--Inserting data into tables

-- Insert into Students table
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Contact) VALUES (1, 'Ishimwe', 'Jean Pierre', TO_DATE('1999-02-17', 'YYYY-MM-DD'), 'Male', '0788123456');
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Contact) VALUES (2, 'Ndayishimye', 'Alice', TO_DATE('2002-06-11', 'YYYY-MM-DD'), 'Female', '0787654321');
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Contact) VALUES (3, 'Uwamahoro', 'Claudette', TO_DATE('2005-01-05', 'YYYY-MM-DD'), 'Male', '0789321567');
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Contact) VALUES (4, 'Mugisha', 'Faustin', TO_DATE('2001-11-28', 'YYYY-MM-DD'), 'Female', '0788776543');
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Contact) VALUES (5, 'Uwase', 'Aline', TO_DATE('2004-09-14', 'YYYY-MM-DD'), 'Female', '0786453789');


-- Insert into Courses table
INSERT INTO Courses (CourseID, CourseName, Credits, Instructor) VALUES (1, 'Mathematics', 3, 'Dr. Niyonsaba');
INSERT INTO Courses (CourseID, CourseName, Credits, Instructor) VALUES (2, 'English Literature', 2, 'Mr. Mukeshimana');
INSERT INTO Courses (CourseID, CourseName, Credits, Instructor) VALUES (3, 'Computer Science', 4, 'Prof. Uwimana');
INSERT INTO Courses (CourseID, CourseName, Credits, Instructor) VALUES (4, 'History', 3, 'Ms. Ingabire');
INSERT INTO Courses (CourseID, CourseName, Credits, Instructor) VALUES (5, 'Physics', 4, 'Dr. Gatare');

-- Insert into Enrollments table
INSERT INTO Enrollments (EnrollmentsID, StudentID, CourseID, EnrollmentDate, Grade) VALUES (2, 2, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'B');
INSERT INTO Enrollments (EnrollmentsID, StudentID, CourseID, EnrollmentDate, Grade) VALUES (3, 3, 4, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'C');
INSERT INTO Enrollments (EnrollmentsID, StudentID, CourseID, EnrollmentDate, Grade) VALUES (4, 4, 2, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'B');
INSERT INTO Enrollments (EnrollmentsID, StudentID, CourseID, EnrollmentDate, Grade) VALUES (5, 5, 1, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'A');

-- Insert into Payments table
INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, PaymentMethod) VALUES (1, 1, 5000.00, TO_DATE('2024-01-12', 'YYYY-MM-DD'), 'Bank Transfer');
INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, PaymentMethod) VALUES (2, 2, 4000.00, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Cash');
INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, PaymentMethod) VALUES (3, 3, 3500.00, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 'Mobile Money');
INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, PaymentMethod) VALUES (4, 4, 6000.00, TO_DATE('2024-03-03', 'YYYY-MM-DD'), 'Bank Transfer');
INSERT INTO Payments (PaymentID, StudentID, AmountPaid, PaymentDate, PaymentMethod) VALUES (5, 5, 4500.00, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Cash');


       --  ANSWERING QUESTION NOW
       --  ANSWERING QUESTION NOW
       --  ANSWERING QUESTION NOW

       
       --Question III.1(Show the oldest student in the database.)
       
SELECT FirstName, LastName, DateOfBirth FROM Students ORDER BY DateOfBirth ASCFETCH FIRST 1 ROWS ONLY;
  
       --Question III.2(List all courses with the number of students enrolled in each.)
 
SELECT c.CourseName, COUNT(e.StudentID) AS NumberOfStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;


      --Question III.3(Retrieve the student names along with the courses they are enrolled in.)
 
 
SELECT s.FirstName, s.LastName, c.CourseID, c.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID;

      --Question III.4(Count the total number of students enrolled in each course. )
      
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS "Total students enrolled"
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY c.CourseID, c.CourseName;
    
    
       --Question III.5(Show all students who made payments, including their names and the amount paid. )
       
  Select s.FirstName,s.LastName,p.AmountPaid from Students s Join Payments p 
  On s.StudentID=p.StudentID Group by s.FirstName,s.LastName,p.AmountPaid;
   
      --Question III.6(Show students who haven’t enrolled in any course )

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;
   
        --Question III.7(Identify the course with the highest enrollment.  )
        
        
SELECT c.CourseName, c.CourseID, COUNT(e.StudentID) AS "Total Enrolled"
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY "Total Enrolled" DESC
FETCH FIRST 1 ROWS ONLY;



--Question IV
--Question IV
--Question IV


-- Creating database tables


CREATE TABLE Clients ( 
ClientsID NUMBER PRIMARY KEY, 
FirstName VARCHAR2(50), 
LastName VARCHAR2(50), 
Email VARCHAR2(100), 
PhoneNumber VARCHAR2(15) 
); 


CREATE TABLE Tickets ( 
TicketID NUMBER PRIMARY KEY, 
ClientsID NUMBER, 
EventName VARCHAR2(100), 
EventDate DATE, 
SeatNumber VARCHAR2(10), 
Price NUMBER(10, 2), 
BookingDate DATE, 
constraint fk_ClientID FOREIGN KEY (ClientsID) REFERENCES Clients(ClientsID) 
); 



---- Inserting datas

---- Insert data into Customer table
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (1, 'Emmanuel', 'Niyonzima', 'emmanuel.niyonzima@email.com', '0789123456');
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (2, 'Chantal', 'Mukamana', 'chantal.mukamana@email.com', '0787654321');
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (3, 'Thierry', 'Nkubito', 'thierry.nkubito@email.com', '0786543210');
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (4, 'Juliette', 'Niyonsenga', 'juliette.niyonsenga@email.com', '0788776543');
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (5, 'Patrick', 'Hakizimana', 'patrick.hakizimana@email.com', '0786332456');
INSERT INTO Clients (ClientsID, FirstName, LastName, Email, PhoneNumber) VALUES (6, 'Alice', 'Ishimwe', 'alice.ishimwe@email.com', '0789898765');
--
---- Insert dynamic data into Tickets table with different events and seats
INSERT INTO Tickets (TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate) 
VALUES (10, 1, 'Rwanda National Music Concert', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'A1', 5000.00, TO_DATE('2024-03-20', 'YYYY-MM-DD'));

INSERT INTO Tickets (TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate) 
VALUES (20, 2, 'Tech Conference Rwanda', TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'B2', 6000.00, TO_DATE('2024-03-22', 'YYYY-MM-DD'));

INSERT INTO Tickets (TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate) 
VALUES (30, 3, 'Cultural Dance Showcase', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'C3', 4000.00, TO_DATE('2024-03-24', 'YYYY-MM-DD'));

INSERT INTO Tickets (TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate) 
VALUES (40, 4, 'Rwanda National Music Concert', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'D4', 5000.00, TO_DATE('2024-03-23', 'YYYY-MM-DD'));

INSERT INTO Tickets (TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate) 
VALUES (50, 5, 'Tech Conference Rwanda', TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'E1', 6000.00, TO_DATE('2024-03-25', 'YYYY-MM-DD'));




 
    --  ANSWERING QUESTION NOW
    --  ANSWERING QUESTION NOW
    --  ANSWERING QUESTION NOW
    
  --Question IV:1(List all tickets booked by a specific customer (e.g., John Doe)). 
  
  
SELECT 
    c.ClientsID,
    c.FirstName || ' ' || c.LastName AS FullName,
    t.TicketID,
    COUNT(t.TicketID) AS TicketCount
FROM 
    Clients c JOIN Tickets t ON c.ClientsID = t.ClientsID
WHERE 
    c.FirstName = 'Emmanuel' AND c.LastName = 'Niyonzima'
GROUP BY 
    c.ClientsID, c.FirstName, c.LastName, t.TicketID;

     --Question IV:2(To find the three most expensive tickets.).
     
  SELECT  TicketID, EventName,Price FROM Tickets ORDER BY 
  Price DESC FETCH FIRST 3 ROWS ONLY;
   
   
    --Question IV:3(Retrieve all customers who have not booked any tickets. ).

SELECT c.ClientsID, c.FirstName, c.LastName
FROM Clients c 
LEFT JOIN Tickets t ON c.ClientsID = t.ClientsID
WHERE t.TicketID IS NULL;

      --Question IV:4 (List all events that are scheduled after a specific date (e.g., '2023-12-01'))
      
 SELECT EventName, EventDate 
FROM Tickets 
WHERE EventDate > TO_DATE('2024-04-18', 'YYYY-MM-DD');
     
      --Question IV:5 (Find the average price of tickets booked for each event. )
      
SELECT EventName, AVG(Price) AS AveragePrice
FROM Tickets
GROUP BY EventName;

    --Question IV:6 (Retrieve the details of the latest ticket booked.)
    
SELECT TicketID, ClientsID, EventName, EventDate, SeatNumber, Price, BookingDate
FROM Tickets
ORDER BY BookingDate DESC
FETCH FIRST 1 ROWS ONLY;

   --Question IV:7 (List all customers along with the total amount they have spent on tickets).
 
SELECT c.ClientsID, c.FirstName, c.LastName, 
       SUM(t.Price) AS TotalAmountSpent
FROM Clients c
JOIN Tickets t ON c.ClientsID = t.ClientsID
GROUP BY c.ClientsID, c.FirstName, c.LastName;

    --Question IV:8(Find the event with the highest number of tickets sold. )

SELECT t.EventName, COUNT(t.TicketID) AS TicketsSold
FROM Tickets t
GROUP BY t.EventName
ORDER BY TicketsSold DESC
FETCH FIRST 1 ROWS ONLY;

   



     



 