package dev.mvc.cargrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
//Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.cargrp.CargrpProc")

public class CargrpProc implements CargrpProcInter {

    @Autowired 
    private CargrpDAOInter cargrpDAO;

    public int create(CargrpVO cargrpVO) {
      int cnt = cargrpDAO.create(cargrpVO);
      
      return cnt;
    }
    
    @Override
    public List<CargrpVO> list_cargrpno_asc() {
      List<CargrpVO> list = null;
      list = this.cargrpDAO.list_cargrpno_asc();
      return list;
    }
    @Override
    public CargrpVO read(int cargrpno) {
        CargrpVO cargrpVO = this.cargrpDAO.read(cargrpno);
      
      return cargrpVO;
    }
    
    @Override
    public int delete(int cargrpno) {
      int cnt = 0;
      cnt = this.cargrpDAO.delete(cargrpno);
      
      return cnt;
    }
    
    @Override
    public int update(CargrpVO cargrpVO) {
        
      int cnt = this.cargrpDAO.update(cargrpVO);
      
      return cnt;
    }

}
