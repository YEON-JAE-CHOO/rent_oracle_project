package dev.mvc.content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cargrp.CargrpProcInter;
import dev.mvc.cargrp.CargrpVO;
import dev.mvc.cargrp.Contents;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ContentCont {
    @Autowired
    @Qualifier("dev.mvc.cargrp.CargrpProc")
    private CargrpProcInter cargrpProc;
    
    @Autowired
    @Qualifier("dev.mvc.content.ContentProc")
    private ContentProcInter contentProc;
    
    /** 업로드 파일 절대 경로 */
    private String uploadDir = Contents.getUploadDir();

    public ContentCont() {
        System.out.println("-> ContentCont created.");
    }
    
    /**
     * 새로고침 방지, EL에서 param으로 접근
     * @return
     */
    @RequestMapping(value="/content/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();

      mav.setViewName(url); // forward
      
      return mav; // forward
    }
    
    /**
     * 등록폼
     * 사전 준비된 레코드: 관리자 1번, cateno 1번, categrpno 1번을 사용하는 경우 테스트 URL
     * http://localhost:9091/contents/create.do?cateno=1
     * 
     * @return
     */
    @RequestMapping(value = "/content/create.do", method = RequestMethod.GET)
    public ModelAndView create(int cargrpno) {
      ModelAndView mav = new ModelAndView();
      
      
      
      
      mav.setViewName("/content/create"); // /webapp/WEB-INF/views/contents/create.jsp
      // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
      // mav.addObject("content", content);

      return mav; // forward
    }
    /**
     * 등록 처리 http://localhost:9091/contents/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/content/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, ContentVO contentVO) {
        ModelAndView mav = new ModelAndView();

        // ------------------------------------------------------------------------------
        // 파일 전송 코드 시작
        // ------------------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir; // 파일 업로드 경로
        
        // 전송 파일이 없어도 file1MF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = contentVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        System.out.println("-> file1: " + file1);

        long size1 = mf.getSize(); // 파일 크기

        if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, uploadDir);

            if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
                thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
            }

        }

        contentVO.setFile1(file1);
        contentVO.setFile1saved(file1saved);
        contentVO.setThumb1(thumb1);
        contentVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.contentProc.create(contentVO);

        // ------------------------------------------------------------------------------
        // 연속 입력을위한 PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("-> cargrpno: " + contentVO.getCargrpno());
        mav.addObject("cargrpno", contentVO.getCargrpno()); // redirect parameter 적용
        // ------------------------------------------------------------------------------

      mav.addObject("cnt", cnt);

      if (cnt == 1) {

          mav.addObject("code", "create_success");
          mav.setViewName("/content/msg"); 
      } else {
          mav.addObject("code", "create_fail");
          mav.setViewName("/content/msg");
      }
      return mav; 
    }
    
    
    /**
     * 카테고리 그룹별 전체 목록
     * http://localhost:9091/cate/list_by_categrpno.do?categrpno=1 
     * @return
     */
    @RequestMapping(value="/content/list_by_cargrpno.do", method=RequestMethod.GET )
    public ModelAndView list_by_cargrpno(int cargrpno) {
      ModelAndView mav = new ModelAndView();
      
      List<ContentVO> list = this.contentProc.list_by_cargrpno(cargrpno);
      mav.addObject("list", list); // request.setAttribute("list", list);

      CargrpVO  cargrpVO = cargrpProc.read(cargrpno); 
      mav.addObject("CargrpVO", cargrpVO); 
      
      mav.setViewName("/content/list_by_cargrpno"); // /cate/list_by_categrpno.jsp
      return mav;
    }
    

}