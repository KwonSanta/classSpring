USE w3schools;

SELECT *
FROM Products;

DESC Products;

# AS : 컬럼 (또는 테이블)에 별칭을 줌
# 생략 가능
SELECT ProductID   AS id,
       ProductName AS name,
       Price       AS 가격
FROm Products;

SELECT ProductID   id,
       ProductName name,
       Price       가격
FROm Products;

SELECT *
FROM Customers
WHERE CustomerID = 3;

SELECT *
FROM Customers;