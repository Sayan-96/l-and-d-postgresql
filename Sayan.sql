ALTER TABLE Courses DROP COLUMN Domain_Id;
 
UPDATE Teams SET Trainer_id = 102 WHERE Teams_id = 201;
 
SELECT Tr.Trainer_Name, COUNT(T.Teams_id) AS Total_Teams 
FROM Trainer Tr 
LEFT JOIN Teams T ON Tr.Trainer_id = T.Trainer_id 
GROUP BY Tr.Trainer_Name;
 
SELECT First_Name, LastName, Contact FROM Employee WHERE Contact LIKE '123%';
 
SELECT T.Trainer_id, Tr.Trainer_Name, COUNT(T.Teams_id) AS Teams_Managed 
FROM Teams T 
JOIN Trainer Tr ON T.Trainer_id = Tr.Trainer_id 
GROUP BY T.Trainer_id, Tr.Trainer_Name;
 
UPDATE Employee SET Teams_id = 203 WHERE Emp_id = 2;
 
SELECT COUNT(Emp_id) AS Total_Employees FROM Employee;
