CREATE TABLE `bank_customer`(
	`c_no` VARCHAR(14) PRIMARY KEY,
	`c_name` VARCHAR(20) NOT NULL,
	`c_dist` TINYINT DEFAULT 0,
	`c_phone` VARCHAR(20) NOT NULL,
	`c_addr` VARCHAR(100) DEFAULT NULL
);

CREATE TABLE `bank_account` (
	`a_no` VARCHAR(11) PRIMARY KEY,
	`a_item_dist` VARCHAR(2) NOT NULL,
	`a_item_name` VARCHAR(20) NOT NULL,
	`a_c_no` VARCHAR(14) NOT NULL,
	`a_balance` INT DEFAULT 0,
	`a_open_date` DATE NOT NULL
);

CREATE TABLE `bank_transaction` (
	`t_no` INT AUTO_INCREMENT PRIMARY KEY,
	`t_a_no` VARCHAR(11) NOT NULL,
	`t_dist` TINYINT NOT NULL,
	`t_amount` INT DEFAULT 0,
	`t_datetime` DATETIME NOT NULL
);

INSERT INTO `bank_customer` VALUES ('102-22-51094','부산의원',2,'051-518-1010','부산시 남구');
INSERT INTO `bank_customer` VALUES ('220-82-52237','(주)한국전산',2,'02-134-1045','서울시 강서구');
INSERT INTO `bank_customer` VALUES ('361-22-42687','(주)정보산업',2,'031-563-1253','경기도 광명시');
INSERT INTO `bank_customer` VALUES ('730423-1000001','김유신',1,'010-1234-1001','경기도 수원시');
INSERT INTO `bank_customer` VALUES ('750210-1000002','김춘추',1,'010-1234-1002','경기도 광주시');
INSERT INTO `bank_customer` VALUES ('830513-2000003','선덕여왕',1,'010-1234-1003','서울시 마포구');
INSERT INTO `bank_customer` VALUES ('870830-1000004','강감찬',1,'010-1234-1004','서울시 영등포구');
INSERT INTO `bank_customer` VALUES ('910912-2000005','신사임당',1,'010-1234-1005','강원도 강릉시');
INSERT INTO `bank_customer` VALUES ('941127-1000006','이순신',1,'010-1234-1006','부산시 영도구');

INSERT INTO `bank_account` VALUES ('101-11-1001','S1','자유저축예금','730423-1000001',420000,'2005-07-21');
INSERT INTO `bank_account` VALUES ('101-11-1003','S1','자유저축예금','870830-1000004',53000,'2007-02-17');
INSERT INTO `bank_account` VALUES ('101-11-2001','S1','자유저축예금','220-82-52237',23000000,'2003-04-14');
INSERT INTO `bank_account` VALUES ('101-11-2002','S1','자유저축예금','361-22-42687',4201000,'2008-12-30');
INSERT INTO `bank_account` VALUES ('101-11-2003','S1','자유저축예금','102-22-51094',8325010,'2010-06-07');
INSERT INTO `bank_account` VALUES ('101-12-1002','S2','정기정립예금','830513-2000003',1020000,'2011-05-13');
INSERT INTO `bank_account` VALUES ('101-13-1005','S3','주택청약예금','941127-1000006',720800,'2012-10-15');
INSERT INTO `bank_account` VALUES ('101-21-1004','L1','고객신용대출','910912-2000005',1200500,'2009-08-25');
INSERT INTO `bank_account` VALUES ('101-22-1006','L2','예금담보대출','730423-1000001',25000,'2013-12-11');
INSERT INTO `bank_account` VALUES ('101-23-1007','L3','주택담보대출','750210-1000002',2700000,'2020-09-23');

INSERT INTO `bank_transaction` VALUES (NULL,'101-11-1001',1,50000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-1003',2,120000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-2001',2,300000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-12-1002',1,1000000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-1001',3,0,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-13-1005',1,200000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-1001',1,450000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-2002',2,32000,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-2003',3,0,'2022-08-21 04:26:52');
INSERT INTO `bank_transaction` VALUES (NULL,'101-11-1003',1,75000,'2022-08-21 04:26:52');

SELECT * FROM `bank_account`;
SELECT * FROM `bank_customer`;
SELECT * FROM `bank_transaction`;

SELECT `c_name`,`c_no`
FROM `bank_customer`;

SELECT `a_item_dist`,`a_item_name`
FROM `bank_account`;

SELECT DISTINCT `a_item_dist`,`a_item_name`
FROM `bank_account`;

SELECT *
FROM `bank_account`
WHERE `a_item_dist` = 'S1' AND `a_balance` >= 1000000;

SELECT *
FROM `bank_customer`
WHERE `c_addr` LIKE '경기%'

SELECT *
FROM `bank_customer`
WHERE `c_dist` = 2;

SELECT *
FROM `bank_transaction`
WHERE `t_dist` = 1;

SELECT *
FROM `bank_transaction`
WHERE `t_dist` = 2
ORDER BY `t_amount` DESC;

SELECT
	SUM(`t_amount`) AS `입금총합`,
	AVG(`t_amount`) AS `입금평균`
FROM `bank_transaction`
WHERE `t_dist` = 1;

SELECT
	MAX(`t_amount`) AS `큰 금액`,
	MIN(`t_amount`) AS `작은 금액`
FROM `bank_transaction`
WHERE `t_dist` = 2;

SELECT *
FROM `bank_account`
WHERE `a_item_dist` = 'S1'
ORDER BY `a_balance` DESC;

SELECT *
FROM `bank_account`
WHERE `a_item_dist` = 'S1'
ORDER BY `a_balance` DESC
LIMIT 1;

SELECT *
FROM `bank_transaction`
WHERE `t_dist` IN (1,2)
ORDER BY `t_dist` , `t_amount` DESC;

SELECT
	COUNT(CASE WHEN `t_dist` = 1 THEN 1 END) AS `입금 건수`,
	COUNT(CASE WHEN `t_dist` = 2 THEN 1 END) AS `출금 건수`,
	COUNT(CASE WHEN `t_dist` = 3 THEN 1 END) AS `조회 건수`
FROM `bank_transaction`;

SELECT
	`t_dist`,
	CASE
	WHEN `t_dist` = 1 THEN '입금'
	WHEN `t_dist` = 2 THEN '출금'
	WHEN `t_dist` = 3 THEN '조회'
	END AS 'type',
	`t_a_no`,
	`t_amount`
FROM `bank_transaction`;

SELECT
	t_dist,
	COUNT(`t_no`)
FROM `bank_transaction`
GROUP BY `t_dist`

SELECT
	`t_a_no`,
	`t_dist`,
	SUM(`t_amount`)
FROM `bank_transaction`
WHERE `t_dist` = 1
GROUP BY `t_a_no`

SELECT
	`t_a_no`,
	`t_dist`,
	SUM(`t_amount`) AS `합계`
FROM `bank_transaction`
WHERE `t_dist` = 1
GROUP BY `t_a_no`
HAVING `합계` >= 100000
ORDER BY `합계` DESC ;
