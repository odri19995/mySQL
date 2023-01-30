# 전체 데이터베이스 리스팅
SHOW DATABASES;
# `mysql` 데이터 베이스 선택
USE `mysql`;
# 테이블 리스팅
SHOW TABLES;
# 특정 테이블의 구조
DESC `db`;
# `test` 데이터 베이스 선택
USE `test`;
# 테이블 리스팅
SHOW TABLES;
# 기존에 a1 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS `a1`;
# 새 데이터베이스(`a1`) 생성
CREATE DATABASE `a1`;
# 데이터베이스(`a1`) 선택
USE `a1`
# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;
# 테이블 확인
SHOW TABLES;
# 게시물 테이블 article(title, body)을 만듭니다.
CREATE TABLE `ariticle`(
    title CHAR(100),
    `body` CHAR(100)
);
# VARCHAR(100) => 문자 100개 저장가능
# text => 문자 많이 저장가능

# 잘 추가되었는지 확인, 리스팅과 구조까지 확인
SHOW TABLES;

# 테이블 이름 변경
RENAME TABLE `ariticle` TO `article`;
SHOW TABLES;

DESC `article`;
# 데이터 하나 추가(title = 제목, body = 내용)
INSERT INTO `article`
SET title = '제목',
`body` = '내용';
# 데이터 조회(title 만)
SELECT title
FROM article;
# 데이터 조회(title, body)
SELECT title, `body`
FROM article;
# 데이터 조회(body, title)
SELECT `body`,title
FROM article;
# 데이터 조회(*)
SELECT *
FROM article;
# 데이터 또 하나 추가(title = 제목, body = 내용)
INSERT INTO `article`
SET title = '제목',
`body` = '내용';
# 데이터 조회(*, 어떤게 2번 게시물인지 알 수 없음)
SELECT *
FROM article;

#데이터가 '제목인'한줄 삭제
DELETE FROM `article`
WHERE title = '제목'
LIMIT 1;

# 데이터 조회(*)
SELECT *
FROM article;

# 테이블 구조 수정(id 칼럼 추가, first)
ALTER TABLE `article` ADD COLUMN `id` VARCHAR(32) FIRST;# NOT NULL;  # AFTER (field명)
# 테이블 구조 수정 (id 컬럼 삭제) varchar같은 경우는  길이가 변할수 있는값에 쓰는게 좋고 길이가 일정한데이터는 char이 낫다.
ALTER TABLE `article` DROP COLUMN `id`;
# 데이터 조회(*, id 칼럼의 값은 NULL)
SELECT *
FROM article;
# 기존 데이터에 id값 추가(id = 1, id IS NULL)
UPDATE `article`
SET id = 1
WHERE id IS NULL;
# 데이터 조회(*, 둘다 수정되어 버림..)
SELECT *
FROM article;
# 기존 데이터 중 1개만 id를 2로 변경(LIMIT 1)
UPDATE `article`
SET id = 2
WHERE id =1
LIMIT 1;
# 데이터 조회(*)
SELECT *
FROM article;
# 데이터 1개 추가(id = 3, title = 제목3, body = 내용3)
#INSERT INTO `article` VALUES (3, '제목3', '내용3');


INSERT INTO `article`
SET id = 3,
title = '제목3',
`body` = '내용3';


# 데이터 조회(*)
SELECT *
FROM article;
# 2번 게시물, 데이터 삭제 => DELETE
DELETE FROM `article`
WHERE id =2;
# 데이터 조회(*)
SELECT *
FROM article;
# 날짜 칼럼 추가 => regDate DATETIME
ALTER TABLE article ADD COLUMN `regDate` DATETIME;

ALTER TABLE `article` DROP COLUMN `regDate`;
# 테이블 구조 확인
DESC `article`
# 데이터 조회(*, 날짜 정보가 비어있음)
SELECT *
FROM article;
# 1번 게시물의 비어있는 날짜정보 채움(regDate = 2018-08-10 15:00:00)
UPDATE `article`
SET regDate = '2018-08-10 15:00:00'
WHERE regDate IS NULL
LIMIT 1;
# 데이터 조회(*, 이제 3번 게시물의 날짜 정보만 넣으면 됩니다.)
SELECT *
FROM article;
# NOW() 함수 실행해보기
UPDATE article
SET regDate = NOW()
WHERE `id` =3;
# 3번 게시물의 비어있는 날짜정보 채움(NOW())

# 데이터 조회(*)
SELECT *
FROM article;