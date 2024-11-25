
-- Create the CompanyDB schema
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(100) NOT NULL
);

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    HireDate DATE NOT NULL CHECK (HireDate >= '2000-01-01'),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create Projects Table
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL UNIQUE,
    StartDate DATE NOT NULL,
    EndDate DATE, CHECK (EndDate > StartDate),
    Budget DECIMAL(15, 2) NOT NULL CHECK (Budget > 0)
);

-- Create Assignments Table
CREATE TABLE Assignments (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    HoursWorked DECIMAL(5, 2) NOT NULL CHECK (HoursWorked >= 0),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Create Salaries Table
CREATE TABLE Salaries (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL CHECK (BaseSalary > 0),
    Bonus DECIMAL(10, 2) CHECK (Bonus >= 0),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert into Departments
INSERT INTO Departments (DepartmentName, Location) VALUES
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'Chicago'),
('Marketing', 'Los Angeles');

-- Insert into Employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, DateOfBirth, Email, Gender, HireDate) VALUES
('John', 'Doe', 1, '1985-04-12', 'john.doe@example.com', 'Male', '2010-05-10'),
('Jane', 'Smith', 2, '1990-08-23', 'jane.smith@example.com', 'Female', '2015-07-19'),
('Alice', 'Brown', 3, '1982-11-17', 'alice.brown@example.com', 'Female', '2008-02-25'),
('Bob', 'Johnson', 4, '1979-03-30', 'bob.johnson@example.com', 'Male', '2005-01-15');

-- Insert into Projects
INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget) VALUES
('Website Redesign', '2023-01-01', '2023-12-31', 100000),
('Mobile App Development', '2023-03-01', '2024-02-28', 150000),
('Data Migration', '2022-06-01', '2023-06-30', 50000);

-- Insert into Assignments
INSERT INTO Assignments (EmployeeID, ProjectID, HoursWorked) VALUES
(1, 1, 120),
(2, 2, 250),
(3, 3, 180),
(4, 1, 90);

-- Insert into Salaries
INSERT INTO Salaries (EmployeeID, BaseSalary, Bonus) VALUES
(1, 60000, 5000),
(2, 80000, 7000),
(3, 75000, 6000),
(4, 90000, 10000);

select * from Departments;
select * from Employees;
select * from Projects;
select * from Assignments;
select * from Salaries;


-- 1 . Retrieve all employees in the IT department
	select e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, d.DepartmentName  
    from Employees e 
    left join Departments d
    On d.DepartmentId = e.DepartmentID where DepartmentName ='IT';
    
-- 2. Find employees hired after 2010
	SELECT EmployeeID, FirstName, LastName, HireDate
	FROM Employees
	WHERE HireDate > '2010-12-31';

-- 3. List projects with a budget exceeding $80,000
	select ProjectID, ProjectName,budget from Projects
    where budget>80000;
    
-- 4. Sort employees by their hire date in descending order.
	SELECT EmployeeID, FirstName, LastName, HireDate
	FROM Employees
	ORDER BY HireDate DESC;
    
-- 5. Show projects sorted by their budget in ascending order
	select ProjectID, ProjectName,budget from Projects
    order by budget ASC;
    
-- 6. Count the number of employees in each department
	SELECT COUNT(EmployeeId) FROM employees
    group by DepartmentID;
    
    SELECT e.EmployeeID, e.FirstName, d.DepartmentName
    from employees e
    Join Departments d ON d.DepartmentID = e.DepartmentID
    group by d.DepartmentID;
    
-- 7. Display the top 3 employees with the highest base salary
	SELECT e.EmployeeID, e.FirstName, e.LastName, s.BaseSalary
	FROM Employees e
    join Salaries s ON e.EmployeeID = s.EmployeeID
    order by BaseSalary DESC
    Limit 3;
    
-- 8. Retrieve employee names along with their department names
	select  e.FirstName, e.LastName, d.DepartmentName  
    from Employees e 
    left join Departments d
    On d.DepartmentId = e.DepartmentID ;
    
