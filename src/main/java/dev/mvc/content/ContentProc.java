package dev.mvc.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.content.ContentProc")
public class ContentProc implements ContentProcInter {

  @Autowired
  private ContentDAOInter contentDAO;
 
  public ContentProc() {
    System.out.println("-> ContentProc created");
  }
  
  @Override
  public int create(ContentVO contentVO){
    int cnt = this.contentDAO.create(contentVO);
    return cnt;
  }
  
  @Override
  public List<ContentVO> list_by_cargrpno(int cargrpno) {
      List<ContentVO> list = this.contentDAO.list_by_cargrpno(cargrpno);
      return list;
  }

}