<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.notice.NoticeVO" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>굿트레블 렌트카</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
  </head>
 
<body>
<jsp:include page="../menu/top.jsp" />
 
 <DIV class= container>
<DIV class='title_line'>공지사항</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
    <button type="button" onclick="location.href='./create.do'">글 등록</button>
    </FORM>
  </DIV>
    
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">공지사항 제목</TH>
      <TH class="th_bs">공지사항 생성날짜</TH>
      <TH class="th_bs">출력 모드</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <%
    // Scriptlet
    // List<CategrpVO> list = (List<CategrpVO>)(request.getAttribute("list"));
    // for (CategrpVO categrpVO: list) {
    //    out.println(categrpVO.getName() + "<br>");
    // }
    %>
    <c:forEach var="noticeVO" items="${list}">
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="seqno" value="${noticeVO.seqno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
      <TR>
        <TD class="td_bs">${seqno }</TD>
        <TD class="td_bs_left"><A href = "/notice/read_content.do?noticeno=${noticeno}">${title }</TD>
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${noticeVO.visible == 'Y'}">
              <A href="./update_visible.do?noticeno=${noticeno }&visible=${noticeVO.visible }"><IMG src="/notice/images/open.png" style='width: 18px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_visible.do?noticeno=${noticeno }&visible=${noticeVO.visible }"><IMG src="/notice/images/close.png" style='width: 18px;'></A>
            </c:otherwise>
          </c:choose>
        </TD>   
        
        <TD class="td_bs">

          <A href="./update_seqno_up.do?noticeno=${noticeno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?noticeno=${noticeno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>