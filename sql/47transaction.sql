
# TRANSACTION : 하나의 업무 단위

USE mydb2;
CREATE TABLE bank
(
    name  VARCHAR(3) PRIMARY KEY,
    money INT NOT NULL
);
INSERT INTO bank
(name, money)
VALUES ('흥민', 10000),
       ('강인', 10000);
SELECT * FROM bank;

# 강인이 흥민에게 500원 송금
UPDATE bank
SET money = money - 500
WHERE name = '강인';
UPDATE bank
SET money = money + 500
WHERE name = '흥민';

# case1.
# TRANSACTION(업무) 시작
START TRANSACTION;
# 모두 성공 (DB 반영시킴)
COMMIT;

# case2.
# TRANSACTION(업무) 시작
START TRANSACTION ;
# 모두 실패 (DB 반영 X, 트랜잭션 시작 전으로 돌림)
ROLLBACK;
