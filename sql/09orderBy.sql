# 09orderBy.sql

USE w3schools;

# ORDER BY : 조회 순서를 결정
# ORDER BY 컬럼명1, 컬럼명2, ...
SELECT *
FROM Products
ORDER BY ProductID;

# ASC : 오름차순 (기본값)
SELECT *
FROM Products
ORDER BY Price;

# DESC : 내림차순
SELECT *
FROM Products
ORDER BY Price DESC;

# 여러 컬럼 기준
# 먼저 등장하는 순서 기준으로 정렬
SELECT *
FROM Products
ORDER BY CategoryID, Price, ProductName;

SELECT *
FROM Products
ORDER BY CategoryID, Price DESC;

# 컬럼명 대신 컬럼 index
SELECT *
FROM Products
ORDER BY 4, 6;

# 주의 할 점 🔥
# SELECT 에 명시한 컬럼명 순서가 index 를 결정
SELECT ProductName, CategoryID, Price, Unit
FROM Products
ORDER BY 2, 3;
-- ORDER BY CategoryID, Price

# todo : 나이가 많은 직원부터 나이가 적은 직원순으로 직원 조회
SELECT *
FROM Employees
ORDER BY BirthDate;
# todo : 국가명, 도시명 순으로 고객 조회
SELECT *
FROM Customers
ORDER BY Country, City;
# todo : 도시명 순으로 공급자 조회
SELECT *
FROM Suppliers
ORDER BY City;
# todo : First Name 의 역순으로 직원 조회
SELECT *
FROM Employees
ORDER BY FirstName DESC;