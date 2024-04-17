USE w3schools;

# SELECT 컬럼명
# FROM 테이블명
# WHERE 솎아낼 레코드 조건 작성
SELECT CustomerName, City, Country
FROM Customers
WHERE City = 'Berlin';

SELECT CustomerName, City, Country
FROM Customers
WHERE Country = 'Germany';

# WHERE 절 문법
# 컬럼명 비교연산자 값
# 값에 ''로 감싸기 (but, number type 은 생략해도 됨)
SELECT *
FROM Customers
WHERE CustomerID = '1';
SELECT *
FROM Customers
WHERE CustomerID = 1; # 권장

# 비교연산자 : 같다 =, 작다 <, 작거나 같다 <=, 크다 >, 크거나 같다 >=
#           같지 않다 !=, <>
SELECT *
FROM Customers
WHERE CustomerID = 3;
SELECT *
FROM Customers
WHERE CustomerID < 3;
SELECT *
FROM Customers
WHERE CustomerID > 89;
SELECT *
FROM Customers
WHERE CustomerID <= 3;
SELECT *
FROM Customers
WHERE CustomerID >= 89;
SELECT *
FROM Customers
WHERE CustomerID != 1;

# 문자열 형식 (대소문자 구분 없음)
SELECT *
FROM Customers
WHERE CustomerName > 'a';

SELECT *
FROM Customers
WHERE CustomerName > 'S';
SELECT *
FROM Customers
WHERE CustomerName > 's';
SELECT *
FROM Customers
WHERE Country = 'Germany';

# 날짜 형식
DESC Employees;
SELECT *
FROM Employees;
SELECT *
FROM Employees
WHERE BirthDate > '1968-12-03';
SELECT *
FROM Employees
WHERE BirthDate >= '1955-01-01';

# todo: 미국에 있는 공급자(Suppliers) 조회
SELECT *
FROM Suppliers
WHERE Country = 'USA';
# todo: last name 이 Fuller 인 직원(Employees) 조회
SELECT *
FROM Employees
WHERE LastName = 'Fuller';
# todo: CategoryID 가 3번인 상품(Products) 조회
SELECT *
FROM Products
WHERE CategoryID = 3;
# todo: 가격이 20.00 이상인 상품(Products) 조회
SELECT *
FROM Products
WHERE Price >= 20.00;
# todo: 주문일이 1997년 전(1997년 포함안함)인 주문(Orders) 조회
SELECT *
FROM Orders
WHERE OrderDate < '1997-01-01';

SELECT *
FROM Products;