USE w3schools;

# INSERT INTO 테이블명 (컬럼명1, 컬렴명2, ...)
# VALUES (데이터들...)

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

INSERT INTO Employees (LastName)
VALUES ('ironman');

INSERT INTO Employees(FirstName)
VALUES ('tony');

INSERT INTO Employees (LastName, FirstName, BirthDate, Photo, Notes)
VALUES ('captain', 'steve', '1990-01-01', 'pic1', 'america');

INSERT INTO Employees (FirstName, LastName)
VALUES ('natasha', 'widow');

# todo : 새 고객을 2개 입력하세요.
SELECT *
FROM Customers
ORDER BY CustomerID DESC;

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('lee kang in', 'Kagn-In', 'parisbagette', 'paris', '19-10', 'France');

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

# null : 값이 없음 (cf.참조값이 없는게 아님, 값만 없다는 것을 표시)