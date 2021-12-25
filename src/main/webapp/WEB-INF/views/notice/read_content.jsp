<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dev.mvc.notice.NoticeVO" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지사항</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>공지사항</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./read_update.do?noticeno=${noticeVO.noticeno }">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./read_delete.do?noticeno=${noticeVO.noticeno }">삭제</A>
        <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  </DIV>
    
   <table class="table table-striped" style="text-align: center"; border:1px solid #dddddd">

      <thead>
        <TR>
        <th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글보기</th>
        </TR>
      </thead>
    <tbody>
      <c:set var="noticeno" value="${noticeVO.noticeno }" />
      <c:set var="seqno" value="${noticeVO.seqno }" />
      <c:set var="title" value="${noticeVO.title }" />
      <c:set var="content" value="${noticeVO.content }" />
      <c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
        <tr>
            <td style = "width:20%;">글제목</td>
            <td colspan="2">${title }</td>
        </tr>
        <tr>
            <td>작성번호</td>
            <td colspan="2">${seqno }</td>
        </tr>
        <tr>
            <td>작성일자</td>
            <td colspan="2">${rdate }</td>
        </tr>
            <tr>
            <td>내용</td>
            <td colspan="2" style="min-height:200px; text-align:left;">${content }</td>
        </tr> 
        </tbody>
        </table>
        </DIV>
        
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>