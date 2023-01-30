DROP DATABASE IF EXISTS f1;
CREATE DATABASE f1;
USE f1;

CREATE TABLE userdata(
`no` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(60) NOT NULL,
id VARCHAR(60) NOT NULL,
pw VARCHAR(60) NOT NULL,
nickname VARCHAR(60) UNIQUE NOT NULL
); 

INSERT INTO userdata(username,id,pw,nickname) VALUES('홍길동','user1','1234','신출귀몰');
INSERT INTO userdata(username,id,pw,nickname) VALUES('이순신','user2','4321','구국의영웅');   
INSERT INTO userdata(username,id,pw,nickname) VALUES('임꺽정','user3','1423','힘센장사');
INSERT INTO userdata(username,id,pw,nickname) VALUES('유관순','user4','3131','독립열사');

SELECT * FROM userdata;

게시물은 번호, 제목, 내용, 작성자, 조회수, 수정일, 작성일로 이루어진다. 

DROP TABLE 공지사항;
CREATE TABLE 공지사항(
`no` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`text` LONGTEXT,
`writer` VARCHAR(60) NOT NULL,
`click_no` INT NOT NULL,
`change_day` DATETIME,
make_day DATETIME NOT NULL,
table_type VARCHAR(40) NOT NULL,
FOREIGN KEY (`writer`) REFERENCES userdata (nickname)
);

DROP TABLE 자유게시판;
CREATE TABLE 자유게시판(
`no` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`text` LONGTEXT,
`writer` VARCHAR(60) NOT NULL,
`click_no` INT NOT NULL,
`change_day` DATETIME,
make_day DATETIME NOT NULL,
table_type VARCHAR(40) NOT NULL,
FOREIGN KEY (`writer`) REFERENCES userdata (nickname)
);

DROP TABLE 질문과답변;
CREATE TABLE 질문과답변(
`no` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`text` LONGTEXT,
`writer` VARCHAR(60) NOT NULL,
`click_no` INT NOT NULL,
`change_day` DATETIME,
make_day DATETIME NOT NULL,
table_type VARCHAR(40) NOT NULL,
FOREIGN KEY (`writer`) REFERENCES userdata (nickname)
);

INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목1', '내용1','신출귀몰', 10, '2020-03-03 12:30:00','2020-03-03 12:30:00','자유게시판');
INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목2', '내용2','신출귀몰',23,'2021-04-05 15:12:00','2021-04-05 15:12:00','자유게시판');
INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목3', '내용3','신출귀몰', 31, '2022-01-02 19:08:00','2022-01-02 19:08:00','자유게시판');
INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목4', '내용4','구국의영웅',100, '2021-04-01 08:30:00','2021-04-01 08:30:00','자유게시판');
INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목5', '내용5','구국의영웅',13, '2021-05-07 16:22:00','2021-05-07 16:22:00','자유게시판');
INSERT INTO 자유게시판(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목12', '내용12','독립열사',32, '2022-02-13 20:00:00','2022-02-13 20:00:00','자유게시판');
SELECT * FROM 자유게시판;

INSERT INTO 공지사항(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목6', '내용6','구국의영웅',112, '2020-03-03 12:30:00','2020-03-03 12:30:00','공지사항');
INSERT INTO 공지사항(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목7', '내용7','구국의영웅',224, '2021-06-01 17:12:00','2021-06-01 17:12:00','공지사항');
SELECT * FROM 공지사항;

INSERT INTO 질문과답변(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목8', '내용8','힘센장사',87, '2020-07-01 22:30:00','2020-07-01 22:30:00','질문과답변');
INSERT INTO 질문과답변(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목9', '내용9','힘센장사',56,'2022-03-03 23:12:00','2022-03-03 23:12:00','질문과답변');
INSERT INTO 질문과답변(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목10', '내용10','구국의영웅',3,'2022-04-01 20:00:00','2022-04-01 20:00:00','질문과답변');
INSERT INTO 질문과답변(`name`,`text`,`writer`,`click_no`,`change_day`,`make_day`,table_type)
VALUES('제목11', '내용11','독립열사',12,'2022-03-11 20:12:00','2022-03-11 20:12:00','질문과답변');

SELECT * FROM 질문과답변;

3. 댓글 등록
- 임꺽정이 자유게시판 첫번째 게시물에 댓글 2개 작성
    [댓글내용1, 2021년4월5일 15시12분], 
    [댓글내용2, 2021년5월2일 19시08분] 작성
CREATE TABLE 게시물댓글(
`name` VARCHAR(60),
`text` LONGTEXT,
`writer` VARCHAR(60) NOT NULL,
change_day DATETIME,
make_day DATETIME NOT NULL
);
DROP TABLE 게시물댓글


SELECT * FROM 게시물댓글

INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 자유게시판 WHERE `no`=1) ,'덧글내용1','힘센장사','2021-04-05 15:12:00','2021-04-05 15:12:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 자유게시판 WHERE `no`=1) ,'덧글내용2','힘센장사','2021-05-02 19:08:00','2021-05-02 19:08:00');

INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=1) ,'덧글내용9','힘센장사','2020-07-05 13:32:00','2020-07-05 13:32:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=1) ,'덧글내용10','힘센장사','2020-07-07 11:15:00','2020-07-07 11:15:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=2) ,'덧글내용11','힘센장사','2022-06-05 15:22:00','2022-06-05 15:22:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=2) ,'덧글내용12','힘센장사','2022-07-03 17:14:00','2022-07-03 17:14:00');

INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=2) ,'덧글내용13','구국의영웅','2022-03-05 17:02:00','2022-03-05 17:02:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=2) ,'덧글내용14','구국의영웅','2022-03-07 12:32:00','2022-03-07 12:32:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 질문과답변 WHERE `no`=2) ,'덧글내용15','구국의영웅','2022-03-07 16:15:00','2022-03-07 16:15:00');


INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=1) ,'덧글내용3','신출귀몰','2020-03-03 12:30:00','2020-03-03 12:30:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=1) ,'덧글내용4','신출귀몰','2020-03-05 15:12:00','2020-03-05 15:12:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=1) ,'덧글내용5','신출귀몰','2021-03-12 19:08:00','2021-03-12 19:08:00');

INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=2) ,'덧글내용6','신출귀몰','2021-06-03 12:30:00','2021-06-03 12:30:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=2) ,'덧글내용7','신출귀몰','2021-06-05 15:12:00','2021-06-05 15:12:00');
INSERT INTO 게시물댓글(`name`,`text`,`writer`,change_day,make_day)
VALUES((SELECT `name` FROM 공지사항 WHERE `no`=2) ,'덧글내용8','신출귀몰','2022-04-01 19:08:00','2022-04-01 19:08:00');




# 4. 좋아요 체크

- 이순신이 자유게시판의 제목1 게시물에 좋아요 체크
- 이순신이 자유게시판의 제목4 게시물에 좋아요 체크
- 홍길동이 자유게시판의 제목1 게시물에 좋아요 체크
- 유관순이 자유게시판의 제목1 게시물에 좋아요 체크
- 홍길동이 공지사항의 제목7 게시물에 좋아요 체크
- 유관순이 공지사항의 제목7 게시물에 좋아요 체크
- 이순신이 질문과답변의 제목10 게시물에 좋아요 체크
- 홍길동이 질문과답변의 제목10 게시물에 좋아요 체크
- 유관순이 질문과답변의 제목10 게시물에 좋아요 체크
- 임꺽정이 질문과답변의 제목10 게시물에 좋아요 체크
- 이순신이 자유게시판의 제목1 게시물에 좋아요 체크
- 유관순이 공지사항의 제목6 게시물에 좋아요 체크
- 유관순이 자유게시판의 제목3 게시물에 좋아요 체크



DROP TABLE 좋아요;

CREATE TABLE 좋아요(
`name` VARCHAR(60),
writer VARCHAR(60),
like_count INT,
PRIMARY KEY (`name`,writer)
);

SELECT * FROM 좋아요

INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목1'),'구국의영웅',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목4'),'구국의영웅',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목1'),'신출귀몰',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목1'),'독립열사',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 공지사항 WHERE `name`='제목7'),'신출귀몰',1);

INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 공지사항 WHERE `name`='제목7'),'독립열사',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 질문과답변 WHERE `name`='제목10'),'구국의영웅',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 질문과답변 WHERE `name`='제목10'),'신출귀몰',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 질문과답변 WHERE `name`='제목10'),'독립열사',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 질문과답변 WHERE `name`='제목10'),'힘센장사',1);

INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목1'),'구국의영웅',1); # 좋아요 2번은 안되요. PK 로 방지.
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 공지사항 WHERE `name`='제목6'),'독립열사',1);
INSERT INTO 좋아요(`name`,`writer`,like_count)
VALUES((SELECT `name` FROM 자유게시판 WHERE `name`='제목3'),'독립열사',1);

# 모든 게시물의 개수 출력
SELECT ((SELECT COUNT(*) FROM 공지사항) +(SELECT COUNT(*) FROM 자유게시판) +(SELECT COUNT(*) FROM 질문과답변)) AS '모든 개시물의 개수'
FROM DUAL; 



# 모든 게시물의 조회수의 총합 출력

SELECT ((SELECT SUM(click_no) FROM 공지사항) +(SELECT SUM(click_no) FROM 자유게시판) +(SELECT SUM(click_no) FROM 질문과답변)) AS '모든 게시물의 조회수의 총합'
FROM DUAL;


 SELECT SUM(SUB.click_no) AS '모든 게시물의 조회수의 총합'
 FROM(
 SELECT click_no FROM 공지사항
 UNION ALL
 SELECT click_no FROM 자유게시판
 UNION ALL
 SELECT click_no FROM 질문과답변
 ) SUB;



