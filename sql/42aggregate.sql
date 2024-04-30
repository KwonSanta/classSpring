# 집계시 NULL 은 포함하지 않음

CREATE DATABASE mydb2;
USE mydb2;

CREATE TABLE table12
(
    number INT
);

INSERT INTO table12
VALUES (3),
       (4),
       (NULL),
       (NULL);
INSERT INTO table12
VALUES (5);

SELECT *
FROM table12;
SELECT COUNT(table12.number)
FROM table12;
SELECT MAX(table12.number)
FROM table12;
SELECT MIN(table12.number)
FROM table12;
SELECT SUM(table12.number)
FROM table12;
SELECT AVG(table12.number)
FROM table12;

# NULL 값을 포함 시키고 싶을 떄 -> NULL = 0 으로 계산해서
# NULL 을 다른 값으로 바꾸기
SELECT table12.number
FROM table12;

SELECT IFNULL(number, 0)
FROM table12;

SELECT COUNT(IFNULL(table12.number, 0))
FROM table12;
SELECT AVG(number) -- (3 + 4 + 5) / 3
FROM table12;
SELECT AVG(IFNULL(number, 0)) -- (3 + 4 + 5 + 0 + 0) / 5
FROM table12;