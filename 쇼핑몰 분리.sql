DROP DATABASE mall;

CREATE DATABASE mall;

USE mall;

CREATE TABLE t_order(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userNo INT(5) NOT NULL,
productNo INT(5) NOT NULL
);

CREATE TABLE t_user(
userNo INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(200) NOT NULL,
userPw CHAR(200) NOT NULL,
userName CHAR(50) NOT NULL,
addr CHAR(200) NOT NULL
);

CREATE TABLE t_product(
productNo INT(5) PRIMARY KEY AUTO_INCREMENT,
pname CHAR(100) NOT NULL,
price INT(10) NOT NULL
);


INSERT INTO t_product
SET pname = '운동화',
price = 1000000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '반바지',
price = 30000;

INSERT INTO t_product
SET pname = '스커트',
price = 15000;

INSERT INTO t_product
SET pname = '코트',
price = 100000;

INSERT INTO t_product
SET pname = '티셔츠',
price = 9000;

INSERT INTO t_product
SET pname = '운동화',
price = 200000;

INSERT INTO t_product
SET pname = '모자',
price = 30000;



INSERT INTO t_user
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
addr = '런던';

INSERT INTO t_user
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
addr = '서울';

INSERT INTO t_user
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
addr = '대전';

INSERT INTO t_user
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
addr = '대구';

INSERT INTO t_user
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
addr = '부산';

INSERT INTO t_user
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
addr = '울산';


INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 2,
productNo = 2;

INSERT INTO t_order
SET userNo = 3,
productNo = 3;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 5,
productNo = 5;

INSERT INTO t_order
SET userNo = 6,
productNo = 6;

INSERT INTO t_order
SET userNo = 6,
productNo = 7;

INSERT INTO t_order
SET userNo = 1,
productNo = 5;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 5,
productNo = 8;

t_order
t_user
t_product


# 1. 손흥민의 주문 개수는? ???
SELECT *
FROM t_order;

SELECT *
FROM t_user; # 손흥민 userNo =1 # t_order에서 확인시 (1,8,10)확인

SELECT COUNT(*) AS '손흥민의 주문 개수'
FROM t_order
WHERE userNO=1;
# 2. 손흥민이 산 상품은? ??? # 상품 세부내역을 보려면 t_product 
SELECT *
FROM t_order
WHERE userNO=1;   # t_order에서 손흥민조회  pro uct number 1,5 확인

SELECT pname AS '손흥민이 산 상품'
FROM t_product
WHERE productNO IN(1,5);

# 3. 스커트를 산 사람은? ???
SELECT *
FROM t_product;  # 스커트의 productNo확인 스커트는 4이다. 

SELECT *
FROM t_order
WHERE productNO =4; # 스커트를 산 사람은  userNo 4이다. 

SELECT userName AS '스커트를 산 사람'
FROM t_user
WHERE userNo =4;


# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? ???
SELECT userNo, COUNT(*) 'as 주문개수'
FROM t_order
GROUP BY userNo
ORDER BY COUNT(*) DESC
LIMIT 1;          # userNo가 1인사람을 찾아라.

SELECT userId,userName
FROM t_user
WHERE userNO =1;



# 5. 소지섭이 사용한 총 금액은? ???
# 소지섭의 userNo=5
SELECT *
FROM t_order
WHERE userNo=5; # 5번과 8번 구매

SELECT SUM(price) AS '소지섭이 사용한 총 금액'
FROM t_product
WHERE productNo IN(5,8);



