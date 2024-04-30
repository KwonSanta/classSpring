USE w3schools;

# GROUP BY : 집계함수(avg, sum, count, min, max)를 그룹별로 결과 내게 함
SELECT CategoryID, COUNT(ProductID)
FROM Products
GROUP BY CategoryID;

SELECT CategoryID                          번호,
       (SELECT c.CategoryName
        FROM Categories c
        WHERE c.CategoryID = p.CategoryID) 이름,
       COUNT(ProductID)                    상품수
FROM Products p
GROUP BY CategoryID;

SELECT c.CategoryID       번호,
       c.CategoryName     이름,
       COUNT(p.ProductID) 상품수
FROM Categories c
         JOIN Products p
              ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID;

# todo : 직원별 매출액
SELECT e.EmployeeID, e.lastName, e.firstName, SUM(od.Quantity * p.Price) 매출액
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON od.ProductID = p.ProductID
         JOIN Employees e
              ON o.EmployeeID = e.EmployeeID
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-31'
GROUP BY e.EmployeeID
ORDER BY 매출액 DESC;

# todo : 1997년 7월 기준 고객별 소비금액을 금액이 높은 순서로 조회
SELECT c.CustomerID,
       c.CustomerName,
       SUM(od.Quantity * p.Price) 소비금액
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON od.ProductID = p.ProductID
         JOIN Customers c
              ON c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN '1997-07-01' AND '1997-07-31'
GROUP BY c.CustomerID
ORDER BY 소비금액 DESC
LIMIT 5;

# 국가별, 도시별
SELECT Country, City, COUNT(CustomerID)
FROM Customers
GROUP BY Country, City;

# 고객별, 상품별 주문량
SELECT c.CustomerID  고객번호,
       c.CustomerName,
       p.ProductID,
       p.ProductName,
       SUM(Quantity) 상품주문수
FROM OrderDetails od
         JOIN Orders o ON od.OrderID = o.OrderID
         JOIN Customers c ON o.CustomerID = c.CustomerID
         JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.CustomerID, ProductID
ORDER BY 고객번호, 상품주문수 DESC;

# 국가별, 상품별 판매 갯수 조회 (국가(ACS), 상품판매수(DESC) 순으로 정렬)
SELECT c.Country        국가,
       p.ProductName    상품명,
       SUM(od.Quantity) 판매개수
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON p.ProductID = od.ProductID
         JOIN Customers c
              ON c.CustomerID = o.CustomerID
GROUP BY c.Country, p.ProductName
ORDER BY 국가, 판매개수 DESC;

# 상품별, 국가별 주문수량
SELECT p.ProductName    상품명,
       c.Country        국가,
       SUM(od.Quantity) 판매개수
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON p.ProductID = od.ProductID
         JOIN Customers c
              ON c.CustomerID = o.CustomerID
GROUP BY p.ProductID, c.Country
ORDER BY p.ProductID, 판매개수 DESC;