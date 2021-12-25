<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>렌트카 예약 페이지</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

 <c:set var="cargrpno" value="${CargrpVO.cargrpno }" />
<c:set var="cargrpname" value="${CargrpVO.cargrpname }" />
<c:set var="file1" value="${CargrpVO.file1 }" />
 
<DIV class='title_line'>렌트카 그룹  > 등록</DIV>
 
<DIV class='content_body'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'
       enctype="multipart/form-data">
      <input type='hidden' name='cargrpno' id='cargrpno' value='${cargrpno }'>
    <div class="form-group">
       <label class="control-label col-md-4">렌트카 그룹 이름</label>
       <div class="col-md-8">
         <input type='text' name='cargrpname' value='${cargrpname }' required="required" 
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>  
        <div class="form-group">
       <label class="control-label col-md-4">이미지</label>
       <div class="col-md-4">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='${file1 }' placeholder="파일 선택">
       </div>
    </div>  
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./cargrplist.do'" class="btn">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>