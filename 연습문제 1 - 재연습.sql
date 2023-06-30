CREATE TABLE `Customer`(
	`custId` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`hp` CHAR(13) DEFAULT NULL,shopshop
	`addr` VARCHAR(100) DEFAULT NULL,
	`rdate` DATE NOT NULL
);

CREATE TABLE `Product` (
	`prodNo` INT PRIMARY KEY,
	`prodName` VARCHAR(10) NOT NULL,
	`stock` INT DEFAULT 0,
	`price` INT DEFAULT NULL,
	`company` VARCHAR(20) NOT NULL
);

CREATE TABLE `Order`(
	`orderNo` INT PRIMARY KEY,
	`orderId` VARCHAR(10) NOT NULL,
	`orderProduct` INT NOT NULL,
	`orderCount`INT DEFAULT 1,
	`orderDate` DATETIME NOT NULL
);

INSERT INTO `Customer` VALUES ('c101','김유신','010-1234-1001','김해시 봉황동','2022-01-01');
INSERT INTO `Customer` VALUES ('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
INSERT INTO `Customer` VALUES ('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
INSERT INTO `Customer` VALUES ('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
INSERT INTO `Customer` VALUES ('c105','이성계',null,NULL,'2022-01-05');
INSERT INTO `Customer` VALUES ('c106','정철','010-1234-1006','경기도 용인시','2020-01-06');
INSERT INTO `Customer` VALUES ('c107','허준',null,NULL,'2022-01-07');
INSERT INTO `Customer` VALUES ('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-08');
INSERT INTO `Customer` VALUES ('c109','송상현','010-1234-1009','부산시 동래구','2022-01-09');
INSERT INTO `Customer` VALUES ('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

INSERT INTO `Product` VALUES (1,'새우깡',5000,1500,'농심');
INSERT INTO `Product` VALUES (2,'초코파이',2500,2500,'오리온');
INSERT INTO `Product` VALUES (3,'포카칩',3600,1700,'오리온');
INSERT INTO `Product` VALUES (4,'양파링',1250,1800,'농심');
INSERT INTO `Product` VALUES (5,'죠리퐁',2200,null,'크라운');
INSERT INTO `Product` VALUES (6,'마카렛트',3500,3500,'롯데');
INSERT INTO `Product` VALUES (7,'뿌셔뿌셔',1650,1200,'오뚜기');

INSERT INTO `Order` VALUES (1,'c102',3,2,'2020-07-01 13:15:10');
INSERT INTO `Order` VALUES (2,'c101',4,1,'2022-07-01 14:16:11');
INSERT INTO `Order` VALUES (3,'c108',1,1,'2022-07-01 17:23:18');
INSERT INTO `Order` VALUES (4,'c109',6,5,'2022-07-02 10:46:36');
INSERT INTO `Order` VALUES (5,'c102',2,1,'2022-07-03 09:15:37');
INSERT INTO `Order` VALUES (6,'c101',7,3,'2022-07-03 12:35:12');
INSERT INTO `Order` VALUES (7,'c110',1,2,'2022-07-03 16:55:36');
INSERT INTO `Order` VALUES (8,'c104',2,4,'2022-07-04 14:23:23');
INSERT INTO `Order` VALUES (9,'c102',1,3,'2022-07-04 21:54:34');
INSERT INTO `Order` VALUES (10,'c107',6,1,'2022-07-05 14:21:03');


SELECT * FROM `Customer`;

SELECT
	`custId`,
	`name`,
	`hp`
FROM `customer`;

SELECT * FROM `Product`;

SELECT `company`
FROM `product`;

SELECT DISTINCT `company`
FROM `product`;

SELECT
	`prodName`,
	`price`
FROM `product`;

SELECT
	`prodName`,
	`price` + 500 AS `조정단가`
FROM `product`;

SELECT
	`prodName`,
	`stock`,
	`price`
FROM `product`
WHERE `company` = '오리온';

SELECT
	`orderProduct`,
	`orderCount`,
	`orderDate`
FROM `order`
WHERE `orderId` = 'c102';

SELECT *
FROM `product`
WHERE `price` BETWEEN 1000 AND 2000;

SELECT
	`custId`,
	`name`,
	`hp`,
	`addr`
FROM `Customer`
WHERE `name` LIKE '김%';

SELECT
	`custId`,
	`name`,
	`hp`,
	`addr`
FROM `Customer`
WHERE `name` LIKE '__';

SELECT *
FROM `customer`
WHERE `hp` IS NULL;

SELECT *
FROM `Customer`
WHERE `addr` IS NOT NULL;

SELECT *
FROM `customer`
order BY `rdate` DESC;

SELECT *
FROM `Order`
WHERE `orderCount` >= 3
order BY `orderCount` DESC , `orderNo` ;

SELECT
	AVG(`price`)
FROM `Product`;

SELECT
	SUM(`stock`) AS `재고량 합계`
FROM `Product`
WHERE `company` = '농심';

SELECT
	COUNT(custId) AS `고객수`
FROM `Customer`;

SELECT
	COUNT(DISTINCT company) AS `제조업체 수`
FROM `Product`;

SELECT
	`orderProduct` AS `주문 상품번호`,
	SUM(`orderCount`) AS `총 주문수량`
FROM `Order`
GROUP BY `orderProduct`
order BY `주문 상품번호`;

SELECT
	`company` AS `제조업체`,
	COUNT(*) AS `제품수`,
	MAX(`price`) AS `최고가`
FROM `product`
GROUP BY `company`
order BY `company`;

SELECT
	`company` AS `제조업체`,
	COUNT(*) AS `제품수`,
	MAX(`price`) AS `최고가`
FROM `Product`
GROUP BY `company`
HAVING `제품수` >= 2;

SELECT
	`orderProduct`,
	`orderId`,
	SUM(`orderCount`) AS `총 주문수량`
FROM `Order`
GROUP BY `orderProduct`,`orderId`
ORDER BY `orderProduct`

SELECT
	a.`orderId`,
	b.`prodName`
FROM `Order` AS a
JOIN `product` AS b
ON a.`orderProduct` = b.`prodNo`
WHERE `orderId` = 'c102';

SELECT
	`orderId`,
	`name`,
	`prodName`,
	`orderDate`
FROM `order` AS a
JOIN `customer` AS b
ON a.orderId = b.custId
JOIN `product` AS c
ON a.orderProduct = c.prodNo
WHERE `orderDate` like '2022-07-03 %';
