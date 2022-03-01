create table trainee(
TraineeID int not null auto_increment,
Full_Name varchar(100),
Birth_Date date,
Gender enum( 'male', 'female', 'unknown'),
ET_IQ int,
ET_Gmath int,
ET_English int,
Training_Class varchar(20),
Evaluation_Notes varchar(255),
primary key(TraineeID),
Check( ET_IQ <=20 and ET_IQ >=0),
Check (ET_Gmath <=20 and ET_Gmath >=0),
Check(ET_English <=20 and ET_English >=0)
);
------------------------------------------------------------------
alter table trainee
add column VTI_Account varchar(100) not null;
alter table trainee
add constraint un_trainee unique(VTI_Account);
-------------------------------------------------------------------
create table Exercise2(
ID int not null auto_increment,
Name varchar(100),
Code varchar(5),
ModifiedDate datetime not null default current_timestamp,
primary key(ID)
);
-------------------------------------------------------------------
create table Exercise3(
ID int not null auto_increment,
Name varchar(100),
BirthDate date,
Gender enum('0', '1'),
IsDeletedFlag enum ('0','1') not null,
primary key(ID)
);