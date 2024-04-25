
# 제약사항 constraints
# 특정 컬럼에 제약사항을 줌 (예: 꼭 값이 있어야함, 기본값, 중복불가)

# NOT NULL : 꼭 값이 있어야함
CREATE TABLE my_table11
(
    col1 VARCHAR(10),
    col2 VARCHAR(10) NOT NULL
);
DESC my_table11;
INSERT INTO my_table11
    (col1, col2)
VALUES ('value', 'value');
INSERT INTO my_table11
(col2)
VALUES ('value');

# col1 : not null -> syntax error
INSERT INTO my_table11
(col1)
VALUES ('value');

select * from my_table11;

SELECT *
FROM my_table11
WHERE col2 = 'value';

SELECT *
FROM my_table11
WHERE col1 = 'value';

# IS NULL = 값이 없는 레코드 조회
SELECT *
FROM my_table11
WHERE col1 IS NULL;

SELECT *
FROM my_table11
WHERE col1 IS NOT NULL;

# NULL 과의 연산은 모두 FALSE -> 아래의 두 SQL 문은 의도에 맞지 않게 실행됨 👀
SELECT *
FROM my_table11
WHERE col1 <> NULL;
SELECT *
FROM my_table11
WHERE col1 != NULL;

# my_table12 테이블 만들고 2개의 컬럼에 제약사항 NOT NULL 주기
CREATE TABLE my_pract1
(
    col1 VARCHAR(10) NOT NULL,
    col2 INT(10)
);
DESC my_pract1;
INSERT INTO my_pract1
    (col1, col2)
VALUES ('123', 123);

SELECT * FROM my_pract1;