# 이순신이 작성한 댓글의 내용, 작성자 닉네임, 작성일 출력. 작성일로 내림차순
SELECT username,a.nickname AS '닉네임',b.make_day AS '작성일' FROM userdata a
INNER JOIN 자유게시판 b
ON a.nickname = b.writer
WHERE username='이순신'
UNION
SELECT username,nickname,make_day FROM userdata
INNER JOIN 공지사항
ON userdata.nickname = 공지사항.writer
WHERE username='이순신'
UNION
SELECT username,nickname,make_day FROM userdata
INNER JOIN 질문과답변
ON userdata.nickname = 질문과답변.writer
WHERE username='이순신'
ORDER BY  DESC 

SELECT sub.username,sub.nickname,sub.make_day AS '작성일' #이름을 수정하고 싶어서 서브쿼리에 넣어주었다. 안에서는 make_day가 충돌해서 order by가 힘들다. 
FROM(SELECT username,nickname,make_day FROM userdata
INNER JOIN 자유게시판
ON userdata.nickname = 자유게시판.writer
WHERE username='이순신'
UNION
SELECT username,nickname,make_day FROM userdata
INNER JOIN 공지사항
ON userdata.nickname = 공지사항.writer
WHERE username='이순신'
UNION
SELECT username,nickname,make_day  FROM userdata
INNER JOIN 질문과답변
ON userdata.nickname = 질문과답변.writer
WHERE username='이순신') sub
ORDER BY make_day DESC; 

# 작성자명에 '사'가 들어가는 작성자의 모든 게시물 조회(게시물번호, 제목, 내용, 조회수, 작성자 닉네임, 작성일). 작성일로 내림차순
 
 SELECT `no`,`name` AS '제목',`text` AS '내용',`click_no` AS '조회수',`writer` AS '작성자 닉네임',make_day AS '작성일'
 FROM(
 SELECT * FROM 공지사항
 WHERE `writer` LIKE '%사%'
 UNION ALL
 SELECT * FROM 자유게시판
 WHERE `writer` LIKE '%사%'
 UNION ALL
 SELECT * FROM 질문과답변
 WHERE `writer` LIKE '%사%'
 ORDER BY make_day DESC
 ) SUB;


# 자유게시판에서 제목에 '제'라는 문자가 포함된 모든 게시물 조회(게시물번호, 제목, 내용, 조회수, 작성자 닉네임, 작성일). 작성일로 내림차순

SELECT `no`,`name` AS '제목',`text` AS '내용',`click_no` AS '조회수',`writer` AS '작성자 닉네임',make_day AS '작성일'
FROM 자유게시판
WHERE `name` LIKE '%제%'

# 각 게시판별 게시판 이름과 총 게시물 수 출력. 게시물 수 내림차순

#위에 테이블에 table_type을 추가해 주었다.
SELECT table_type AS '게시판 이름',COUNT(*) AS '총 게시물 수'
FROM 자유게시판
UNION
SELECT table_type,COUNT(*)
FROM 공지사항
UNION
SELECT table_type,COUNT(*)
FROM 질문과답변


# 최근 1년 사이의 게시물 제목, 내용, 작성자 닉네임, 작성일 출력 . 작성일로 내림차순
 SELECT `no`,`name` AS '제목',`text` AS '내용',`click_no` AS '조회수',`writer` AS '작성자 닉네임',make_day AS '작성일'
 FROM(
 SELECT * FROM 공지사항
 WHERE make_day BETWEEN '2021-04-01 00:00:00' AND '2022-04-02 00:00:00'
 UNION ALL
 SELECT * FROM 자유게시판
 WHERE make_day BETWEEN '2021-04-01 00:00:00' AND '2022-04-02 00:00:00'
 UNION ALL
 SELECT * FROM 질문과답변
 WHERE make_day BETWEEN '2021-04-01 00:00:00' AND '2022-04-02 00:00:00'
 ORDER BY make_day DESC
 ) SUB;


# 최근 반년 사이의 게시물 제목, 내용, 작성자 닉네임, 작성일 출력 . 작성일로 내림차순
 SELECT `no`,`name` AS '제목',`text` AS '내용',`click_no` AS '조회수',`writer` AS '작성자 닉네임',make_day AS '작성일'
 FROM(
 SELECT * FROM 공지사항
 WHERE make_day BETWEEN '2021-11-01 00:00:00' AND '2022-04-02 00:00:00'
 UNION ALL
 SELECT * FROM 자유게시판
 WHERE make_day BETWEEN '2021-11-01 00:00:00' AND '2022-04-02 00:00:00'
 UNION ALL
 SELECT * FROM 질문과답변
 WHERE make_day BETWEEN '2021-11-02 00:00:00' AND '2022-04-02 00:00:00'
 ORDER BY make_day DESC
 ) SUB;


