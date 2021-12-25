package dev.mvc.cargrp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        cargrpno                            NUMBER(7)        NOT NULL        PRIMARY KEY,
        cartype                             VARCHAR2(15)         NOT NULL,
 */
@Getter @Setter @ToString
public class CargrpVO {
    
  /** 자동차 그룹 번호 */
  private int cargrpno;
  
  /**  자동차 크기(ex.대형,중형,..) */
  private String cargrpname;
  
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