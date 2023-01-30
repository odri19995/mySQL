DROP DATABASE IF EXISTS c1;
CREATE DATABASE c1;
USE c1;

DROP TABLE FIRST_HALF;

CREATE TABLE FIRST_HALF(
SHIPMENT_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
FLAVOR 	VARCHAR(50) NOT NULL ,
TOTAL_ORDER INT NOT NULL
);

INSERT INTO FIRST_HALF VALUES(101,'chocolate',3200);
INSERT INTO FIRST_HALF VALUES(102,'vanilla',2800);
INSERT INTO FIRST_HALF VALUES(103,'mint_chocolate',1700);
INSERT INTO FIRST_HALF VALUES(104,'caramel',2600);
INSERT INTO FIRST_HALF VALUES(105,'white_chocolate',3100);

INSERT INTO FIRST_HALF VALUES(106,'peach',2450);
INSERT INTO FIRST_HALF VALUES(107,'watermelon',2150);
INSERT INTO FIRST_HALF VALUES(108,'mango',2900);
INSERT INTO FIRST_HALF VALUES(109,'strawberry',3100);
INSERT INTO FIRST_HALF VALUES(110,'melon',3150);

INSERT INTO FIRST_HALF VALUES(111,'orange',2900);
INSERT INTO FIRST_HALF VALUES(112,'pineapple',2900);

SELECT FLAVOR
FROM FIRST_HALF
ORDER BY TOTAL_ORDER DESC, SHIPMENT_ID ASC

DATE_FORMAT(HIRE_YMD,'%Y-%m-%d')
#SELECT DR_NAME,DR_ID,MCDP_CD, DATE_FORMAT(HIRE_YMD,'%Y-%m-%d') AS HIRE_YMD