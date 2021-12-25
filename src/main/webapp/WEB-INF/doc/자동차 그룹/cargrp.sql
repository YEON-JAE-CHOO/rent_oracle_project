DROP TABLE cargrp CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: 자동차그룹 */
/**********************************/
CREATE TABLE cargrp(
		cargrpno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cargrpname                    		VARCHAR2(15)		 NOT NULL,
        file1                             VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                                VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL 
);

COMMENT ON TABLE cargrp is '자동차그룹';
COMMENT ON COLUMN cargrp.cargrpno is '차그룹번호';
COMMENT ON COLUMN cargrp.cargrpname is '차그룹이름';
COMMENT ON COLUMN cargrp.file1 is '메인 이미지';
COMMENT ON COLUMN cargrp.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN cargrp.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN cargrp.size1 is ' 메인 이미지 크기';

DROP SEQUENCE cargrp_seq;

CREATE SEQUENCE cargrp_seq
  START WITH 1               -- 시작 번호
  INCREMENT BY 1           -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
--추가
INSERT INTO cargrp(cargrpno, cargrpname,file1,file1saved,thumb1,size1)
VALUES(categrp_seq.nextval, '경차', 'space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);

INSERT INTO cargrp(cargrpno, cargrpname,file1,file1saved,thumb1,size1)
VALUES(categrp_seq.nextval, '소형차','space.jpg', 'space_1.jpg', 'space_t.jpg', 1000);

-- 목록
SELECT cargrpno, cargrpname,file1,file1saved,thumb1,size1
FROM cargrp
ORDER BY cargrpno ASC;

--update
UPDATE cargrp
SET cargrpname='준중형',file1='space_001.jpg'
WHERE cargrpno = 43

    
--삭제
delete 
from cargrp
WHERE cargrpno = 1;





