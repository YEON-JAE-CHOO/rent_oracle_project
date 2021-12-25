<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
<A href="/cargrp/cargrplist.do"><h4>렌트카 그룹</h4></A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="/cargrp/create.do?cargrpno=${cargrpVO.cargrpno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A id='frm_update_visible' href="/cargrp/read_update.do">수정</A>
    <span class='menu_divide' >│</span>
    <A id='frm_delete_visible' href="/cargrp/read_delete.do">삭제</A>
  </ASIDE> 
  <DIV class='menu_line'></DIV>
  
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="cargrpVO" items="${list }" varStatus="status">
      <c:set var="cargrpno" value="${cargrpVO.cargrpno }" />
      <c:set var="cargrpname" value="${cargrpVO.cargrpname }" />
      <c:set var="file1" value="${cargrpVO.file1 }" />
      <c:set var="size1" value="${cargrpVO.size1 }" />
      <c:set var="thumb1" value="${cargrpVO.thumb1 }" />

      <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경, index는 0부터 시작 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>

   <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='cargrpno' id='cargrpno' value='${cargrpVO.cargrpno }'>
      <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?cargrpno=${cargrpno}">               
                  <IMG src="/contents/storage/${thumb1 }" style='width: 100%; height: 150px;'>
                </a><br>
                ${cargrpname} <A href="./read_update2.do?cargrpno=${cargrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?cargrpno=${cargrpno}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${title}               
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?cargrpno=${cargrpno}">
              <img src='/cargrp/images/none1.png' style='width: 100%; height: 150px;'>
            </a><br>
             ${cargrpname} <A href="./read_update2.do?categrpno=${cargrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          </c:otherwise>
        </c:choose>        
        </FORM> 
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>

</DIV>

     <br><br>
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>

