**ALTER TABLE courses ALTER COLUMN Course_Name TYPE VARCHAR(150);
 
**ALTER TABLE Employee ADD Performance_Rating DECIMAL(3, 2);
 
**UPDATE Employee SET Domain_Id = (SELECT Domain_Id FROM Domain WHERE Domain_Name = 'ERP') 
  ALTER TABLE employee ADD date_of_joining DATE;

**ALTER TABLE employee ADD date_of_joining DATE;
  UPDATE employee
  SET date_of_joining = '2020-01-01'
  WHERE emp_id = 1;

  UPDATE employee
  SET date_of_joining = '2021-10-01'
  WHERE emp_id = 2;

  UPDATE employee
  SET date_of_joining = '2022-08-01'
  WHERE emp_id = 3;

  UPDATE employee
  SET date_of_joining = '2020-02-01'
  WHERE emp_id = 4;

  UPDATE employee
  SET date_of_joining = '2024-01-01'
  WHERE emp_id = 5;

**SELECT emp_firstname, emp_lastname, date_Of_Joining FROM employee WHERE date_Of_Joining > '2022-01-01';

 

**SELECT d.domain_Name, SUM(C.duration) AS Total_Duration 
  FROM domain d 
  JOIN courses C ON d.domain_id = C.domain_id 
  GROUP BY d.domain_name;
   

**SELECT AVG(duration) AS Avg_duration FROM courses;


**UPDATE courses SET duration = 40 WHERE course_name = 'Advanced SQL for Data Analytics';
  select * from courses;

 
