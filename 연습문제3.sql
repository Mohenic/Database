#날짜 : 2023/06/22
#이름 : 손영우
#내용 : SQL 연습문제3

#실습 3-1

CREATE DATABASE `College`;
CREATE USER 'admin3'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON college.* TO 'admin3'@'%';
FLUSH PRIVILEGES;

#실습 3-2

CREATE TABLE `Student`(
	`stdNo` CHAR(8) PRIMARY KEY,
	`stdName` VARCHAR(20) NOT NULL,
	`stdHp` CHAR(13) UNIQUE NOT NULL,
	`stdYear` TINYINT NOT NULL,
	`stdAddress` VARCHAR(100) DEFAULT NULL
);

CREATE TABLE `Lecture`(
	`lecNo` INT PRIMARY KEY,
	`lecName` VARCHAR(20) NOT NULL,
	`lecCredit`TINYINT NOT NULL,
	`lecTime` TINYINT NOT NULL,
	`lecClass` VARCHAR(10) DEFAULT NULL
);

CREATE TABLE `Register`(
	`regStdNo` CHAR(8) NOT NULL,
	`regLecNo` INT NOT NULL,
	`regMidScore` TINYINT DEFAULT NULL,
	`regFinalScore` TINYINT DEFAULT NULL,
	`regTotalScore` TINYINT DEFAULT NULL,
	`regGrade` CHAR(1) DEFAULT NULL
);
college
#실습 3-3

INSERT INTO `Student` VALUES ('20201016','김유신','010-1234-1001',3,NULL);
INSERT INTO `Student` VALUES ('20201126','김춘추','010-1234-1002',3,'경상남도 경주시');
INSERT INTO `Student` VALUES ('20210216','장보고','010-1234-1003',2,'전라남도 완도시');
INSERT INTO `Student` VALUES ('20210326','강감찬','010-1234-1004',2,'서울시 영등포구');
INSERT INTO `Student` VALUES ('20220416','이순신','010-1234-1005',1,'부산시 부산진구');
INSERT INTO `Student` VALUES ('20220521','송상현','010-1234-1006',1,'부산시 동래구');

INSERT INTO `Lecture` VALUES (159,'인지행동심리학',3,40,'본304');
INSERT INTO `Lecture` VALUES (167,'운영체제론',3,25,'본B05');
INSERT INTO `Lecture` VALUES (234,'중급 영문법',3,20,'본201');
INSERT INTO `Lecture` VALUES (239,'세법개론',3,40,'본204');
INSERT INTO `Lecture` VALUES (248,'빅데이터 개론',3,20,'본B01');
INSERT INTO `Lecture` VALUES (253,'컴퓨팅사고와 코딩',2,10,'본B02');
INSERT INTO `Lecture` VALUES (349,'사회복지 마케팅',2,50,'본301');

INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20201126',234,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20201016',248,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20201016',253,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20201126',239,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20210216',349,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20210326',349,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20201016',167,NULL);
INSERT INTO  `Register` (`regStdNo`,`regLecNo`,`regGrade`) VALUES ('20220416',349,null);

#실습 3-4

SELECT * FROM `lecture`;

#실습 3-5

SELECT * FROM `student`;

#실습 3-6

SELECT * FROM `register`;

#실습 3-7

SELECT *
FROM `student`
WHERE `stdYear` = 3; 

#실습 3-8

SELECT *
FROM `lecture`
WHERE `lecCredit` = 2;

#실습 3-9

UPDATE `register` SET `regMidScore` = 36, `regFinalScore` = 42
WHERE `regStdNo` = '20201126' AND `regLecNo` = 234;

UPDATE `register` SET `regMidScore` = 24, `regFinalScore` = 62
WHERE `regStdNo` = '20201016' AND `regLecNo` = 248;

UPDATE `register` SET `regMidScore` = 28, `regFinalScore` = 40
WHERE `regStdNo` = '20201016' AND `regLecNo` = 253;

UPDATE `register` SET `regMidScore` = 37, `regFinalScore` = 57
WHERE `regStdNo` = '20201126' AND `regLecNo` = 239;

UPDATE `register` SET `regMidScore` = 28, `regFinalScore` = 68
WHERE `regStdNo` = '20210216' AND `regLecNo` = 349;

UPDATE `register` SET `regMidScore` = 16, `regFinalScore` = 65
WHERE `regStdNo` = '20210326' AND `regLecNo` = 349;

UPDATE `register` SET `regMidScore` = 18, `regFinalScore` = 38
WHERE `regStdNo` = '20201016' AND `regLecNo` = 167;

