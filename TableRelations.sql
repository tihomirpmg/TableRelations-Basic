USE TableRelations

CREATE TABLE Persons (
	PersonID INT IDENTITY,
	FirstName VARCHAR(50) NOT NULL,
	Salary DECIMAL(10, 2),
	PassportID INT
)

CREATE TABLE Passports (
	PassportID INT IDENTITY(101, 1),
	PassportNumber VARCHAR(50) NOT NULL
)

INSERT INTO Persons VALUES
('Roberto', 43300, 102),
('Tom', 56100, 103),
('Yana', 60200, 101)

INSERT INTO Passports VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

ALTER TABLE Persons
ADD PRIMARY KEY (PersonID)

ALTER TABLE Passports
ADD PRIMARY KEY (PassportID)

ALTER TABLE Persons
ADD FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)

CREATE TABLE Manufacturers (
	ManufacturerID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(30) NOT NULL,
	EstablishedOn DATE
)

CREATE TABLE Models (
	ModelID INT PRIMARY KEY IDENTITY(101, 1),
	Name VARCHAR(30) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO Models VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

CREATE TABLE Students (
	StudentID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Exams (
	ExamID INT PRIMARY KEY IDENTITY(101, 1),
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE StudentsExams (
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID),
	CONSTRAINT PK_Students_Exams PRIMARY KEY(StudentID, ExamID)
)

INSERT INTO Students VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO Exams VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)

CREATE TABLE Teachers (
	TeacherID INT PRIMARY KEY IDENTITY(101, 1),
	Name VARCHAR(50) NOT NULL,
	ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101)

USE Geography
SELECT m.MountainRange, p.PeakName, p.Elevation FROM Mountains AS m
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC