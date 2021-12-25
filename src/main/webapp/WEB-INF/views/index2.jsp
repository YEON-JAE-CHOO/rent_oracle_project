<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>렌터카 예약 홈페이지</title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
  <script type="text/JavaScript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
  <!-- Fotorama -->
  <link href="fortorama/fotorama.css" rel="stylesheet">
  <script src="fortorama/fotorama.js"></script>
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  
<div class="fotorama"data-autoplay="4000" data-width="700" data-ratio="700/467" data-max-width="100%"
       style='margin: 0px auto; width: 70%;'>
    <img src="/images/fortorama/winter01.jpg">     
    <img src="/images/fortorama/winter02.jpg">
    <img src="/images/fortorama/winter03.jpg">     
    <img src="/images/fortorama/winter04.jpg">
     <img src="/images/fortorama/winter05.jpg">     
    <img src="/images/fortorama/winter06.jpg">
  </DIV>
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>