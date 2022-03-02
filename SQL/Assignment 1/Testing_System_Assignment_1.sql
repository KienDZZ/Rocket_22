create database Testing_System_Assignment_1;
------------------------------------------------
create table Department(
DepartmentID int not null auto_increment,
DepartmentName varchar(100),
primary key(DepartmentID)
);
------------------------------------------------
create table `position`(
PositionID int not null auto_increment,
PositionName Enum('Dev', 'Test', 'Scrum Master', 'PM'),
primary key(PositionID)
);
-------------------------------------------------------
create table Account(
AccountID int not null auto_increment,
Email varchar(100),
UserName varchar(100),
FullName varchar(100),
DepartmentID int,
PositionID int,
CreateDate Datetime not null default current_timestamp,
primary key(AccountID)
);
------------------------------------------------------
create table `Group`(
GroupID int not null auto_increment,
GroupName varchar(100),
CreatorID int,
CreateDate TimeStamp not null default current_timestamp,
constraint PK_Group primary key(GroupID, CreatorID)
);
---------------------------------------------------------
create table `GroupAccount`(
GroupID int,
AccountID Varchar(100),
JoinDate TimeStamp not null default current_timestamp
);
------------------------------------------------------------
create table TypeQuestion(
TypeID int not null auto_increment,
TypeName Enum('Essay', 'Multiple-Choice'),
primary key(TypeID)
);
-----------------------------------------------------------
create table CategoryQuestion(
CategoryID int not null auto_increment,
CategoryName Enum('Java','.NET', 'SQL', 'Postman', 'Ruby'),
primary key(CategoryID)
);
-------------------------------------------------------------
create table Question(
QuestionID int not null auto_increment,
Content varchar(255),
CategoryID int,
TypeID int,
CreatorID int,
CreateDate TimeStamp not null default current_timestamp,
primary key(QuestionID)
);
-----------------------------------------------------------------
create table Answer(
AnswerID int not null auto_increment,
Content varchar(255),
QuestionID int,
isCorrect enum('true','false'),
primary key(AnswerID)
);
-------------------------------------------------------------------
create table Exam(
ExamID int not null auto_increment,
Code int,
Title varchar(100),
CategoryID int,
Duration varchar(20),
CreatorID int,
CreateDate datetime not null default current_timestamp,
primary key(ExamID)
);
-----------------------------------------------------------------------
create table ExamQuestion(
ExamID int not null,
QuestionID int
);