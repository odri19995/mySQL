# AM 데이터베이스 생성 및 사용
DROP DATABASE IF EXISTS ArticleManager;
CREATE DATABASE ArticleManager;
USE ArticleManager;

# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL UNIQUE,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL UNIQUE
)

# 회원 테스트 데이터 
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user1',
loginPw = '1234',
`name` = '홍길동',
nickname = '신출귀몰';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user2',
loginPw = '4321',
`name` = '이순신',
nickname = '구국의영웅';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user3',
loginPw = '1423',
`name` = '임꺽정',
nickname = '힘센장사';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'user4',
loginPw = '3131',
`name` = '유관순',
nickname = '독립열사';

SELECT * FROM `member`;

###################################################

# 게시판 테이블 생성
DROP TABLE board;

CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지), free(자유), QnA(질답)',
    `name` CHAR(50) NOT NULL UNIQUE COMMENT '게시판 이름'
) COMMENT ='게시판';

# 게시판 테스트 데이터
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'notice',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'free',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질답';

SELECT * FROM board;

# table comment 조회
SELECT TABLE_SCHEMA,TABLE_NAME,TABLE_COMMENT
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA='ArticleManager'
ORDER BY TABLE_NAME DESC;

# 컬럼 comment 조회 
SELECT  TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME,COLUMN_COMMENT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='ArticleManager' AND TABLE_NAME='board';

###################################################
# 게시물 테이블 삭제
DROP TABLE article;

# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL, #누가 썼나
    boardId INT(10) UNSIGNED NOT NULL,  # 어디에 썼나
    hit INT(10) UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO article
SET regDate = '2020-03-03 12:30:00',
updateDate = '2020-03-03 12:30:00',
title = '제목1',
`body` = '내용1',
memberId = 1,
boardId = 2,
hit = 10;

INSERT INTO article
SET regDate = '2021-04-05 15:12:00',
updateDate = '2021-04-05 15:12:00',
title = '제목2',
`body` = '내용2',
memberId = 1,
boardId = 2,
hit = 23;

INSERT INTO article
SET regDate = '2022-01-02 19:08:00',
updateDate = '2022-01-02 19:08:00',
title = '제목3',
`body` = '내용3',
memberId = 1,
boardId = 2,
hit = 31;

INSERT INTO article
SET regDate = '2021-04-01 08:30:00',
updateDate = '2021-04-01 08:30:00',
title = '제목4',
`body` = '내용4',
memberId = 2,
boardId = 2,
hit = 100;

INSERT INTO article
SET regDate = '2021-05-07 16:22:00',
updateDate = '2021-05-07 16:22:00',
title = '제목5',
`body` = '내용5',
memberId = 2,
boardId = 2,
hit = 13;

INSERT INTO article
SET regDate = '2020-03-03 12:30:00',
updateDate = '2020-03-03 12:30:00',
title = '제목6',
`body` = '내용6',
memberId = 2,
boardId = 1,
hit = 112;

INSERT INTO article
SET regDate = '2021-06-01 17:12:00',
updateDate = '2021-06-01 17:12:00',
title = '제목7',
`body` = '내용7',
memberId = 2,
boardId = 1,
hit = 224;

INSERT INTO article
SET regDate = '2020-07-01 22:30:00',
updateDate = '2020-07-01 22:30:00',
title = '제목8',
`body` = '내용8',
memberId = 3,
boardId = 3,
hit = 87;

INSERT INTO article
SET regDate = '2022-03-03 23:12:00',
updateDate = '2022-03-03 23:12:00',
title = '제목9',
`body` = '내용9',
memberId = 3,
boardId = 3,
hit = 56;

INSERT INTO article
SET regDate = '2022-04-01 20:00:00',
updateDate = '2022-04-01 20:00:00',
title = '제목10',
`body` = '내용10',
memberId = 2,
boardId = 3,
hit = 3;

INSERT INTO article
SET regDate = '2022-03-11 20:00:00',
updateDate = '2022-03-11 20:00:00',
title = '제목11',
`body` = '내용11',
memberId = 4,
boardId = 3,
hit = 12;

INSERT INTO article
SET regDate = '2022-02-13 20:00:00',
updateDate = '2022-02-13 20:00:00',
title = '제목12',
`body` = '내용12',
memberId = 4,
boardId = 2,
hit = 32;

SELECT * FROM article;

###################################################
# 댓글 테이블 삭제
DROP TABLE reply;

# 댓글 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(30) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) UNSIGNED NOT NULL COMMENT '관련 데이터 번호',
    `body` TEXT NOT NULL
);

INSERT INTO reply
SET regDate = '2021-04-15 15:12:00',
updateDate = '2021-04-15 15:12:00',
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글내용1';

