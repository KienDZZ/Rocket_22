-- question 2
select departmentname 
from department;
-- question 3
select departmentid
from department
where departmentname = 'sale';
-- question 5
select fullname
from `account`
where length(fullname) =(Select max(length(fullname)) from `account`) and DepartmentID =3;
-- question 4
select fullname
from `account`
where length(fullname) =(Select max(length(fullname)) from `account`);
-- question 6
select groupname
from `group`
where createdate < '2019-12-20';
-- question 8
select `code`
from exam
where duration > 60 and createdate < '2019-12-20';
-- question 7
select questionid,count(questionid) as socauhoi
from answer
group by questionid 
having count(questionid) >=1;
-- question 9
select groupname, CreateDate
from `group`
order by CreateDate desc
limit 5;
-- question 10
select count(fullname) as Sonhanvien
from `account`
where DepartmentID =2;
-- question 11
select fullname
from `account`
where substring_index(fullname,' ',-1) like 'p%r'
limit 1;
-- question 12
delete from exam
where createdate < '2021-11-02';
-- question 13
delete from question
where content like 'câu hỏi%';
-- question 14
update `account`
set fullname = 'Nguyễn Bá Lộc' , email ='loc.nguyenba@vti.com.vn'
where accountId = 5;
-- question 15
update groupaccount
set accountid = 5
where groupid =4;


