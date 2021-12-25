<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<%-- /static/css/style.css --%> 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'>렌트카 그룹 > 알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${code == 'create_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">새로운 렌트카 그룹 [${cargrpVO.cargrpname }] 등록했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'create_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">새로운 렌트카 그룹 [${categrpVO.cargrpname }] 등록에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'update_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">그룹 수정에 성공했습니다.</span>
          </LI>                                                                      
        </c:when>
         <c:when test="${code == 'update_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">카테고리 그룹 수정에 실패했습니다.</span>
          </LI>                                                                      
        </c:when>
        <c:when test="${code == 'delete_success'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_success">삭제에 성공했습니다.</span>
          </LI>                                                                      
        </c:when>        
        <c:when test="${code == 'delete_fail'}"> <%-- Java if --%>
          <LI class='li_none'>
            <span class="span_fail">삭제에 실패했습니다.</span>
          </LI>                                                                      
        </c:when> 
        <c:otherwise>
          <LI class='li_none_left'>
            <span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <c:choose>
            <c:when test="${cnt == 0 }">
                <button type='button' onclick="history.back()" class="btn">다시 시도</button>    
            </c:when>
        </c:choose>
        
        <button type='button' onclick="location.href='./cargrplist.do'" class="btn">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>