-- MEMBERS 테이블 생성

CREATE TABLE MEMBERS(
MEMBER_ID VARCHAR2(20) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
MEMBER_PWD VARCHAR2(20) NOT NULL,
MEMBER_NAME CHAR(30), -- MEMBER_NAME 컬럼에 가변 길이 문자열 30byte 설정. CHAR는 고정길이 문자열
MEMBER_AGE NUMBER,
MEMBER_EMAIL VARCHAR2(50),


PRIMARY KEY(MEMBER_ID)

);

--DROP TABLE MEMBERS;

-- BOARDS 테이블 생성
CREATE TABLE BOARDS(

BOARD_NO NUMBER PRIMARY KEY,

BOARD_TITLE VARCHAR2(100),

BOARD_CONTENT VARCHAR2(4000),

BOARD_WRITER VARCHAR2(20) REFERENCES MEMBERS(MEMBER_ID),

BOARD_REG_DATE DATE DEFAULT CURRENT_DATE

);

--DROP TABLE BOARDS;







--// EMPLOYEE 테이블에서
--// 사번, 이름, 성별, 급여, 직급명, 부서명을 조회
--// 단, 입력 받은 조건에 맞는 결과만 조회하고 정렬할 것
--		
--// - 조건 1 : 성별 (M, F)
--// - 조건 2 : 급여 범위
--// - 조건 3 : 급여 오름차순/내림차순
--		
--// [실행화면]
--// 조회할 성별(M/F) : F
--// 급여 범위(최소, 최대 순서로 작성) : 3000000 4000000
--// 급여 정렬(1.ASC, 2.DESC) : 2
--		
--// 사번 | 이름   | 성별 | 급여    | 직급명 | 부서명
--//--------------------------------------------------------
--// 218  | 이오리 | F    | 3890000 | 사원   | 없음
--// 203  | 송은희 | F    | 3800000 | 차장   | 해외영업2부
--// 212  | 장쯔위 | F    | 3550000 | 대리   | 기술지원부
--// 222  | 이태림 | F    | 3436240 | 대리   | 기술지원부
--// 207  | 하이유 | F    | 3200000 | 과장   | 해외영업1부
--// 210  | 윤은해 | F    | 3000000 | 사원   | 해외영업1부

SELECT 
	EMP_ID, EMP_NAME, 
	DECODE(SUBSTR(EMP_NO,8,1), '1','M','2','F') 성별,
	SALARY, JOB_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE=DEPT_ID)
JOIN JOB USING(JOB_CODE)
WHERE DECODE(SUBSTR(EMP_NO,8,1), '1','M','2','F') = 'f'
AND SALARY BETWEEN ? AND ?
ORDER BY SALARY DESC;



