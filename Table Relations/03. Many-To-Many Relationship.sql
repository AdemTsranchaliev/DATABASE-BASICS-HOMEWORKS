CREATE TABLE Students
(
  StudentId int PRIMARY KEY NOT NULL,
  Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Exams
(
  ExamId int PRIMARY KEY NOT NULL,
  Name NVARCHAR(50) NOT NULL
)

CREATE TABLE StudentsExams
(
  StudentID INT,
  ExamID INT,

  CONSTRAINT PK_StudentsExams
  PRIMARY KEY(StudentID,ExamID),

  CONSTRAINT PK_StudentsExams_StudentID
  FOREIGN KEY (StudentID)
  REFERENCES Students(StudentID),

  CONSTRAINT PK_StudentsExams_Exams
  FOREIGN KEY (ExamID)
  REFERENCES Exams(ExamID)

)