# 사용할 데이터베이스(스키마) 선택하기
USE w3schools;

SHOW TABLES ;

# 새 데이터베이스 만들기
CREATE DATABASE mydb1;
USE mydb1;
SHOW TABLES ;

CREATE TABLE my_table1
(
    name VARCHAR(3),
    age  INT
);

# todo : mydb2 데이터베이스 만들고 옮겨서
#   새 테이블 하나 만들기
CREATE DATABASE mydb2;
USE mydb2;
CREATE TABLE my_table1
(
    name VARCHAR(3) NOT NULL,
    age  INT DEFAULT 0
);
ALTER TABLE my_table1
    ADD PRIMARY KEY (name);
DESC my_table1;
SHOW TABLES ;

SELECT * FROM mydb1.my_table1;

# 데이터베이스 삭제 (매우 주의!!)
DROP DATABASE mydb2;

# todo : mydb1 삭제
DROP DATABASE mydb1;