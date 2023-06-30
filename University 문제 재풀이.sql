#문제1. 모든 학생의 학생번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.

SELECT
	`stdNo`,
	`stdName`,
	`stdHp`,
	a.`depNo`,
	`depName`
FROM `students` AS a
JOIN `departments` AS b
ON a.depNo = b.depNo;

#문제2. 모든 교수의 교수번호, 이름, 휴대폰, 학과번호, 학과명을 조회하시오.

SELECT
	`proNo`,
	`proName`,
	`proHp`,
	a.`depNo`,
	`depName`
FROM `professors` AS a
JOIN `departments` AS b
ON a.depNo = b.depNo;


#문제3. 모든 강좌의 강좌번호, 강좌명, 담당교수명, 휴대폰을 조회하시오.

SELECT
	`lecNo`,
	`lecName`,
	`proName`,
	`proHp`
FROM `lectures` AS a
JOIN `professors` AS b
ON a.proNo = b.proNo;

#문제4. 모든 강좌의 강좌번호, 강좌명, 담당교수 번호, 담당교수명, 휴대폰, 학과번호, 학과명을 조회하시오.  

SELECT
	`lecNo`,
	`lecName`,
	a.`proNo`,
	`proName`,
	`proHp`,
	b.`depNo`,
	`depName`
FROM `lectures` AS a
JOIN `professors` AS b
ON a.proNo = b.proNo
JOIN `departments` AS c
ON b.depNo = c.depNo;


#문제5. 모든 수강신청 내역에서 학생번호, 학생명, 강좌번호, 강좌명, 교수번호, 교수명을 조회하시오.

SELECT
	a.`stdNo`,
	`stdName`,
	a.`lecNo`,
	`lecName`,
	a.`proNo`,
	`proName`
FROM `register` AS a
JOIN `students` AS b
ON a.stdNo = b.stdNo
JOIN `lectures` AS c
ON a.lecNo = c.lecNo
JOIN `professors` AS d
ON a.proNo = d.proNo

#문제6. 수강신청 테이블에 출석점수, 중간고사점수, 기말고사점수를 임의로 입력하시오.(1~100 사이)

UPDATE `register` SET
							`regAttenScore` = CEIL(RAND() * 100),
							`regMidScore`   = CEIL(RAND() * 100),
							`regFinalScore` = CEIL(RAND() * 100);


#문제7. 수강신청 테이블에 입력한 출석점수, 중간고사점수, 기말고사 점수를 모두 합산 후 평균을 구해 총점에 입력하시오.

UPDATE `register` SET
							`regTotal` = (`regAttenScore` + `regMidScore` + `regFinalScore`) / 3;

#문제8. 수강신청 테이블에 총점을 기준으로 A ~ F 등급을 입력하시오.

UPDATE `register` SET
							`regGrade` = if(regTotal >= 90 , 'A',
											 if(regTotal >= 80 , 'B',
											 if(regTotal >= 70 , 'C',
											 if(regTotal >= 60 , 'D', 'F'))));

#문제9. 수강신청 테이블에서 총점이 가장 큰 점수를 조회하시오.

SELECT `regTotal` FROM `register` ORDER BY `regTotal` DESC LIMIT 1;