# 연도별 게시물 등록 개수 현황 출력. 연도 오름차순
CREATE TABLE yeargrade(
`YEAR` INT,
B_YEAR DATETIME NOT NULL,
E_YEAR DATETIME NOT NULL
);

INSERT INTO yeargrade VALUES (2020,'2020-01-01 00:00:00','2020-12-31 23:59:59');
INSERT INTO yeargrade VALUES (2021,'2021-01-01 00:00:00','2021-12-31 23:59:00');
INSERT INTO yeargrade VALUES (2022,'2022-01-01 00:00:00','2022-12-31 23:59:00');


DROP TABLE yeargrade;
SELECT *
FROM YEARGRADE;

 SELECT Sub.year,COUNT(SUB.year)
 FROM(
 SELECT * FROM 공지사항
 INNER JOIN yeargrade
 ON make_day BETWEEN yeargrade.B_YEAR AND yeargrade.E_YEAR
 UNION ALL
 SELECT * FROM 자유게시판
 INNER JOIN yeargrade
 ON make_day BETWEEN yeargrade.B_YEAR AND yeargrade.E_YEAR
 UNION ALL
 SELECT * FROM 질문과답변
 INNER JOIN yeargrade
 ON make_day BETWEEN yeargrade.B_YEAR AND yeargrade.E_YEAR
 ORDER BY make_day
 ) SUB
 GROUP BY SUB.year;


# 가장 댓글이 많은 게시판의 게시판 이름과 댓글 수 출력. 댓글 수 내림차순
 SELECT SUB.table_type ,COUNT(Sub.table_type)
 FROM(
 SELECT * FROM 공지사항
 UNION ALL
 SELECT * FROM 자유게시판
 UNION ALL
 SELECT * FROM 질문과답변
 ) SUB
 INNER JOIN 게시물댓글
 ON SUB.name = 게시물댓글.name
 GROUP BY SUB.table_type
 ORDER BY COUNT(SUB.table_type) DESC
 LIMIT 1;



# 모든 게시물의 게시판이름, 제목, 작성자닉네임, 게시물작성일, 조회수, 좋아요수, 댓글수 출력. 
 SELECT table_type,SUB.`name`,SUB.writer,SUB.make_day,
 SUB.click_no,COUNT(게시물댓글.text) AS '댓글수'
 FROM(
 SELECT * FROM 공지사항
 UNION ALL
 SELECT * FROM 자유게시판
 UNION ALL
 SELECT * FROM 질문과답변
 ) SUB
 LEFT JOIN 게시물댓글
 ON SUB.name = 게시물댓글.name
 GROUP BY SUB.`name`
 ORDER BY SUB.`name`
 
 
 SELECT table_type,SUB.`name`,SUB.writer,SUB.make_day,
 SUB.click_no,COUNT(좋아요.like_count) AS '좋아요수'
 FROM(
 SELECT * FROM 공지사항
 UNION ALL
 SELECT * FROM 자유게시판
 UNION ALL
 SELECT * FROM 질문과답변
 ) SUB
 LEFT JOIN 좋아요
 ON SUB.name = 좋아요.name
 GROUP BY SUB.`name`
 ORDER BY SUB.`name`

# 각 게시물 별 댓글 수 내림차순, 댓글수가 같으면 게시물번호로 오름차순 (없으면 0개라고 표시)으로 출력
 SELECT SUB.`name` AS '게시물 이름',COUNT(게시물댓글.text) AS '댓글수'
 FROM(
 SELECT * FROM 공지사항
 UNION ALL
 SELECT * FROM 자유게시판
 UNION ALL
 SELECT * FROM 질문과답변
 ) SUB
 LEFT JOIN 게시물댓글
 ON SUB.name = 게시물댓글.name
 GROUP BY SUB.`name`
 ORDER BY COUNT(게시물댓글.text) DESC, SUB.`no` ASC 
 

# 각 회원별 게시물 수 내림차순, 게시물 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력



# 각 회원별 댓글 수 내림차순, 댓글 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력



# 좋아요를 가장 많이 받은 회원의 아이디, 이름, 총 좋아요개수


 
# 각 회원별 게시물의 조회수 총합 내립차순, 조회수가 같으면 회원번호로 오름차순 출력 




# 총 조회수가 가장 많은 게시판의 이름



# 게시판 별 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순



# 모든 게시물 중 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순



# 모든 게시물 중 가장 댓글이 많은 게시물 top 3의 게시물번호, 게시물제목, 작성자닉네임, 게시물작성일, 댓글 수 출력. 댓글 수 내림차순





