DROP TABLE content ;
DROP TABLE cargrp IF EXISTS;

/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE content(
		carno NUMBER(10) NOT NULL PRIMARY KEY,
        cargrpno NUMBER(10)  NULL,
		name VARCHAR(100) NOT NULL,
		word VARCHAR(100) NULL,
		caroption VARCHAR(100) NULL,
        content VARCHAR(300) NULL,
		file1 VARCHAR(100) NULL,
		file1saved VARCHAR(100) NULL,
		thumb1 VARCHAR(100) NULL,
		size1 NUMBER(10) DEFAULT 0 NULL,
		price NUMBER(10) DEFAULT 0 NULL,
		insurance NUMBER(10) DEFAULT 0 NULL,
		adminno NUMBER(10) NOT NULL,
		recom NUMBER(10) DEFAULT 0 NULL,
		fuel VARCHAR(10)NULL,
		persons NUMBER(10) DEFAULT 0 NULL,
		year NUMBER(10) DEFAULT 0 NULL,
		replycnt NUMBER(10) DEFAULT 0 NULL,
		salecnt NUMBER(10) DEFAULT 0 NULL,

  FOREIGN KEY (cargrpno) REFERENCES cargrp (cargrpno)
);

COMMENT ON TABLE content is '컨텐츠 - 상품';
COMMENT ON COLUMN content.carno is '자동차 번호';
COMMENT ON COLUMN content.cargrpno is '자동차그룹번호';
COMMENT ON COLUMN content.name is '자동차 이름';
COMMENT ON COLUMN content.word is '차 검색어';
COMMENT ON COLUMN content.caroption is '차옵션';
COMMENT ON COLUMN content.content is '내용';
COMMENT ON COLUMN content.file1 is '메인이미지';
COMMENT ON COLUMN content.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN content.thumb1 is '메인 이미지 preview';
COMMENT ON COLUMN content.size1 is '메인 이미지 크기';
COMMENT ON COLUMN content.price is '가격';
COMMENT ON COLUMN content.insurance is '보험비';
COMMENT ON COLUMN content.adminno is '관리자 번호';
COMMENT ON COLUMN content.recom is '추천';
COMMENT ON COLUMN content.fuel is '연료';
COMMENT ON COLUMN content.persons is '인원수';
COMMENT ON COLUMN content.year is '연식';
COMMENT ON COLUMN content.replycnt is '댓글수';
COMMENT ON COLUMN content.salecnt is '할인률';


DROP SEQUENCE carno_seq;

CREATE SEQUENCE carno_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지
  
 -- 등록
INSERT INTO content(carno, cargrpno, name, word, caroption, content, file1, file1saved, thumb1, size1, price,
                              insurance, adminno, recom, fuel, persons, year ,replycnt,salecnt)
VALUES(carno_seq.nextval, 65, '모닝', '', '', '', 0, 0, 0, 0, 0,
            0, 1, 0, '', 0, 0, 0, 0);
            
            
INSERT INTO content(carno, cargrpno, name, word, caroption, content, file1, file1saved, thumb1, size1, price,
                              insurance, adminno, recom, fuel, persons, year ,replycnt,salecnt)
VALUES(carno_seq.nextval, 65, '마티즈', '', '', '', 0, 0, 0, 0, 0,
            0, 1, 0, '', 0, 0, 0, 0);
  
-- 카테고리 별 목록
SELECT carno, cargrpno, name, word, caroption, content, file1, file1saved, thumb1, size1, price,
        insurance, adminno, recom, fuel, persons, year,replycnt,salecnt
FROM content
ORDER BY cargrpno ASC;
--  read
SELECT carno, cargrpno, name, word, caroption, content, file1, file1saved, thumb1, size1, price,
        insurance, adminno, recom, fuel, persons, year,replycnt,salecnt
FROM content
ORDER BY carno ASC;

--수정
UPDATE content
SET name = 'morning'
WHERE carno = 1;



--cargrpno별 목록
SELECT carno, cargrpno, name, word, caroption, content, file1, file1saved, thumb1, size1, price,
        insurance, adminno, recom, fuel, persons, year ,replycnt,salecnt
FROM content
WHERE cargrpno=65
ORDER BY carno ASC;


-- 삭제
DELETE FROM content
WHERE carno = 1;
commit;

-- 검색
SELECT cargrpno, carno, SUBSTR(title, 1, 10) as title, SUBSTR(word, 1, 10) as word
FROM contents;


-- 모든 레코드 삭제
DELETE FROM content;
commit;


