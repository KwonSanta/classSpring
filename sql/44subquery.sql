USE w3schools;

# 1행1열 결과 (scalar)
SELECT AVG(Products.Price)
FROM Products;
SELECT *
FROM Products
WHERE Price >= 28.866364;
-- 위의 2 쿼리를 합치면
SELECT *
FROM Products
WHERE Price >= (SELECT AVG(price)
                FROM Products);
# todo : 1번 카테고리 상품의 평균가격보다 높은 2번 카테고리 상풍명 조회
SELECT *
FROM Products p
         JOIN Categories c
              ON p.CategoryID = c.CategoryID;
SELECT *
FROM Products
WHERE CategoryID = 2
  AND Price >= (SELECT AVG(Price)
                FROM Products
                WHERE CategoryID = 2);

# 여러행 1열 결과
SELECT CustomerID
FROM Customers
WHERE Country = 'Mexico';

# 멕시코에 사는 고객들이 주문한 건들 조회
SELECT *
FROM Orders
WHERE CustomerID IN (SELECT CustomerID
                     FROM Customers
                     WHERE Country = 'Mexico');

SELECT *
FROM Orders o
         JOIN Customers c
              ON o.CustomerID = c.CustomerID
WHERE Country = 'Mexico';

# todo : 1번 카테고리 상품들이 주문된 날짜들 조회
#  1. subQuery
SELECT OrderDate
FROM Orders
WHERE OrderID IN (SELECT OrderID
                  FROM OrderDetails
                  WHERE ProductID IN (SELECT ProductID
                                      FROM Products
                                      WHERE CategoryID = 1));
# todo
#  2. JOIN
SELECT o.OrderDate
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON od.ProductID = p.ProductID
WHERE p.CategoryID = 1;

# 여러행 여러열 결과
SELECT City, Country
FROM Customers
WHERE CustomerID IN (1, 2);

SELECT CustomerName
FROM Customers
WHERE (City, Country)
          IN (('Berlin', 'Germany'),
              ('México D.F.', 'Mexico'));

SELECT CustomerName
FROM Customers
WHERE (City, Country)
          IN (SELECT City, Country
              FROM Customers
              WHERE CustomerID IN (1, 2));

SELECT CustomerID, CustomerName, City, Country
FROM Customers;

SELECT CustomerName, City
FROm (SELECT CustomerID, CustomerName, City, Country
      FROM Customers) AS miniCustomer;

# 상관서브쿼리 (속도가 좀 느린편 -> 조인으로 해결 할 수 있는 지 고민)
# 외부쿼리의 값이 내부 쿼리에 사용 될 때

# 각 고객의 주문 횟수
SELECT CustomerName,
       Country,
       (SELECT COUNT(OrderID)
        FROM Orders o
        WHERE c.CustomerID = o.CustomerID)
FROM Customers c;

SELECT CustomerName, Country, COUNT(OrderID)
FROM Customers c
         LEFT JOIN Orders o
                   ON c.CustomerID = o.CustomerID
GROUP BY CustomerName;

# todo : 상품별 총 매출금액
SELECT ProductID,
       ProductName,
       (SELECT SUM(p.price * od.Quantity)
        FROM OrderDetails od
        WHERE p.ProductID = od.ProductID) AS TotalSales
FROM Products p

