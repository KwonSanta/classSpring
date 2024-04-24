#1. 문자열
# VARCHAR(문자열 길이)
CREATE TABLE my_table3
(
    name  VARCHAR(3),
    title VARCHAR(5),
    notes VARCHAR(1000)
);
DESC my_table3;
INSERT INTO my_table3
    (name, title, notes)
VALUES ('이강인', '축구선수', '파리생제르망');
INSERT INTO my_table3
    (name, title, notes)
VALUES ('네이마르', '야구선수', '사우디아라비아');
select *
from my_table3;

# todo : my_table4
#   책 제목, 책 내용, 저자
CREATE TABLE my_table4
(
    TITLE   VARCHAR(50),
    CONTENT VARCHAR(10000),
    AUTHOR  VARCHAR(50)
);
DESC my_table4;
INSERT INTO my_table4
    (TITLE, CONTENT, AUTHOR)
VALUES ('No Rules, Rules', '넷플릭스 창업주이자 CEO인 리드 헤이스팅스의 인터뷰가 담긴 책, <규칙없음 : 지구상 가장 빠르고 유연한 기업의 비밀>을 보신 적 있나요? 지구 상 가장 유명한 OTT 플랫폼으로 어떻게 전 세계인들에게 사랑 받는 기업으로 자리잡게 되었는지에 대한 비결이 담겨있는데요. 전세계 CEO들이 넷플릭스의 문화를 동경하는 이유는 기업에서 추구하고자 하는 내용들을 현실로 반영했기 때문이 아닐까 합니다.



 오늘은 ‘We Seek Excellence(우리 문화의 목적은 우리 스스로 탁월함을 이루는 것이다.)’로 대변되는 넷플릭스에서 공개했던 ‘자유와 책임의 조직문화’에 대한 7가지 관점을 공유해보고자 합니다. 조직 문화로 자율에 기반한 개방형 혁신이 키워드로 꼽히는만큼, 한번 쯤 읽어보시는 것을 추천 드립니다.',
        '누구였더라....');
SELECT *
FROM my_table4;

# 2. 수
# 정수 INT (-21억 ~ 21억)
# 실수 DECIMAL, DEC : '.'을 기준으로 (총 숫자의 길이, 소수점 이하 길이)
CREATE TABLE my_table5
(
    age    INT,
    height DEC(5, 2)
);
DESC my_table5;
INSERT INTO my_table5
    (age, height)
VALUES (10, 170.25);
select *
from my_table5;

# todo : 새 테이블 my_table6
#   한 개의 정수 타입 컬럼, 한 개의 실수 타입 컬럼
#   DESC 테이블, 레코드 추가, 조회
CREATE TABLE my_table6
(
    age    INT,
    weigth DEC(5, 2)
);
DESC my_table6;
INSERT INTO my_table6
    (age, weigth)
VALUES (30, 123.45);
INSERT INTO my_table6
    (age, weigth)
VALUES (1234567891, 1.23);
SELECT *
FROM my_table6;

# 3. 날짜시간
# DATE : 날짜 (YYYY-MM-DD)
# DATETIME : 날짜시간 (YYYY-MM-DD HH:MM:SS)
CREATE TABLE my_table7
(
    col1 DATE,
    col2 DATETIME
);
DESC my_table7;
SELECT *
FROM my_table7;
INSERT INTO my_table7
    (col1, col2)
VALUES ('2002-08-10', '1999-09-09 22:10:10');

# todo : my_table8 에 두 컬럼(DATE, DATETIME) 정의하고
#   레코드 넣고, 조회
CREATE TABLE my_table8
(
    col1 DATE,
    col2 DATETIME
);
DESC my_table8;
SELECT *
FROM my_table8;
INSERT INTO my_table8
    (col1, col2)
VALUES ('2024-04-24', '2024-04-24 11:33:00');

CREATE TABLE my_table9
(
    string_col    VARCHAR(30),
    int_col       INT,
    dec_col       DEC(10, 2),
    date_col      DATE,
    date_time_col DATETIME
);
INSERT INTO my_table9
(string_col, int_col, dec_col, date_col, date_time_col)
VALUES
    ('곧 점심시간!!', 50000, 54321.98, '2024-02-02', '1888-08-01 19:20:30');
SELECT * FROM my_table9;
DESC my_table9;

CREATE TABLE my_table10
(
    title VARCHAR(30),
    name VARCHAR(30),
    age INT,
    price DEC(10, 3),
    published DATE,
    inserted DATETIME
);
INSERT INTO my_table10
(title, name, age, price, published, inserted)
VALUES ('이것이 자바다', '신용권', 40, 23422.223, '1999-09-09', '1999-10-10 12:33:12'),
       ('스프링부트', '홍길동', 50, 2342.123, '2024-01-01', '2024-02-02 09:33:33');
DESC my_table10;
SELECT * FROM my_table10;