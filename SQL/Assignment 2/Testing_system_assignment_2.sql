-- Thêm foreign key Bảng Account
alter table account
add foreign key(DepartmentID) references Department(DepartmentID);
alter table account
add foreign key(PositionID) references`Position`(PositionID);
-------------------------------------------------------------
-- Thêm foreign key  Bảng GroupAccount
alter table groupaccount
add foreign key(GroupID) references `Group`(GroupID);
alter table groupaccount
add foreign key(AccountID) references `Account`(AccountID);
-------------------------------------------------------------
-- Thêm foreign key Bảng Question
alter table Question
add foreign key(TypeID) references TypeQuestion(TypeID);
alter table Question
add foreign key(CategoryID) references CategoryQuestion(CategoryID);
-----------------------------------------------------------------------
-- Thêm foreign key Bảng Answer
alter table Answer
add foreign key(QuestionID) references Question(QuestionID);
-------------------------------------------------------------------
-- Thêm foreign key Bảng Exam
alter table Exam
add foreign key(CategoryID) references  CategoryQuestion(CategoryID);
--------------------------------------------------------------------------
-- Thêm foreign key Bảng ExamQuestion
alter table ExamQuestion
add foreign key(QuestionID) references  Question(QuestionID);
alter table ExamQuestion
add foreign key(ExamID) references Exam(ExamID);
----------------------------------------------------------------------
-- Thêm bản ghi vào bảng Department
Insert into Department(DepartmentID, DepartmentName)
Values(1,'Marketing'),
	  (2,'Sale'),
      (3,'Bảo vệ'),
      (4,'Nhân sự'),
      (5,'Kỹ thuật'),
      (6,'Tài chính'),
      (7,'Giám đốc'),
      (8,'Phó giám đốc'),
      (9,'Thư kí');
------------------------------------------------------------
-- Thêm bản ghi vào bảng Position
Insert into `Position`(PositionID, PositionName)
Values(1,'Dev'),
	  (2,'Test'),
      (3,'Scrum Master'),
      (4,'PM');
------------------------------------------------------------
-- Thêm bản ghi vào bảng Account
Insert into `Account`(AccountID, Email, UserName, FullName, DepartmentID, PositionID, CreateDate)
Values(1,'PM@gmail.com','PM1','Harry Potter',8,4,'2021-02-20'),
	  (2,'Tony@gmail.com','IronMan','Tony Stark',5,3,'2021-12-15'),
      (3,'Wade@gmail.com','DeadPool','Wade Wilson',3,2,'2022-01-01'),
      (4,'Natasha@gmail.com','BlackWidow','Natasha romanoff',9,1,'2021-07-26'),
      (5,'Banner@gmail.com','Hulk','Bruce Banner',4,1,'2020-09-16');
---------------------------------------------------------------------------
-- Thêm bản ghi vào bảng Group
Insert into `Account`(GroupID, GroupName, CreatorID, CreateDate)
Values(1,'Group1',1,'2021-03-20'),
	  (2,'Group2',2,'2021-7-16'),
      (3,'Group3',3,'2022-02-01'),
      (4,'Greoup4',4,'2021-05-19'),
      (5,'Group5',5,'2020-03-17');
-----------------------------------------------------------------------
-- Thêm bản ghi vào bảng GroupAccount	 
Insert into `GroupAccount`(GroupID, AccountID, JoinDate)
Values(1,2,'2021-04-20'),
	  (2,3,'2021-8-15'),
      (3,5,'2022-03-02'),
      (4,4,'2021-06-20'),
      (5,1,'2020-03-20');
-----------------------------------------------------------------------
-- Thêm bản ghi vào bảng TypeQuestion
Insert into `typequestion`(TypeID, TypeName)
Values(1,'Essay'),
	  (2,'Essay'),
      (3,'Multiple-Choice'),
      (4,'Essay'),
      (5,'Multiple-Choice');
-------------------------------------------------------------------------
-- Thêm dữ liệu vào bảng CategoryQuestion
Insert into `CategoryQuestion`(CategoryID, CategoryName)
Values(1,'Java'),
	  (2,'SQL'),
      (3,'.NET'),
      (4,'Postman'),
      (5,'Ruby');
--------------------------------------------------------------------------
-- Thêm dữ liệu vào bảng Question
Insert into `Question`(QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate)
Values(1,'What is java',1,2,1,'2020-09-12'),
	  (2,'What is databsae',2,1,2,'2021-05-15'),
      (3,'What is .NET',3,5,3,'2019-07-17'),
      (4,'What is Postman',4,3,4,'2021-03-26'),
      (5,'What is Ruby',5,4,5,'2020-09-12');
-----------------------------------------------------------------------
-- Thêm dữ liệu vào bảng Answer
Insert into `Answer`(AnswerID,Content,QuestionID,isCorrect)
Values(1,'Java is...',1,'true'),
	  (2,'SQL is...',2,'false'),
      (3,'.NET is...',3,'false'),
      (4,'Postman is...',4,'true'),
      (5,'Ruby is...',5,'false');
---------------------------------------------------------
-- Thêm dữ liệu vào bảng Exam
Insert into `Exam`(ExamID,`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)
Values(1,101,'Exam1',5,'15',1,'2021-12-12'),
	  (2,102,'Exam2',1,'45',2,'2021-11-2'),
      (3,103,'Exam3',4,'60',3,'2021-10-22'),
      (4,104,'Exam4',3,'15',4,'2021-11-12'),
      (5,105,'Exam5',2,'30',5,'2021-12-09');
---------------------------------------------------------
-- Thêm dữ liệu vào bảng ExamQuestion
Insert into `ExamQuestion`(ExamID,QuestionID)
Values(1,5),
	  (2,4),
      (3,1),
      (4,3),
      (5,2);