DROP DATABASE IF EXISTS b1;

CREATE DATABASE b1;

USE b1;

CREATE TABLE article(
  title CHAR(200),
  `body` TEXT
);

ALTER TABLE article ADD id INT FIRST

SELECT *
FROM article;


# 번호 1, 제목1, 내용1 추가
INSERT INTO article 
SET id = 1, 
title = '제목1',
`body`= '내용1';
# 번호 1, 제목2, 내용2 추가 -> 추가가 안되어야 하는데 되고 있다.
INSERT INTO article 
SET id = 1, 
title = '제목2',
`body`= '내용2';
# id컬럼에 unique 제약을 걸어야 한다. not null 제약을 걸어야 한다.
#unique, not null, unsigned, auto_increment, default
# 컬럼에 제약을 거는 방법
# 1. 테이블 만들 때 
# 2. 테이블 구조 변경으로 

# 다시 테스트하기 위해 aritlce 데이터 삭제
DELETE FROM article;
ALTER TABLE article MODIFY id INT UNSIGNED NOT NULL UNIQUE

DESC article;
# 번호 1, 제목1, 내용1 추가
INSERT INTO article 
SET id = 1, 
title = '제목1',
`body`= '내용1';
# 번호 1, 제목2, 내용2 추가 
INSERT INTO article 
SET id =1
title = '제목2',
`body`= '내용2';
# 번호 없이 제목3, 내용3 추가 -> 번호가 없으면 not null이기 때문에 기본값 0으로 잡히기 됨
INSERT INTO article  
SET title = '제목3',
`body`= '내용3';
# 번호 없이 제목4, 내용4 추가 -> 위에서 기본값 0으로 추가를 했기 때문에 중복 발생
INSERT INTO article 
SET title = '제목4',
`body`= '내용4';

SELECT *
FROM article
# 자동증가 제약 걸기
# 0부터 자동증가 제약을 걸 수 없다. 따라서 update해줘서 id 를 2로 바꿔주자
UPDATE article 
SET id =2
WHERE id =0;
ALTER TABLE `article`MODIFY `id` INT UNSIGNED AUTO_INCREMENT;

#질문 여기서 구조확인을 해보면 앞의 unsigned는 날아가는 것을 확인할 수 있었다. 단, not null과 unique는 유지되는데 말이다.
# 테이블 구조 확인
DESC article

# 번호 없이 제목3, 내용3 추가
INSERT INTO article  
SET title = '제목3',
`body`= '내용3';

# 번호 없이 제목4, 내용4 추가 -> id를 따로 저장하지 않아도 자동증가하면서 잘 추가됨
INSERT INTO article  
SET title = '제목4',
`body`= '내용4';

# 데이터 확인
SELECT *
FROM article;
