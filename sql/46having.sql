USE w3schools;

# HAVING : 집계함수(avg, sum, count, min, max)의 조건절
SELECT CategoryID, COUNT(ProductID)
FROM Products
GROUP BY CategoryID;

# 상품수가 10개 이상인 카테고리
SELECT *
FROM (SELECT CategoryID,
             COUNT(ProductID) 상품수
      FROM Products
      GROUP BY CategoryID) c
WHERE 상품수 >= 10;

SELECT CategoryID,
       COUNT(ProductID) 상품수
FROM Products
GROUP BY CategoryID
HAVING 상품수 >= 10;

# 고객이 5명 이상 있는 국가들 조회
SELECT Country, COUNT(CustomerID)
FROM Customers
GROUP BY Country
HAVING COUNT(Country) >= 5;

# 97년 7월 매출액:SUM(상품가격*갯수)이 10000달러 이상인 직원들 조회
SELECT e.EmployeeID,
       e.FirstName,
       e.LastName,
       SUM(p.Price * od.Quantity) 판매금액
FROM Orders o
         JOIN OrderDetails od ON o.OrderID = od.OrderID
         JOIN Products p ON od.ProductID = p.ProductID
         JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE o.OrderDate BETWEEN '1997-07-01' AND '1997-07-31'
GROUP BY e.EmployeeID
HAVING 판매금액 >= 10000
ORDER BY 판매금액 DESC;


SELECT c.CustomerId               customer_id,
       c.CustomerName             customer_name,
       c.Address                  customer_address,
       SUM(p.Price * od.Quantity) purchase_amount
FROM Orders o
         JOIN OrderDetails od ON o.OrderId = od.OrderId
         JOIN Products p ON p.ProductId = od.ProductId
         JOIN Customers c ON c.CustomerId = o.CustomerId
WHERE o.OrderDate BETWEEN '1997-07-01' AND '1997-07-31'
GROUP BY c.CustomerId
ORDER BY purchase_amount DESC