UPDATE `register` SET `regMidScore` = 25, `regFinalScore` = 58
WHERE `regStdNo` = '20220416' AND `regLecNo` = 349;

#실습 3-10

UPDATE `register` SET
	`regTotalScore` = `regMidscore` + `regFinalScore`,
	`regGrade` = if(`regTotalScore` > 90, 'A',
				  	 if(`regTotalScore` >=80, 'B',
					 if(`regTotalScore` >=70, 'C',
					 if(`regTotalScore` >=60, 'D','F'))));

#실습 3-11

SELECT *
FROM `register`
ORDER BY `regTotalScore` DESC;

#실습 3-12

SELECT *
FROM `register`
WHERE `regLecNo` = 349
ORDER BY `regTotalScore` DESC

#실습 3-13

SELECT *
FROM `lecture`
WHERE `lectime` >= 30;

#실습 3-14

SELECT
	`lecName`,
	`lecClass`
FROM `lecture`;

#실습 3-15

SELECT
	`stdNo`,
	`stdName`
FROM `student`;

#실습 3-16

SELECT *
FROM `student`
WHERE `stdAddress` IS NULL;

#실습 3-17

SELECT *
FROM `Student`
WHERE `stdAddress` LIKE '부산%';

#실습 3-18

SELECT *
FROM `student` AS a
LEFT JOIN `register` AS b
ON a.stdNo = b.regStdNo;

#실습 3-19

SELECT
	`stdNo`,
	`stdName`,
	`regLecNo`,
	`regmidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `student` AS a, `register` AS b
WHERE a.stdNo = b.regStdno
ORDER BY stdNo;

#실습 3-20

SELECT
	`stdName`,
	`stdNo`,
	`regLecNo`
FROM `student` AS a
JOIN `register` AS b
ON a.stdNo = b.regStdNo
WHERE `regLecNo` = 349;

#실습 3-21

SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `student` AS a
JOIN `register` AS b
ON a.stdNo = b.regStdNo
GROUP BY `stdNo`
ORDER BY `stdNo`;

#실습 3-22

SELECT *
FROM `register` AS a
JOIN `lecture` AS b
ON a.`regLecNo` = b.`lecNo`;

#실습 3-23

SELECT
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regtotalScore`,
	`regGrade`
FROM `register` AS a
JOIN `lecture` AS b
ON a.`regLecNo` = b.`lecNo`

#실습 3-24

SELECT
	COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
	AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `register` AS a
JOIN `lecture` AS b
ON a.`regLecNo` = b.`lecNo`
WHERE `regLecno` = 349;

#실습 3-25

SELECT
	`regStdNo`,
	`lecName`
FROM `register` AS a
JOIN `lecture` AS b
ON a.`regLecNo` = b.`lecNo`
WHERE `regGrade` = 'A';

#실습 3-26

SELECT *
FROM `student` AS a
JOIN `register` AS b
ON a.`stdNo` = b.`regStdNo`
JOIN `lecture` AS c
ON b.`regLecNo` = c.`lecNo`
ORDER BY `stdNo`;

#실습 3-27

SELECT
	`stdNo`,
	`stdName`,
	`lecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `student` AS a
JOIN `register` AS b
ON a.`stdNo` = b.`regStdNo`
JOIN `lecture` AS c
ON b.`regLecNo` = c.`lecNo`
ORDER BY `regGrade`;

#실습 3-28

SELECT
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
FROM `student` AS a
JOIN `register` AS b
ON a.`stdNo` = b.`regStdNo`
JOIN `lecture` AS c
ON b.`regLecNo` = c.`lecNo`
WHERE `regGrade` = 'F';

#실습 3-29

SELECT
	`stdNo`,
	`stdName`,
	SUM(`lecCredit`) AS `이수학점`
FROM `student` AS a
JOIN `register` AS b
ON a.`stdNo` = b.`regStdNo`
JOIN `lecture` AS c
ON b.`regLecNo` = c.`lecNo`
WHERE `regTotalScore` >= 60
GROUP BY `stdNo`
ORDER BY `stdNo`;

#실습 3-30

SELECT
	`stdNo`,
	`stdName`,
	GROUP_CONCAT(`lecName`),
	GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName` , NULL)) AS `이수과목`
FROM `student` AS a
JOIN `register` AS b
ON a.`stdNo` = b.`regStdNo`
JOIN `lecture` AS c
ON b.`regLecNo` = c.`lecNo`
GROUP BY `stdNo`;