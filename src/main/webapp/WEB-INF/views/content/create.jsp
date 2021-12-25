<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
<DIV class='title_line'>
  <A href="../categrp/list.do" class='title_link'>${cargrpVO.cargrpname }</A> 
  등록
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?cateno=${cateVO.cateno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_cateno_search.do'>
      <!-- <input type='hidden' name='cateno' value='${cateVO.cateno }'> -->
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
                     onclick="location.href='./list_by_cateno_search.do?cateno=${cateVO.cateno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
             enctype="multipart/form-data">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div class="form-group">
       <label class="control-label col-md-2">자동차 이름</label>
       <div class="col-md-10">
         <input type="text" name='name' value='ex)모닝' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 100%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">자동차 옵션</label>
       <div class="col-md-10">
         <textarea name="caroption" required="required" class="form-control" rows="5" style='width: 100%;'>ex)MP3. USB. 블루투스. 블랙박스. 후방센서.</textarea>
       </div>
    </div>
        <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name="content" required="required" class="form-control" rows="5" style='width: 100%;'>ex)금연차량 완전면책포함(사고1건 350만원 한도 적용)</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">연관 검색어 등록</label>
       <div class="col-md-10">
         <input type='text' name="word" value='# 가볍게 ,# 소형' required="required" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>   
    <div class="form-group">
       <label class="control-label col-md-2">메인이미지 등록</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택">
       </div>
    </div>    
        <div class="form-group">
       <label class="control-label col-md-2">가격</label>
       <div class="col-md-10">
         <input type='text' name="price" value='숫자만 입력해 주세요.' required="required" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>     
        <div class="form-group">
       <label class="control-label col-md-2">보험비</label>
       <div class="col-md-10">
         <input type='text' name="insurance" value='숫자만 입력해 주세요.' required="required" 
                    class="form-control" style='width: 100%;'>
       </div>
    </div>   
           <div class="form-group">
           <label class="control-label col-md-2">연료 종류</label>
       <div class="col-md-10">
            <select name = "fuel">      
              <option value="무연" selected="selected">무연</option>  
              <option value="휘발유">휘발유</option>
              <option value="LPG">LPG</option>
              </select>
       </div>
    </div>   
               <div class="form-group">
           <label class="control-label col-md-2">탑승 가능 인원수</label>
       <div class="col-md-10">
            <select name = "persons">      
              <option value='1' selected="selected">1</option>  
              <option value='2'>2</option>
              <option value='3'>3</option>
              <option value='4'>4</option>
              <option value='5'>5</option>
              <option value='6'>6</option>
              <option value='7'>7</option>
              <option value='8'>8</option>
              <option value='9'>9</option>
              </select>
       </div>
    </div>   
               <div class="form-group">
           <label class="control-label col-md-2">할인율</label>
       <div class="col-md-10">
         <input type='text' name="salecnt" value='숫자만 입력해 주세요.' required="required" 
                    class="form-control" style='width: 100%;'>
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