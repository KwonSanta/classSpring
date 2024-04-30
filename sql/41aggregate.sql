USE w3schools;
# aggregate function : 집계 함수
# 평균, 합계, 개수, 최대값, 최소값
# NULL 은 집계시 제외 됨

# COUNT : 개수
SELECT COUNT(EmployeeID)
FROM Employees;
SELECT COUNT((Notes))
FROM Employees;
SELECT COUNT(DISTINCT Country)
FROM Customers;

# MIN : 최솟값
# MAX : 최댓값
SELECT MAX(Products.Price)
FROM Products;
SELECT MIN(Products.Price)
FROM Products;
-- 가장 어린 사람의 생년월일
SELECT MAX(Employees.BirthDate)
FROM Employees;
-- 가장 나이가 많은 사람의 생년월일
SELECT MIN(Employees.BirthDate)
FROM Employees;

# SUM : 합계
SELECT SUM(Products.Price)
FROM Products;

# AVG : 평균
SELECT AVG(Products.Price)
FROM Products;