INSERT INTO reply
SET regDate = '2021-05-02 19:08:00',
updateDate = '2021-05-02 19:08:00',
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글내용2';

INSERT INTO reply
SET regDate = '2020-03-03 12:30:00',
updateDate = '2020-03-03 12:30:00',
memberId = 1,
relTypeCode = 'article',
relId = 6,
`body` = '댓글내용3';

INSERT INTO reply
SET regDate = '2020-03-05 15:12:00',
updateDate = '2020-03-05 15:12:00',
memberId = 1,
relTypeCode = 'article',
relId = 6,
`body` = '댓글내용4';

INSERT INTO reply
SET regDate = '2020-03-12 19:08:00',
updateDate = '2020-03-12 19:08:00',
memberId = 1,
relTypeCode = 'article',
relId = 6,
`body` = '댓글내용5';

INSERT INTO reply
SET regDate = '2021-06-03 12:30:00',
updateDate = '2021-06-03 12:30:00',
memberId = 1,
relTypeCode = 'article',
relId = 7,
`body` = '댓글내용6';

INSERT INTO reply
SET regDate = '2021-06-05 15:12:00',
updateDate = '2021-06-05 15:12:00',
memberId = 1,
relTypeCode = 'article',
relId = 7,
`body` = '댓글내용7';

INSERT INTO reply
SET regDate = '2022-04-01 19:08:00',
updateDate = '2022-04-01 19:08:00',
memberId = 1,
relTypeCode = 'article',
relId = 7,
`body` = '댓글내용8';

INSERT INTO reply
SET regDate = '2020-07-05 13:32:00',
updateDate = '2020-07-05 13:32:00',
memberId = 3,
relTypeCode = 'article',
relId = 8,
`body` = '댓글내용9';

INSERT INTO reply
SET regDate = '2020-07-07 11:15:00',
updateDate = '2020-07-07 11:15:00',
memberId = 3,
relTypeCode = 'article',
relId = 8,
`body` = '댓글내용10';

INSERT INTO reply
SET regDate = '2022-06-05 15:22:00',
updateDate = '2022-06-05 15:22:00',
memberId = 3,
relTypeCode = 'article',
relId = 9,
`body` = '댓글내용11';

INSERT INTO reply
SET regDate = '2022-07-03 17:14:00',
updateDate = '2022-07-03 17:14:00',
memberId = 3,
relTypeCode = 'article',
relId = 9,
`body` = '댓글내용12';

INSERT INTO reply
SET regDate = '2022-03-05 17:02:00',
updateDate = '2022-03-05 17:02:00',
memberId = 2,
relTypeCode = 'article',
relId = 9,
`body` = '댓글내용13';


INSERT INTO reply
SET regDate = '2022-03-07 12:32:00',
updateDate = '2022-03-07 12:32:00',
memberId = 2,
relTypeCode = 'article',
relId = 9,
`body` = '댓글내용14';

INSERT INTO reply
SET regDate = '2022-03-07 16:15:00',
updateDate = '2022-03-07 16:15:00',
memberId = 2,
relTypeCode = 'article',
relId = 9,
`body` = '댓글내용15';

SELECT * FROM reply;
SELECT * FROM article WHERE boardId = 3;

###################################################
# 좋아요 테이블 삭제
DROP TABLE `LikePoint`;

# 댓글 테이블 생성
CREATE TABLE `LikePoint` (
    id INT NOT NULL,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(30) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) UNSIGNED NOT NULL COMMENT '관련 게시물 데이터 번호',
    `point` INT(10) UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (memberId,relId)
)

DESC likePoint

INSERT INTO `LikePoint`
SET 
id =1,
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = 1;

INSERT INTO `LikePoint`
SET id =2,
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 4,
`point` = 1;

INSERT INTO `LikePoint`
SET id =3,
regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = 1;

INSERT INTO `LikePoint`
SET id =4,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 1,
`point` = 1;

INSERT INTO `LikePoint`
SET id =5,
regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 7,
`point` = 1;


INSERT INTO `LikePoint`
SET id =6,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 7,
`point` = 1;

INSERT INTO `LikePoint`
SET id =7,
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 10,
`point` = 1;


INSERT INTO `LikePoint`
SET id =8,
regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 10,
`point` = 1;

INSERT INTO `LikePoint`
SET id =9,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 10,
`point` = 1;

INSERT INTO `LikePoint`
SET id =10,
regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 10,
`point` = 1;

INSERT INTO `LikePoint`
SET id =11,
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = 1;

INSERT INTO `LikePoint`
SET id =12,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 6,
`point` = 1;

INSERT INTO `LikePoint`
SET id =13,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 3,
`point` = 1;

