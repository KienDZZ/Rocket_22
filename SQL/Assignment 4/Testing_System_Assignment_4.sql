-- question 1
SELECT  `account`.AccountID, `account`.FullName, department.departmentname
FROM `account`
INNER JOIN department 
ON `account`.DepartmentID =  department.DepartmentID;
-- question 2
SELECT AccountID, CreateDate
FROM `account`
WHERE CreateDate > '2010-12-20';
-- question 3
SELECT `account`.accountid,`account`.fullname, `position`.positionname
FROM `account`
INNER JOIN `position`
ON `account`.PositionID = `position`.PositionID
WHERE PositionName = 'dev';
-- question 4
SELECT D.Departmentname, count(a.DepartmentId) as soLuong 
FROM `account`AS A
INNER JOIN department AS D
ON D.Departmentid = A.Departmentid
GROUP BY A.Departmentid
HAVING soLuong >1;
-- question 5
SELECT E.QuestionID, Q.Content FROM examquestion E
INNER JOIN question Q ON Q.QuestionID = E.QuestionID
GROUP BY E.QuestionID
HAVING count(E.QuestionID) = (SELECT MAX(demSoLuong) as soLuongMax 
FROM (SELECT COUNT(E.QuestionID) AS demSoLuong FROM examquestion E
GROUP BY E.QuestionID) AS bangDemSoLuong);
-- question 6
SELECT C.CategoryID, COUNT(Q.CategoryID) as soLanXuatHien
FROM question as Q
INNER JOIN categoryquestion as C
ON Q.CategoryID = C.CategoryID
GROUP BY C.CategoryID;
-- question 7
SELECT Q.QuestionID, Q.Content , count(EQ.QuestionID) as soLan
FROM examquestion EQ
RIGHT JOIN question Q ON Q.QuestionID = EQ.QuestionID
GROUP BY Q.QuestionID;
-- question 8
SELECT Q.QuestionID, Q.Content, count(A.QuestionID) as soLuong FROM answer A
INNER JOIN question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING count(A.QuestionID) = (SELECT max(countQuestion) FROM
(SELECT count(B.QuestionID) AS countQuestion FROM answer B
GROUP BY B.QuestionID) AS countAnswer);
-- question 9
SELECT G.GroupID, COUNT(GA.AccountID) AS soLuongAccount
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
ORDER BY G.GroupID ASC;
-- question 10
SELECT P.PositionID, P.PositionName, COUNT(A.PositionID) AS soLuong
FROM Position P
INNER JOIN `Account` A ON P.PositionID = A.PositionID
GROUP BY P.PositionID
HAVING COUNT(A.PositionID) = (SELECT MIN(Count)
FROM (SELECT
COUNT(P.PositionID) AS Count
FROM Position P
INNER JOIN `Account` A ON P.PositionID = A.PositionID
GROUP BY P.PositionID) AS MinCountP);
-- question 11
SELECT d.DepartmentID,d.DepartmentName, p.PositionName, count(p.PositionName)
FROM `account` a
INNER JOIN department d ON a.DepartmentID = d.DepartmentID
INNER JOIN position p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, p.PositionID;
-- question 12
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS Author, ANS.Content 
FROM question Q
INNER JOIN categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
INNER JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN account A ON A.AccountID = Q.CreatorID
INNER JOIN Answer AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC;
-- question 13
SELECT TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS SL 
FROM question Q
INNER JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
GROUP BY Q.TypeID;
-- question 14
SELECT * FROM `group` g
LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
WHERE GA.AccountID IS NULL;
-- question 15
SELECT * FROM groupaccount ga
RIGHT JOIN `group` g ON ga.GroupID = g.GroupID
WHERE ga.AccountID IS NULL;
-- question 16
SELECT q.QuestionID FROM answer a
RIGHT JOIN question q on a.QuestionID = q.QuestionID
WHERE a.AnswerID IS NULL;
-- question 17
-- a)
SELECT A.FullName FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 1;
-- b)
SELECT A.FullName FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 2;
-- c)
SELECT A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 1
UNION
SELECT A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 2;
-- question 18
-- a)
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5;
-- b)
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;
-- c)
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5
UNION
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;









