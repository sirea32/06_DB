CREATE TABLE TB_TODO(
	TODO_TITLE VARCHAR2(100) PRIMARY KEY,
	TODO_DETAIL VARCHAR2(4000),
	TODO_COMPLETE VARCHAR2(10), 
	TODO_REG_DATE DATE DEFAULT CURRENT_DATE,
	
	CONSTRAINT TODO_CHECK CHECK(TODO_COMPLETE IN ('O', 'X'))
);