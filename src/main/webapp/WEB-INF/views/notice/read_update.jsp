<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>공지사항 수정</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">
$(function(){
	 
});
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../notice/list.do" class='title_link'>공지사항 </A>
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list.do'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_cateno_search.do?cateno=">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm_update_read' method='POST' action='./update_read.do' class="form-horizontal"
             enctype="multipart/form-data">
      <input type='hidden' name='noticeno' id='noticeno' value='${noticeVO.noticeno }'>
    
    <div class="form-group">
       <label class="control-label col-md-2">제목</label>
       <div class="col-md-10">
         <input type='text' name='title' value='${noticeVO.title }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='content' required="required"  value='${noticeVO.content }' 
                        class="form-control" rows="12" style='width: 100%;'></textarea>
       </div>
    </div> 
        <div class="form-group">
       <label class="control-label col-md-2">출력 순서</label>
       <div class="col-md-10">
         <input type='number' name='seqno' value='${noticeVO.seqno }' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >
       </div>
    </div>  
    <div class="form-group">
       <label class="control-label col-md-2">파일첨부</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
       </div>
    </div>   
    <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='1234' required="required" 
                    class="form-control" style='width: 50%;'>
       </div>
    </div>   
            <div class="form-group">
       <label class="control-label col-md-2">출력 형식</label>
       <div class="col-md-10">
          <select name='visible' class="form-control" style='width: 20%;'>
            <option value='Y' selected="selected">Y</option>
            <option value='N'>N</option>
          </select>
       </div>
    </div>  
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
    </div>

  
  </FORM>
</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>