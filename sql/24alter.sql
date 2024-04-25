use w3schools;

# ALTER TABLE : 테이블 구조 변경

CREATE TABLE my_table23
(
    name VARCHAR(3),
    age  INT
);
INSERT INTO my_table23 (name, age)
VALUES ('son', 44),
       ('lee', 33);

#==[1] 컬럼 추가
ALTER TABLE my_table23
    ADD COLUMN address VARCHAR(10);
# todo : my_table23 에 city 컬럼 추가
ALTER TABLE my_table23
    ADD COLUMN city VARCHAR(10) NOT NULL;
ALTER TABLE my_table23
    ADD COLUMN country VARCHAR(10) NOT NULL;
ALTER TABLE my_table23
    ADD COLUMN price INT NOT NULL;
ALTER TABLE my_table23
    ADD COLUMN state VARCHAR(10) NOT NULL DEFAULT ('seoul');
# 컬럼 사이에 컬럼 추가 (주의 필요함, jdbc 같은 경우 컬럼 순서대로 바인딩 해줬었음)
ALTER TABLE my_table23
    ADD COLUMN birth DATE AFTER age;

#==[2] 컬럼 삭제 (주의!!🔥)
ALTER TABLE my_table23
    DROP COLUMN state;
# todo : city 컬럼 삭제
ALTER TABLE my_table23
    DROP Column city;
ALTER TABLE my_table23
    DROP birth;

#==[3] 컬럼 변경
# 이름 변경 (주의!!)
ALTER TABLE my_table23
    RENAME COLUMN address TO town;
# todo: birth -> birth_date 컬럼으로 이름 변경
ALTER TABLE my_table23
    RENAME COLUMN birth TO birth_date;
SELECT *
FROM my_table23;
DESC my_table23;
# 자료형 (주의!!)
ALTER TABLE my_table23
    MODIFY COLUMN price DEC(20, 2);
ALTER TABLE my_table23
    MODIFY name VARCHAR(30);
# todo: name 컬럼의 타입을 varchar(3) -> varchar(30)
# 타입변경시 주의할 점 : 데이터를 잃어버리지 않도록 해야함
INSERT INTO my_table23
    (name, country)
VALUES ('123456789012345', 'korea');
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20); -- O
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(10);
-- X

# 제약사항 변경
DESC my_table23;
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) UNIQUE;
# todo: age 컬럼에 unique 제약사항 추가
ALTER TABLE my_table23
    MODIFY COLUMN age int(11) UNIQUE;

# UNIQUE 제약사항 삭제하기
SHOW INDEX FROM my_table23;
ALTER TABLE my_table23
    DROP INDEX age;
DESC my_table23;
# todo: name 컬럼의 UNIQUE 제약사항 삭제
SHOW INDEXES FROM my_table23;
ALTER TABLE my_table23
    DROP INDEX name;

# NOT NULL 삭제
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) NULL;
# todo: age 컬럼에 not null 추가, 삭제
ALTER TABLE my_table23
    MODIFY COLUMN age INT NOT NULL; -- > 추가하는 제약사항에 위배되는 컬럼 존재
SELECT *
FROM my_table23
WHERE age IS NULL;
UPDATE my_table23
SET age = 0
WHERE age IS NULL; -- > 컬럼 업데이트 : null -> 0
ALTER TABLE my_table23
    MODIFY COLUMN age INT NOT NULL;

# DEFAULT 제약사항 추가
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) DEFAULT 'guest';
# DEFAULT 제약사항 삭제
ALTER TABLE my_table23
    ALTER COLUMN name DROP DEFAULT;

DESC my_table23;
# todo: age 컬럼에 default 제약사항 추가/삭제
ALTER TABLE my_table23
    MODIFY COLUMN age INT DEFAULT 0;
ALTER TABLE my_table23
    ALTER COLUMN age DROP DEFAULT;

# PRIMARY KEY 제약사항 추가/삭제
# 추가
ALTER TABLE my_table23
    ADD PRIMARY KEY (name);
DESC my_table23;
# 삭제
ALTER TABLE my_table23
    DROP PRIMARY KEY;
ALTER TABLE my_table23
    MODIFY COLUMN name VARCHAR(20) NULL;
# todo : age 컬럼에 PRIMARY KEY 제약 사항 추가/삭제
ALTER TABLE my_table23
    ADD PRIMARY KEY (age);
ALTER TABLE my_table23
    DROP PRIMARY KEY;
ALTER TABLE my_table23
    MODIFY COLUMN age INT NULL;