package dev.mvc.content;

import java.util.List;

public interface ContentProcInter {
  /**
   * 등록
   * @param cateVO
   * @return 등록된 갯수
   */
  public int create(ContentVO contentVO);
  
  /**
   * 등록 순서별 목록
 * @param cargrpno 
   * @return
   */
  public List<ContentVO> list_by_cargrpno(int cargrpno);
}