INSERT INTO `LikePoint`
SET id =14,
regDate = NOW(),
updateDate = NOW(),
memberId = 4,
relTypeCode = 'article',
relId = 13,
`point` = 1
;

DELETE FROM `LikePoint`
WHERE id =14;

SELECT * FROM `LikePoint`
ORDER BY id;

#######################################
SELECT * FROM `member`;
SELECT * FROM `board`;
SELECT * FROM `article`;
SELECT * FROM `reply`;
SELECT * FROM `LikePoint`;

SELECT COUNT(*)
FROM `LikePoint`
WHERE relTypeCode = 'article' AND relId = 1;
# 첫번째 게시물의 좋아요 수

SELECT a.id AS '게시글 번호' ,a.title AS '게시글 제목' , COUNT(l.relId) AS '좋아요'
FROM `article` AS a
INNER JOIN `LikePoint` AS l
ON a.id = l.relId
GROUP BY a.id
LIMIT 1;


# 모든 게시물의 개수 출력
SELECT COUNT(*)
FROM article;


# 모든 게시물의 조회수의 총합 출력
SELECT SUM(hit) 
FROM article;


# 이순신이 작성한 댓글의 내용, 작성자 닉네임, 작성일 출력. 작성일로 내림차순
SELECT r.body, m.nickname, r.regDate
FROM reply AS r
INNER JOIN `member` AS m
ON r.memberId = m.id
ORDER BY r.regDate DESC;


# 작성자명에 '사'가 들어가는 작성자의 모든 게시물 조회(게시물번호, 제목, 내용, 조회수, 작성자 닉네임, 작성일). 작성일로 내림차순
SELECT a.id,a.title,a.body,a.hit, m.nickname, a.regDate
FROM article AS a
INNER JOIN `member` AS m
ON a.memberId = m.id
WHERE m.nickname LIKE '%사%'
ORDER BY a.regDate DESC;


# 자유게시판에서 제목에 '제'라는 문자가 포함된 모든 게시물 조회(게시물번호, 제목, 내용, 조회수, 작성자 닉네임, 작성일). 작성일로 내림차순
SELECT a.id, a.title, a.body, a.hit, m.nickname, a.regDate
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN `member` AS m
ON a.memberId = m.id
WHERE a.boardId = 2 AND a.title LIKE '%제%'
ORDER BY a.regDate DESC;

SELECT * FROM board;


# 각 게시판별 게시판 이름과 총 게시물 수 출력. 게시물 수 내림차순
SELECT b.name, COUNT(*)
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
GROUP BY a.boardId
ORDER BY COUNT(*) DESC;




# 최근 1년 사이의 게시물 제목, 내용, 작성자 닉네임, 작성일 출력 . 작성일로 내림차순
SELECT  a.title, a.body, m.nickname, a.regDate
FROM article AS a
INNER JOIN `member` AS m
ON a.memberId = m.id
WHERE a.regDate 
BETWEEN DATE_ADD(NOW(), INTERVAL -1 YEAR) AND NOW()
ORDER BY a.regDate DESC;

# 최근 반년 사이의 게시물 제목, 내용, 작성자 닉네임, 작성일 출력 . 작성일로 내림차순
SELECT  a.title, a.body, m.nickname, a.regDate
FROM article AS a
INNER JOIN `member` AS m
ON a.memberId = m.id
WHERE a.regDate 
BETWEEN DATE_ADD(NOW(), INTERVAL -6 MONTH) AND NOW()
ORDER BY a.regDate DESC;

# 연도별 게시물 등록 개수 현황 출력. 연도 오름차순
SELECT YEAR(regDate),COUNT(*)
FROM article
GROUP BY YEAR(regDate)
ORDER BY YEAR(regDate) ASC;

SELECT YEAR('2017-01-02 12:30:45');

# 가장 댓글이 많은 게시판의 게시판 이름과 댓글 수 출력. 댓글 수 내림차순
SELECT b.name,COUNT(*)
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN reply AS r
ON a.id = r.relId
GROUP BY b.name
ORDER BY COUNT(*) DESC;

# 모든 게시물의 게시판이름, 제목, 작성자닉네임, 게시물작성일, 조회수, 좋아요수, 댓글수 출력. 
SELECT b.name, a.title,m.nickname,a.regDate,a.hit
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN `member` m
ON a.memberId = m.id;


SELECT b.name, a.title,m.nickname,a.regDate,a.hit, COUNT(r.id) AS '댓글수' # column명으로 세면 null은 세지 않는다. 
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN `member` m
ON a.memberId = m.id
LEFT JOIN reply AS r
ON a.id = r.relId
GROUP BY a.id;

