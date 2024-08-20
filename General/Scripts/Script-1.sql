SELECT AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA ON(AREA_CODE=AREA_CODE)
WHERE AREA_CODE = (
SELECT AREA_CODE FROM TB_MEMBER
WHERE MEMBER_NAME = '김영희')
ORDER BY 이름 DESC;

SELECT 
	AREA_NAME 지역명, 
	MEMBER_ID 아이디, 
	MEMBER_NAME 이름, 
	GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA USING(AREA_CODE) -- 연결에 사용할 컬럼명이 같을 경우 USING(컬럼명)을 사용해야한다. 사용하지 핞고 ON(컬럼명=컬럼명)을 사용한다면 ORA-00918 에러가 나타날것이다. ON (AREA_CODE = AREA_CODE) => USING(AREA_CODE)
WHERE MEMBER_NAME = ( -- 이름을 찾는데 엉뚱한 테이블의 컬럼을 가져와서 찾고있다. AREA_CODE => MEMBER_NAME 으로 수정해야한다
SELECT MEMBER_NAME FROM TB_MEMBER -- 이름을 찾는데 SELECT 절에서는 MEMBER_NAME컬럼이 아닌 지역코드 컬럼에서 찾고있다 MEMBER_NAME으로 수정해야한다
WHERE MEMBER_NAME LIKE '김영희') -- 인라인뷰가 아닌데 "이름"을 쓰면 안된다. ORA-00904 에러로 "이름"을 부적합한 식별자라는 에러가 나타날것이다. 해결하기 위해서는 MEMBER_NAME으로 수정해야한다. 이름 => MEMBER_NAME
ORDER BY MEMBER_NAME DESC; -- DESC는 내림차순이므로 오름차순으로 출력하기 원한다면 ASC로 수정해야한다. DESC => ASC
--SELECT 
--	AREA_NAME 지역명, 
--	MEMBER_ID 아이디, 
--	MEMBER_NAME 이름, 
--	GRADE_NAME 등급명
SELECT GRADE_NAME
FROM TB_GRADE;
SELECT MEMBER_NAME 이름 
FROM TB_MEMBER 
WHERE MEMBER_NAME LIKE '김영희';
SELECT 
	AREA_NAME 지역명, 
	MEMBER_ID 아이디, 
	MEMBER_NAME 이름, 
	GRADE_NAME 등급명
FROM TB_MEMBER
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA USING(AREA_CODE)
WHERE AREA_CODE IN ( -- WHERE AREA_CODE = ( => WHERE AREA_CODE IN (
SELECT AREA_CODE FROM TB_MEMBER
WHERE MEMBER_NAME = '김영희')
ORDER BY 이름 ASC;