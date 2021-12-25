/**********************************/
/* Table Name: 공지사항 */
/**********************************/
drop table notice
CREATE TABLE notice(
    noticeno NUMERIC(10) NOT NULL PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    seqno NUMERIC(10) NOT NULL,
    visible CHAR(1) DEFAULT 'Y' NOT NULL ,
    rdate DATE NOT NULL,
    content varchar2(300) not null,
    file1  VARCHAR(100) NULL,
    file1saved VARCHAR2(100) NULL,
    thumb1 VARCHAR2(100) NULL,
    size1 NUMBER(10) DEFAULT 0 NULL,  
    word VARCHAR2(300) NULL 
   -- adminno NUMBER(10) NOT NULL 
);
alter table notice modify content varchar(300); 

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.title is '공지사항 제목';
COMMENT ON COLUMN notice.seqno is '공지사항 출력순서';
COMMENT ON COLUMN notice.visible is '공지사항 출력';
COMMENT ON COLUMN notice.rdate is '공지사항 날짜';
COMMENT ON COLUMN notice.content is '공지사항 내용';
COMMENT ON COLUMN notice.file1 is '메인 이미지';
COMMENT ON COLUMN notice.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN notice.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN notice.size1 is '메인 이미지 크기';
COMMENT ON COLUMN notice.word is '검색어';
-- COMMENT ON COLUMN notice.adminno is '관리자 번호';



DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

INSERT INTO notice(noticeno, title, seqno, visible, rdate,content,file1,file1saved,thumb1,size1,word)
VALUES(categrp_seq.nextval, '렌트카 이용규칙', 1, 'Y', sysdate,'',0,0,0,0,0);
 
INSERT INTO notice(noticeno, title, seqno, visible, rdate,content,file1,file1saved,thumb1,size1,word)
VALUES(categrp_seq.nextval, '렌트카 반납방식', 2, 'Y', sysdate,'',0,0,0,0,0);
 
INSERT INTO notice(noticeno, title, seqno, visible, rdate,content,file1,file1saved,thumb1,size1,word)
VALUES(categrp_seq.nextval, '렌트카 필독사항', 3, 'Y', sysdate,'',0,0,0,0,0);

-- notice 정렬
SELECT noticeno, title, seqno, visible, rdate,content,file1,file1saved,thumb1,size1,word
FROM notice
ORDER BY noticeno ASC;

-- 조회, 수정폼
SELECT noticeno, noticename, noticeseqno, noticevisible, noticerdate
FROM notice
WHERE noticeno = 1;

-- 수정
UPDATE notice
SET  title='1234', seqno=2, visible='Y',rdate=sysdate,content='내용입니다.',file1=null,
          file1saved=null, thumb1=null,size1=null,word=null
WHERE noticeno =30

-- seqno 정렬
SELECT noticeno, noticename, noticeseqno, noticevisible, noticerdate
FROM notice
ORDER BY noticeseqno ASC;

-- 출력 모드의 변경
UPDATE notice
SET noticevisible='Y'
WHERE noticeno=3;

SELECT * FROM notice;

UPDATE notice
SET noticevisible='N'
WHERE noticeno=3;

select *
from notice

commit;

