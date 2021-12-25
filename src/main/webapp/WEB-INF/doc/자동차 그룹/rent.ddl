DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE cargrp CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 차량 종류 */
/**********************************/
CREATE TABLE cargrp(
		cargrpno                      		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		cartype                       		VARCHAR2(15)		 NOT NULL,
		seqno                         		NUMBER(7)		 NOT NULL,
		rdate                         		DATE		 NOT NULL
);

COMMENT ON TABLE cargrp is '차량 종류';
COMMENT ON COLUMN cargrp.cargrpno is '차 그룹번호';
COMMENT ON COLUMN cargrp.cartype is '차 타입';
COMMENT ON COLUMN cargrp.seqno is '출력순서';
COMMENT ON COLUMN cargrp.rdate is '등록 날자';


/**********************************/
/* Table Name: 고객 */
/**********************************/
CREATE TABLE customer(
		name                          		VARCHAR2(15)		 NOT NULL		 PRIMARY KEY,
		age                           		NUMBER(10)		 NULL ,
		id                            		VARCHAR2(15)		 NOT NULL,
		secretnumber                  		VARCHAR2(15)		 NOT NULL
);

COMMENT ON TABLE customer is '고객';
COMMENT ON COLUMN customer.name is '이름';
COMMENT ON COLUMN customer.age is '나이';
COMMENT ON COLUMN customer.id is '아이디';
COMMENT ON COLUMN customer.secretnumber is '비밀번호';


