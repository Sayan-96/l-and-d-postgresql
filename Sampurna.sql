ALTER TABLE Teams ADD Creation_Date DATE;

ALTER TABLE Courses ADD Status VARCHAR(20) DEFAULT 'Active';

UPDATE Courses SET Course_Name = 'Python for Beginners' WHERE Course_Id = 303;

SELECT emp_firstname, emp_lastname FROM Employee WHERE Teams_id IS NULL;

SELECT Trainer_Name FROM Trainer WHERE Domain_Id != (SELECT Domain_Id FROM Domain WHERE Domain_Name = 'BAT-DA');

SELECT Course_Name FROM Courses WHERE Domain_Id IS NULL;

UPDATE Teams SET Trainer_id = 105 WHERE Teams_id = 203;
