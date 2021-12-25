<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'><a href='/index.do'>메인 홈페이지가기</a></DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/cargrp/cargrplist.do'>렌트카 예약</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/cate/list_all.do'>이벤트</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/notice/list.do'>공지사항</A><span class='top_menu_sep'> </span>          
      <A class='menu_link'  href='/notice/list.do'>고객센터</A><span class='top_menu_sep'> </span>               
            
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>