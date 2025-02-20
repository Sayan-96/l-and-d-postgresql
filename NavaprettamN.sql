ALTER TABLE Employee RENAME COLUMN Emp_FirstName TO First_Name;
 
SELECT D.Domain_Name, GROUP_CONCAT(E.First_Name, ' ', E.LastName) AS Employees 
FROM Domain D 
JOIN Employee E ON D.Domain_Id = E.Domain_Id 
GROUP BY D.Domain_Name;
 
SELECT Trainer_Name FROM Trainer;
 
SELECT Course_Name, Duration FROM Courses WHERE Duration > 30;
 
SELECT E.First_Name, E.LastName FROM Employee E 
JOIN Teams T ON E.Teams_id = T.Teams_id 
JOIN Trainer Tr ON T.Trainer_id = Tr.Trainer_id 
WHERE Tr.Trainer_Name = 'Jane Smith';
 
UPDATE Employee SET Email = 'newemail@example.com' WHERE Emp_id = 1;
 
ALTER TABLE Employee ADD Date_Of_Joining DATE;
