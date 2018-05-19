CREATE TABLE Majors
(
  MajorID INT PRIMARY KEY IDENTITY,
  Name NVARCHAR(50)
)

CREATE TABLE Students
(
  StudentID INT PRIMARY KEY IDENTITY,
  StudentNumber NVARCHAR(50) NOT NULL,
  StudentName NVARCHAR(50) NOT NULL,
  MajorID INT REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
  PaymentID INT PRIMARY KEY IDENTITY,
  PaymentDate DATE NOT NULL,
  PaymentAmount MONEY NOT NULL,
  StudentID INT REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
  SubjectID INT PRIMARY KEY IDENTITY,
  SubjectName NVARCHAR(50)
)

CREATE TABLE Agenda
(
  StudentID INT,
  SubjectID INT,

  CONSTRAINT PK_Agenda
  PRIMARY KEY (StudentID,SubjectID),

  CONSTRAINT PK_Agenda_Students
  FOREIGN KEY (StudentID)
  REFERENCES Students(StudentID),

  CONSTRAINT PK_Agenda_Subjects
  FOREIGN KEY (SubjectID)
  REFERENCES Subjects(SubjectID),


)
