DROP DATABASE IF EXISTS c3;
CREATE DATABASE c3;
USE c3;



CREATE TABLE Residents(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
pet_id INT
);

CREATE TABLE Animals(
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL,
species VARCHAR(50) NOT NULL,
owner_id INT
);

INSERT INTO Residents VALUES(1,'Hyojin',1);
INSERT INTO Residents VALUES(2,'Dabin',NULL);
INSERT INTO Residents VALUES(3,'Seungwoo',3);
INSERT INTO Residents VALUES(4,'Heaun',2);

INSERT INTO Animals VALUES(1,'Toto','cat',1);
INSERT INTO Animals VALUES(2,'Miyo','cat',4);
INSERT INTO Animals VALUES(3,'Chino','dog',3);
INSERT INTO Animals VALUES(4,'Nana','cat',NULL);
INSERT INTO Animals VALUES(5,'Looloo','dog',NULL);

SELECT *
FROM Residents

SELECT *
FROM Animals

# 주인과 동물을 조회하시오

SELECT Residents.name AS '주인', Animals.name AS '동물이름'
FROM Residents 
INNER JOIN Animals 
ON Residents.id = Animals.owner_id

#resident_name 은 다 나온다. left join
SELECT residents.name AS resident_name, animals.name AS pet_name
FROM residents LEFT JOIN animals
ON residents.id = animals.owner_id;



#pet_name 은 다 나온다. right join
SELECT residents.name AS resident_name, animals.name AS pet_name
FROM residents RIGHT JOIN animals
ON residents.id = animals.owner_id;


#resident_name과 pet_name 둘다 빠짐없이 나온다. full outer join ( left join +union + right join )
SELECT residents.name AS resident_name, animals.name AS pet_name
FROM residents LEFT JOIN animals
ON residents.id = animals.owner_id
UNION
SELECT residents.name AS resident_name, animals.name AS pet_name
FROM residents RIGHT JOIN animals
ON residents.id = animals.owner_id;
