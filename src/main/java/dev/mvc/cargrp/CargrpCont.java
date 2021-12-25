package dev.mvc.cargrp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class CargrpCont {
    @Autowired
    @Qualifier("dev.mvc.cargrp.CargrpProc")
    private CargrpProcInter cargrpProc;

    /** 업로드 파일 절대 경로 */
    private String uploadDir = Contents.getUploadDir();
    
    public CargrpCont() {
        System.out.println("-> CargrpCont created.");
    }

    // http://localhost:9091/cargrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/cargrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/cargrp/create"); // webapp/WEB-INF/views/cargrp/create.jsp

        return mav; // forward
    }
    
    /**
     * 등록 처리 http://localhost:9091/contents/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/cargrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, CargrpVO cargrpVO) {
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
        MultipartFile mf = cargrpVO.getFile1MF();

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

        cargrpVO.setFile1(file1);
        cargrpVO.setFile1saved(file1saved);
        cargrpVO.setThumb1(thumb1);
        cargrpVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.cargrpProc.create(cargrpVO);

        // ------------------------------------------------------------------------------
        // 연속 입력을위한 PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("-> cargrpno: " + cargrpVO.getCargrpno());
        mav.addObject("cargrpno", cargrpVO.getCargrpno()); // redirect parameter 적용
        // ------------------------------------------------------------------------------

      mav.addObject("cnt", cnt);

      if (cnt == 1) {

          mav.addObject("code", "create_success");
          mav.setViewName("/cargrp/msg"); 
      } else {
          mav.addObject("code", "create_fail");
          mav.setViewName("/cargrp/msg");
      }
      return mav; 
    }
    

    // 리스트 목록
    // http://localhost:9091/cargrp/list.do
    @RequestMapping(value = "/cargrp/cargrplist.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        List<CargrpVO> list = this.cargrpProc.list_cargrpno_asc();
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/cargrp/cargrplist"); // /webapp/WEB-INF/views/cargrp/list.jsp
        return mav;
    }
    

    // 수정 선택 페이지
    // http://localhost:9091/cargrp/read_update.do
    @RequestMapping(value = "/cargrp/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update() {
        ModelAndView mav = new ModelAndView();

        List<CargrpVO> list = this.cargrpProc.list_cargrpno_asc();
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/cargrp/read_update"); // /webapp/WEB-INF/views/cargrp/list.jsp
        return mav;
    }


    /**
     * 조회 + 수정폼
     * @param categrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/cargrp/read_update2.do", method=RequestMethod.GET )
    public ModelAndView read_update(int cargrpno) {
      // request.setAttribute("categrpno", int categrpno) 작동 안됨.
      
      ModelAndView mav = new ModelAndView();
      
      CargrpVO cargrpVO = this.cargrpProc.read(cargrpno);
      mav.addObject("CargrpVO", cargrpVO);  // request 객체에 저장
      
      List<CargrpVO> list = this.cargrpProc.list_cargrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/cargrp/read_update2"); // /WEB-INF/views/categrp/read_update.jsp 
      return mav; // forward
    }
    

    // http://localhost:9091/categrp/update.do
    /**
     * 수정 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/cargrp/update.do", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, CargrpVO cargrpVO) {
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
        MultipartFile mf = cargrpVO.getFile1MF();

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

        cargrpVO.setFile1(file1);
        cargrpVO.setFile1saved(file1saved);
        cargrpVO.setThumb1(thumb1);
        cargrpVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------
        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.cargrpProc.update(cargrpVO);
        
        if (cnt == 1) {

            mav.addObject("code", "update_success");
            mav.setViewName("/cargrp/msg"); 
        } else {
            mav.addObject("code", "update_fail");
            mav.setViewName("/cargrp/msg");
        }
        return mav;
    }

    //http://localhost:9091/categrp/read_delete.do
   /**
    * 조회 + 삭제폼
    * @param categrpno 조회할 카테고리 번호
    * @return
    */

   @RequestMapping(value = "/cargrp/read_delete.do", method = RequestMethod.GET)
   public ModelAndView read_delete() {
       ModelAndView mav = new ModelAndView();

       List<CargrpVO> list = this.cargrpProc.list_cargrpno_asc();
       mav.addObject("list", list); // request.setAttribute("list", list);

       mav.setViewName("/cargrp/read_delete"); // /webapp/WEB-INF/views/cargrp/list.jsp
       return mav;
   }
    /**
     * 삭제
     */
    @RequestMapping(value = "/cargrp/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int cargrpno) {
        ModelAndView mav = new ModelAndView();

        CargrpVO cargrpVO = this.cargrpProc.read(cargrpno); // 삭제 정보
        mav.addObject("cargrpVO", cargrpVO); // request 객체에 저장

        int cnt = this.cargrpProc.delete(cargrpno); // 삭제 처리
        mav.addObject("cnt", cnt);

        if (cnt == 1) {
            // System.out.println("등록 성공");

            mav.addObject("code", "delete_success"); // request에 저장,
            // request.setAttribute("code", "create_success")
            mav.setViewName("/cargrp/msg"); // /WEB-INF/views/cargrp/msg.jsp

            // response.sendRedirect("/cargrp/list.do");
            //mav.setViewName("/cargrp/msg");
        } else {
            mav.addObject("code", "delete_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/cargrp/msg"); // /WEB-INF/views/cargrp/msg.jsp
        }
        return mav; // forward

    }


}
