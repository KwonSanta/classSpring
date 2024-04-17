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