package dev.mvc.cargrp;

import java.util.List;

public interface CargrpProcInter {

    /**
     * 등록
     * 
     * @param categrpVO
     * @return 등록된 레코드 갯수
     */
    public int create(CargrpVO cargrpVO);
    
    /**
     * 등록 순서별 목록
     * @return
     */
    public List<CargrpVO> list_cargrpno_asc();
    
    /**
     * 조회, 수정폼, 삭제폼
     * @param categrpno 카테고리 그룹 번호, PK
     * @return
     */
    public CargrpVO read(int cargrpno);
    
    /**
     * 삭제 처리
     * @param categrpno
     * @return 처리된 레코드 갯수
     */
    public int delete(int cargrpno);
    
    /**
     * 수정 처리
     * @param categrpVO
     * @return 처리된 레코드 갯수
     */
    public int update(CargrpVO cargrpVO);
    
    

}