-- 9. List all assignments, including employee and project details.
	SELECT 
    e.EmployeeID, e.FirstName, e.LastName,
    a.AssignmentID,
    p.ProjectID, p.ProjectName, p.StartDate, p.EndDate  
	FROM Assignments a
	JOIN Employees e ON a.EmployeeID = e.EmployeeID
	JOIN Projects p ON a.ProjectID = p.ProjectID order by e.EmployeeID ASC;


-- 10. Find employees working on the project with the highest budget
	select
    e.EmployeeID, e.FirstName, e.LastName,
    p.ProjectID, p.ProjectName, p.Budget, p.StartDate, p.EndDate  
	FROM Assignments a
	JOIN Employees e ON a.EmployeeID = e.EmployeeID
	JOIN Projects p ON a.ProjectID = p.ProjectID 
    where p.Budget=(select max(budget) from Projects);
    
-- 11. Calculate the age of each employee.
	SELECT Firstname, Lastname, TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS Age 
	FROM Employees;

-- •	12. Calculate the total salary (base + bonus) for each employee
	SELECT e.EmployeeID,  e.FirstName, e.LastName, sum(BaseSalary + Bonus) AS TotalSalary
    from Employees e 
    join Salaries s 
    ON e.EmployeeID = s.EmployeeID
    group by EmployeeID;
    
-- •	Find all employees hired in 2015.
	SELECT EmployeeID, FirstName, LastName, HireDate
	FROM Employees
	WHERE year(HireDate) = '2015';
    
-- •	Retrieve the names of projects ending before December 2023.
	SELECT ProjectName, EndDate from projects
    where EndDate <'2023-12-01';
    
-- •	List employees with base salaries greater than $70,000.
	select e.EmployeeID , e.FirstName, e.LastName, s.BaseSalary
    From Employees e
    join salaries s
	on e.EmployeeID = s.EmployeeID
    where s.BaseSalary > 70000;
    
-- •	Count the number of projects handled by each employee.
	select e.EmployeeID, e.FirstName, e.LastName, count(p.ProjectID) as TotalProject
    from Employees e
    join assignments a on e.EmployeeID = a.EmployeeID
    join projects p on a.ProjectID = p.ProjectID
    group by e.EmployeeID, e.FirstName, e.LastName
    order by e.EmployeeID asc;
    
-- •	List all departments located in "San Francisco."
	SELECT DepartmentID, DepartmentName, Location
    from departments
    where Location='San Francisco';
    
-- •	Display project names along with total hours worked on each.
	SELECT ProjectName, TIMESTAMPDIFF(hour, startDate, endDate) as TotalHourWorked from projects; 
   
   SELECT ProjectID, HoursWorked from assignments
   group by ProjectID; 
   
-- •	Find the highest bonus received by any employee.
	SELECT e.EmployeeID, e.FirstName, e.LastName, s.Bonus AS HighestBonus
	FROM Employees e
	JOIN Salaries s ON e.EmployeeID = s.EmployeeID
	WHERE s.Bonus = (SELECT MAX(Bonus) FROM Salaries);

-- •	Identify projects that lasted for more than 12 months.
	select ProjectName from projects
    where timestampdiff(month,startDate, EndDate) >12;
    
    SELECT ProjectName,  TIMESTAMPDIFF(MONTH, startDate, EndDate) FROM Projects;

-- •	Retrieve all projects starting in 2023.
	SELECT ProjectName FROM projects
    where year(startDate) =2023;
    
-- •	Calculate the total hours worked by each employee across all projects.
	select ProjectName, timestampdiff(hour,startDate, EndDate) from projects;
    
    SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProjectName, SUM(a.HoursWorked) AS TotalHoursWorked
	FROM Employees e
	JOIN Assignments a ON e.EmployeeID = a.EmployeeID
     join projects p on a.ProjectID = p.ProjectID
	GROUP BY e.EmployeeID, e.FirstName, e.LastName
    order by e.EmployeeID asc;

-- •	Find the department with the most employees.
		SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
		FROM Departments d
		JOIN Employees e ON d.DepartmentID = e.DepartmentID
		GROUP BY d.DepartmentName
		ORDER BY EmployeeCount DESC
		LIMIT 1;

        
-- •	List employees who were born before 1985.
		SELECT employeeID, FirstName, LastName from Employees
        where year(DateOfBirth) <1985;
        
       



