-- question 1
CREATE OR REPLACE VIEW DanhSachSale AS
SELECT department.DepartmentID, account.fullname
FROM Account
INNER JOIN department
ON department.DepartmentID = account.DepartmentID
WHERE DepartmentName = 'Sale';
-- question 2
CREATE OR REPLACE VIEW ThongTin AS
WITH LayThongTin AS(
SELECT count(GA1.AccountID) AS countGA1 FROM groupaccount GA1
GROUP BY GA1.AccountID
)
SELECT A.AccountID, A.Username, count(GA.AccountID) AS SL 
FROM groupaccount GA
INNER JOIN account A ON GA.AccountID = A.AccountID
GROUP BY GA.AccountID
HAVING count(GA.AccountID) = (
SELECT MAX(countGA1) AS maxCount FROM LayThongTin
);
-- question 3
CREATE OR REPLACE VIEW TooLongContent AS
SELECT questionid, content 
FROM question
WHERE length(content) > 300;
SELECT * FROM toolongcontent;
DELETE FROM toolongcontent;
-- question 4
CREATE OR REPLACE VIEW MaxNhanVien AS
WITH SoNhanVien AS(
SELECT count(departmentid) AS soluong1
FROM account a1
GROUP BY a1.departmentid
)
SELECT D.DepartmentID, D.Departmentname, count(A.DepartmentID) AS SL 
FROM department D
INNER JOIN account A ON D.DepartmentID = A.DepartmentID
GROUP BY D.DepartmentID
HAVING SL = (
SELECT MAX(soluong1) AS maxCount FROM SoNhanVien
);
-- question 5
CREATE OR REPLACE VIEW NguoiTao AS
SELECT Q.CategoryID, Q.Content, A.FullName AS Creator
FROM question Q
INNER JOIN `account` A ON A.AccountID = Q.CreatorID
WHERE SUBSTRING_INDEX( A.FullName, ' ', 1 ) = 'Nguyễn';
SELECT * FROM NguoiTao;