# distinct를 하지 않으면 중복값도 센다. 
SELECT b.name, a.title,m.nickname,a.regDate,a.hit,COUNT(l.id) AS '좋아요 수',COUNT(r.id) AS '댓글수'
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN `member` m
ON a.memberId = m.id
LEFT JOIN reply AS r
ON a.id = r.relId
LEFT JOIN `LikePoint` l
ON a.id = l.relId
GROUP BY a.id;


SELECT b.name, a.title,m.nickname,a.regDate,a.hit,
COUNT(DISTINCT l.id) AS '좋아요 수',COUNT(DISTINCT r.id) AS '댓글수'
FROM article AS a
INNER JOIN board AS b
ON a.boardId = b.id
INNER JOIN `member` m
ON a.memberId = m.id
LEFT JOIN reply AS r
ON a.id = r.relId
LEFT JOIN `LikePoint` l
ON a.id = l.relId
GROUP BY a.id;

# 각 게시물 별 댓글 수 내림차순, 댓글수가 같으면 게시물번호로 오름차순 (없으면 0개라고 표시)으로 출력
SELECT title, COUNT(*) AS '댓글수'
FROM article a
LEFT JOIN reply r
ON a.id = r.relId 
GROUP BY title
ORDER BY COUNT(*) DESC, a.id ASC; 

# 각 회원별 게시물 수 내림차순, 게시물 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력
SELECT m.`name`,COUNT(*) AS '게시물 수'
FROM article a
INNER JOIN `member` m
ON a.memberId = m.id
GROUP BY m.`name` 
ORDER BY COUNT(*) DESC, m.id ASC; 


# 각 회원별 댓글 수 내림차순, 댓글 수가 같으면 회원번호로 오름차순(없으면 0개라고 표시)으로 출력
SELECT m.`name`, COUNT(*) AS '댓글 수' 
FROM `member` m
INNER JOIN reply r
ON m.id = r.memberId
GROUP BY m.`name`
ORDER BY COUNT(*) DESC, m.id ASC;


# 좋아요를 가장 많이 받은 회원의 아이디, 이름, 총 좋아요개수
SELECT m.loginId,m.`name`,COUNT(*) AS '좋아요 개수'
FROM article a
INNER JOIN `member` m
ON a.memberId = m.id
LEFT JOIN `LikePoint` l
ON a.id = l.relId AND m.id = l.memberId
GROUP BY a.memberId
ORDER BY COUNT(*) DESC
LIMIT 1;

# 각 회원별 게시물의 조회수 총합 내립차순, 조회수가 같으면 회원번호로 오름차순 출력 
SELECT m.`name`,SUM(a.hit) AS '조회수 총합'
FROM article a
INNER JOIN `member` m
ON a.memberId = m.id
GROUP BY a.memberId
ORDER BY SUM(a.hit) DESC;


# 총 조회수가 가장 많은 게시판의 이름
SELECT b.name AS '조회수가 가장 많은 게시판', SUM(a.hit) AS '총 조회수'
FROM article a
INNER JOIN `board`b
ON a.boardId = b.id
GROUP BY b.name
ORDER BY SUM(a.hit) DESC
LIMIT 1;


# 게시판 별 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순
SELECT *
FROM (SELECT b.name,a.title,a.body,m.nickname,hit
FROM article a
INNER JOIN `board`b
ON a.boardId = b.id 
INNER JOIN `member` m
ON a.memberId = m.id
ORDER BY a.hit DESC
LIMIT 12) sub
GROUP BY sub.name 
#보통 order by는 group by 다음 순서이지만 정렬을 먼저하고 게시판별로 group by 해주고 싶을때는 서브쿼리를 이용한다.
#Limit을 걸어줄 경우 데이터의 순서 뿐만 아니라 데이터의 갯수까지도 제한되기 떄문에 테이블 내 데이터의 본절적인 내용이 변경되어서 서브쿼리의 결과
# 즉, group by의 대상이 되는 결과가 원하던 바 대로 설정되는 것이었다.

SELECT *



# 모든 게시물 중 가장 조회수가 높은 게시물 top 3의 게시물 제목, 내용, 작성자닉네임, 조회수 출력. 조회수 내림차순
SELECT a.title,a.body,m.nickname,hit
FROM article a
INNER JOIN `member` m
ON a.memberId = m.id
GROUP BY a.title
ORDER BY a.hit DESC
LIMIT 3;



# 모든 게시물 중 가장 댓글이 많은 게시물 top 3의 게시물번호, 게시물제목, 작성자닉네임, 게시물작성일, 댓글 수 출력. 댓글 수 내림차순
SELECT a.title,a.body,m.nickname,a.regdate, COUNT(r.id) AS '댓글 수 '
FROM article a
INNER JOIN `member` m
ON a.memberId = m.id
LEFT JOIN reply r
ON a.id = r.relId
GROUP BY a.title
ORDER BY COUNT(r.id) DESC
LIMIT 3;