# 31join.sql

USE w3schools;

# JOIN : 여러 테이블을 묶어서 조회하는 법

SELECT *
FROM Products;
SELECT *
FROM Categories;

# JOIN 을 안썼을떄
SELECT *
FROM Products
WHERE ProductName = 'Chais';
SELECT *
FROM Categories
WHERE CategoryID = 1;

# JOIN 을 쓰면!!
SELECT ProductName, CategoryName
FROM Products
         JOIN Categories
              ON Products.CategoryID = Categories.CategoryID
WHERE ProductName = 'Chais';
