Learning and Development:

Table creation queries:

1)Employee Table

CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    Emp_FirstName VARCHAR(50),
    Emp_LastName VARCHAR(50),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    Domain_id INT,
    Teams_id INT,
    FOREIGN KEY (Domain_id) REFERENCES Domain(Domain_Id),
    FOREIGN KEY (Teams_id) REFERENCES Teams(Teams_id)
);

2)Domain Table

CREATE TABLE Domain (
    Domain_Id INT PRIMARY KEY,
    Domain_Name VARCHAR(100)
);

3)Trainer Table

CREATE TABLE Trainer (
    Trainer_id INT PRIMARY KEY,
    Trainer_Name VARCHAR(50),
    Contact VARCHAR(15),
    Email VARCHAR(100),
    Domain_Id INT,
    FOREIGN KEY (Domain_Id) REFERENCES Domain(Domain_Id)
);

4) Teams Table

CREATE TABLE Teams (
    Teams_id INT PRIMARY KEY,
    Trainer_id INT,
    FOREIGN KEY (Trainer_id) REFERENCES Trainer(Trainer_id)
);

5) Course Table

CREATE TABLE Courses (
    Course_Id INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration INT,
    Domain_Id INT,
    FOREIGN KEY (Domain_Id) REFERENCES Domain(Domain_Id)
);

Insert values queries:

1) Domain table
INSERT INTO Domain (Domain_Id, Domain_Name) 
VALUES 
    (1, 'ADM'), 
    (2, 'BAT-DA'), 
    (3, 'Infra'), 
    (4, 'ERP'), 
    (5, 'Testing');

2) Trainer table
-- Trainer
INSERT INTO Trainer (Trainer_id, Trainer_Name, Contact, Email, Domain_Id) 
VALUES 
    (101, 'John Doe', '1234567890', 'john@example.com', 1), -- ADM
    (102, 'Jane Smith', '9876543210', 'jane@example.com', 2), -- BAT-DA
    (103, 'Michael Lee', '5551113333', 'michael@example.com', 3), -- Infra
    (104, 'Susan Park', '4442226666', 'susan@example.com', 4), -- ERP
    (105, 'Robert Brown', '9998887777', 'robert@example.com', 5); -- Testing

3)courses table

-- Courses
INSERT INTO Courses (Course_Id, Course_Name, Duration, Domain_Id) 
VALUES 
    -- Multiple courses for ADM
    (301, 'Agile Methodologies', 20, 1), 
    (302, 'Project Management with Scrum', 25, 1),

    -- Multiple courses for BAT-DA
    (303, 'Data Analysis with Python', 30, 2), 
    (304, 'Advanced SQL for Data Analytics', 35, 2),

    -- Multiple courses for Infra
    (305, 'Cloud Infrastructure Basics', 25, 3), 
    (306, 'Network Security Essentials', 20, 3),

    -- Multiple courses for ERP
    (307, 'SAP ERP Fundamentals', 35, 4), 
    (308, 'ERP Implementation Strategies', 40, 4),

    -- Multiple courses for Testing
    (309, 'Software Testing Essentials', 15, 5), 
    (310, 'Automation Testing with Selenium', 20, 5);


4)Employee table

INSERT INTO Employee (Emp_id, FirstName, LastName, Contact, Email, Domain_id, Teams_id) 
VALUES 
    (1, 'Alice', 'Brown', '1231231234', 'alice@example.com', 1, 201), -- ADM
    (2, 'Bob', 'White', '9879879876', 'bob@example.com', 2, 202), -- BAT-DA
    (3, 'Charlie', 'Green', '1112223333', 'charlie@example.com', 3, 203), -- Infra
    (4, 'Diana', 'Black', '4445556666', 'diana@example.com', 4, 204), -- ERP
    (5, 'Eve', 'Gray', '7778889999', 'eve@example.com', 5, 205); -- Testing

5)Trainer table

-- Teams
INSERT INTO Teams (Teams_id, Trainer_id) 
VALUES 
    (201, 101),
    (202, 102),
    (203, 103), 
    (204, 104), 
    (205, 105); 

Queries::

1)Retrieve all the data from table

1)SELECT * FROM Domain;
2)SELECT * FROM Trainer;
3)SELECT * FROM Teams;
4)SELECT * FROM Employee;
5)SELECT * FROM Courses;

Queries::


1)Retrieve All Courses by Domain::

SELECT D.Domain_Name, C.Course_Name, C.Duration 
FROM Domain D
JOIN Courses C ON D.Domain_Id = C.Domain_Id
ORDER BY D.Domain_Name, C.Course_Name;


2)List Domains Offering More Than 1 Course::

SELECT D.Domain_Name, COUNT(C.Course_Id) AS Total_Courses 
FROM Domain D
JOIN Courses C ON D.Domain_Id = C.Domain_Id
GROUP BY D.Domain_Name
HAVING COUNT(C.Course_Id) > 1
ORDER BY Total_Courses DESC;

3)Find Domains and Their Trainers Along with Courses

SELECT D.Domain_Name, T.Trainer_Name, C.Course_Name 
FROM Domain D
JOIN Trainer T ON D.Domain_Id = T.Domain_Id
JOIN Courses C ON D.Domain_Id = C.Domain_Id
ORDER BY D.Domain_Name, T.Trainer_Name, C.Course_Name;

4)Fetch employees with their team and trainer details::

SELECT E.Emp_FirstName, E.Emp_LastName, T.Teams_id, Tr.Trainer_Name 
FROM Employee E
JOIN Teams T ON E.Teams_id = T.Teams_id
JOIN Trainer Tr ON T.Trainer_id = Tr.Trainer_id
ORDER BY E.Emp_FirstName;


5)SELECT Course_Name, Domain_Id FROM Courses WHERE Domain_Id IN (SELECT Domain_Id FROM Domain WHERE Domain_Name IN ('ERP', 'ADM'));
 
6)UPDATE Trainer SET Domain_Id = (SELECT Domain_Id FROM Domain WHERE Domain_Name = 'Testing') WHERE Domain_Id IS NULL;

7)List employees, their domain, and their assigned courses::

SELECT E.Emp_FirstName, E.Emp_LastName, D.Domain_Name, C.Course_Name 
FROM Employee E
JOIN Domain D ON E.Domain_id = D.Domain_Id
JOIN Courses C ON D.Domain_Id = C.Domain_Id
ORDER BY D.Domain_Name, E.Emp_FirstName;
