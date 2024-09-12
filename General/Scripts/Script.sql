SELECT
	EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY, HIRE_DATE
FROM EMPLOYEE;

-- 입력 받은 급여보다 초과해서 받는 사원의
-- 사번, 이름, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > 4000000;

-- 입력 받은 최소 급여 이상
-- 입력 받은 최대 급여 이하를 받는
-- 사원의 사번, 이름, 급여를 급여 내림차순으로 조회


-- 부서명을 입력받아
-- 해당 부서에 근무하는 사원의
-- 사번, 이름, 부서명, 직급명을
-- 직급코드 오름차순으로 조회
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE=DEPT_ID)
JOIN JOB USING(JOB_CODE)
WHERE DEPT_TITLE = '인사관리부'
ORDER BY DEPT_CODE ASC;


-- TB_USER 테이블 생성
CREATE TABLE TB_USER(
	USER_NO 		NUMBER 			 CONSTRAINT TB_USER_PK PRIMARY KEY,
	USER_ID 		VARCHAR2(30) NOT NULL,
	USER_PW 		VARCHAR2(30) NOT NULL,
	USER_NAME 	VARCHAR2(30) NOT NULL,
	ENROLL_DATE DATE 				 DEFAULT CURRENT_DATE
);

COMMENT ON COLUMN TB_USER.USER_NO IS '사용자 번호';
COMMENT ON COLUMN TB_USER.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN TB_USER.USER_PW IS '사용자 비밀번호';
COMMENT ON COLUMN TB_USER.USER_NAME IS '사용자 이름';
COMMENT ON COLUMN TB_USER.ENROLL_DATE IS '사용자 가입일';


-- USER_NO 컬럼에 삽입될 시퀀스 생성
CREATE SEQUENCE SEQ_USER_NO NOCACHE; -- NOCACHE : 미리 번호를 만들겠다

-- 샘플 데이터 INSERT
INSERT INTO TB_USER
VALUES(SEQ_USER_NO.NEXTVAL, 'user01', 'pass01', '유저일', DEFAULT);
			
SELECT * FROM TB_USER;

COMMIT;


-- 아이디, 비밀번호, 이름을 입력받아
-- 아이디, 비밀번호가 일치하는 사용자(TB_USER)의
-- 이름을 수정

UPDATE TB_USER
SET
	USER_NAME = '홍길동'
WHERE
	USER_ID = 'user01'
AND
	USER_PW = 'pass01';
-- 아이디, 비밀번호 일치 -> 수정 성공(1)
-- 아이디 또는 비밀번호 불일치 -> 수정 실패(0)

ROLLBACK;

SELECT * FROM TB_USER;




-- 모든 USER 조회
SELECT 
	USER_NO,
	USER_ID,
	USER_PW,
	USER_NAME,
	TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월" DD"일"') 
		ENROLL_DATE
FROM TB_USER
ORDER BY USER_NO ASC;



-- 검색어가 이름에 포함된 User 조회
SELECT 
	USER_NO,
	USER_ID,
	USER_PW,
	USER_NAME,
	TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월" DD"일"') ENROLL_DATE
FROM TB_USER
WHERE USER_NAME LIKE '%' || '저' || '%'
ORDER BY USER_NO ASC;

-- USER_NO를 입력 받아 일치하는 User 삭제(DELETE)
DELETE
FROM TB_USER
WHERE USER_NO = ?;
-- 일치하는 USER_NO가 있을 경우 : 1행 삭제
-- 일치하는 USER_NO가 없을 경우 : 0행 삭제

ROLLBACK;


-- ID, PW 가 일치하는 회원 조회
SELECT *
FROM TB_USER
WHERE USER_ID = 'user01'
AND	  USER_PW = 'pass01';

-- ID, PW 가 일치하는 회원의 이름을 수정
UPDATE TB_USER
SET   USER_NAME = '이순신 장군'
WHERE USER_ID = 'user01'
AND	  USER_PW = 'pass01';

SELECT * FROM TB_USER;
ROLLBACK;

SELECT USER_NO
FROM TB_USER
WHERE USER_ID = 'user01'
AND	  USER_PW = 'pass01';

UPDATE TB_USER
SET USER_NAME = '이순신 장군'
WHERE USER_NO = 2;


-- 중복되는 아이디가 있는지 조회
-- 중복이면 1, 아니면 0
SELECT COUNT(*)
FROM TB_USER
WHERE USER_ID = 'user01';





