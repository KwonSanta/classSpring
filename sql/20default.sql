use w3schools;

# DEFAULT : 값으 지 않을 때의 기본값을 정의
CREATE TABLE my_table13
(
    col1 VARCHAR(10),
    col2 VARCHAR(10) DEFAULT 'abc'
);

DESC my_table13;
SELECT * FROM my_table13;
INSERT INTO my_table13
    (col1, col2)
VALUES ('qwe', 'zxc');
INSERT INTO my_table13
    (col2)
VALUES ('iop');
INSERT INTO my_table13
    (col1)
VALUES ('bnm');
INSERT INTO my_table13
    (col1, col2)
VALUES ('jkl', NULL);

# todo : my_table14 테이블 만들기
#   4개의 컬럼 정의
#   하나는 제약사항 없이
#   하나는 NOT NULL 만
#   하나는 DEFAULT 만
#   하나는 NOT NULL, DEFAULT
CREATE TABLE my_table14
(
    col1 VARCHAR(10),
    col2 VARCHAR(10)                    NOT NULL,
    col3 VARCHAR(10) DEFAULT ('값 없음3'),
    col4 VARCHAR(10) DEFAULT ('값 없음4') NOT NULL
);
DESC my_table14;
SELECT * FROM my_table14;
INSERT INTO my_table14
(col1, col2, col3, col4)
VALUES
    ('abc', 'def', 'ghi', 'jkl');
INSERT INTO my_table14
(col2, col3, col4)
VALUES
    ('test', NULL, '');

INSERT INTO my_table14
(col2, col3)
VALUES
    ('test', NULL)