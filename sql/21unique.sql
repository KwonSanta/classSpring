use w3schools;

# UNIQUE : 다른 레코드의 컬럼 값이 중복되지 않음
CREATE TABLE my_table15
(
    col1 VARCHAR(3),
    col2 VARCHAR(3) UNIQUE
) ;
DESC my_table15;
SELECT * FROM my_table15;
INSERT INTO my_table15
    (col1, col2)
VALUES ('abc', 'def');
INSERT INTO my_table15
    (col1, col2)
VALUES ('qwe', 'qwe');
INSERT INTO my_table15
    (col1, col2)
VALUES ('zxc', 'qwe'); # col2 : 'qwe' 가 이미 존재하므로 추가하지 못한다.
INSERT INTO my_table15
    (col1)
VALUES ('qwe');

# todo : my_table16
#   col1 : 제약사항없이
#   col2 : UNIQUE
#   col3 : NOT NULL UNIQUE
CREATE TABLE my_table16
(
    col1 VARCHAR(5),
    col2 VARCHAR(5) UNIQUE,
    col3 VARCHAR(7) NOT NULL UNIQUE
);
DESC my_table16;
INSERT INTO my_table16
    (col1, col2, col3)
VALUES ('이강인', 'ID1', '12345');
INSERT INTO my_table16
    (col3)
VALUES ('1234');
SELECT * FROM my_table16;
CREATE TABLE my_practice2
(
    col1 VARCHAR(5),
    col2 VARCHAR(5) NOT NULL UNIQUE,
    col3 VARCHAR(7) NOT NULL UNIQUE
);
DESC my_practice2;
