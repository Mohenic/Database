#날짜 : 2023/06/16
#이름 : 손영우
#내용 : 2.테이블 제약조건 실습

#실습 2-1

CREATE table `User2`(
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13),
	`age` INT
);

#실습 2-2

INSERT INTO `User2` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `User2` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `User2` VALUES ('A103','장보고','010-1234-3333',32);
INSERT INTO `User2` VALUES ('B101','김유신','010-1234-1111',25);

#실습 2-3

CREATE TABLE `User3`(
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`age` int
);

#실습 2-4

INSERT INTO `User3` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `User3` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `User3` VALUES ('A103','장보고','010-1234-3333',32);
INSERT INTO `User3` VALUES ('B101','김유신','010-1234-2211',25);
INSERT INTO `User3` VALUES ('P101','홍길동','010-1234-1010',27);

#실습 2-5

CREATE TABLE `Parent`(
	`pid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) unique
);

CREATE TABLE `Child` (
	`cid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`pid` VARCHAR(10),
	FOREIGN KEY (`pid`) REFERENCES `Parent` (`pid`)
);

#실습 2-6

INSERT INTO `Parent` VALUES ('p101','홍길동','010-1234-1001');
INSERT INTO `Parent` VALUES ('p102','임꺽정','010-1234-1002');
INSERT INTO `Parent` VALUES ('p103','이성계','010-1234-1003');

INSERT INTO `Child` (`cid`,`name`,`hp`,`pid`) VALUES ('c101','홍길남','010-1234-2001','p101');
INSERT INTO `Child` (`cid`,`name`,`hp`,`pid`) VALUES ('c102','임철수','010-1234-2002','p102');
INSERT INTO `Child` (`cid`,`name`,`hp`,`pid`) VALUES ('c103','이방원','010-1234-2003','p103');
INSERT INTO `Child` (`cid`,`name`,`hp`,`pid`) VALUES ('c104','홍길여','010-1234-2004','p101');

#실습 2-7

CREATE TABLE `User4`(
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`gender` TINYINT,
	`age` INT,
	`addr` VARCHAR(255)
);


#실습 2-8

INSERT INTO `user4` (`name`,`gender`,`age`,`addr`) VALUES ('김유신',1,25,'김해시');
INSERT INTO `user4` (`name`,`gender`,`age`,`addr`) VALUES ('김춘추',1,23,'경주시');
INSERT INTO `user4` (`name`,`gender`,`age`,`addr`) VALUES ('장보고',1,35,'완도시');
INSERT INTO `user4` (`name`,`gender`,`age`,`addr`) VALUES ('강감찬',1,42,'서울시');
INSERT INTO `user4` (`name`,`gender`,`age`,`addr`) VALUES ('신사임당',2,47,'강릉시');
INSERT INTO `user4` (`gender`,`addr`) VALUES (1,'부산시');


#실습 2-9

CREATE TABLE `user5`(
	`name` VARCHAR(10) NOT NULL,
	`gender` TINYINT,
	`age` INT DEFAULT 1,
	`addr` VARCHAR(10)
);

#실습 2-10



#실습 2-11
#실습 2-12
#실습 2-13
#실습 2-14
#실습 2-15
#실습 2-16