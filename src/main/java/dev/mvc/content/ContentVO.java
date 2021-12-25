package dev.mvc.content;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ContentVO {
    /*
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
        explain VARCHAR(300) NULL,
        replycnt NUMBER(10) DEFAULT 0 NULL,
        salecnt NUMBER(10) DEFAULT 0 NULL,

  FOREIGN KEY (cargrpno) REFERENCES cargrp (cargrpno)
);
    ); 
     */
      /** 차 번호 */
      private int carno;  
      /** 차 그룹 번호 */
      private int cargrpno;
      /** 차 이름 */
      private String name;
      /** 등록일 */
      private String word;
      /** 등록된 글 수 */
      private String content;
      
      private String caroption;
      
      private int price;
      
      private int insurance;
      
      private int adminno;
      
      private int recom;
      
      private String fuel;
      
      private int persons;
      
      private int year;
      
      private String explain;
      
      private int replycnt;
      
      private int salecnt;
      
      /** 메인 이미지 */
      private String file1 = "";
      /** 실제 저장된 메인 이미지 */
      private String file1saved = "";  
      /** 메인 이미지 preview */
      private String thumb1 = "";
      /** 메인 이미지 크기 */
      private long size1;
      
      /** 
      이미지 MultipartFile 
      <input type='file' class="form-control" name='file1MF' id='file1MF' 
                       value='' placeholder="파일 선택">
      */
      private MultipartFile file1MF;

      /**
       * 파일 크기 단위 출력
       */
      private String size1_label;
      
      
    }

