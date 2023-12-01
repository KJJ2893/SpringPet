<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
 



    </style>
    
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/main.css">
</head>

<body class="body" >
<div >
	xx병원
</div>
	
	<div class="top">
	<input type="button" value="소개"  class="button" onclick="">
	<input type="button" value="공지" class="button"  onclick="">
	<input type="button" value="리뷰" class="button"  onclick="">
	<input type="button" value="QNA" class="button"  onclick="">
	<input type="button" value="예약" class="button"  onclick="">
	<input type="button" value="로그인" class="button"  onclick="location.href='login_main.do'">
	</div>
	

	
	





	<div class="sns">
	<a href="https://www.instagram.com"
	>인스타 그램으로 이동하기</a>
	</div>
	
	<div class="footer">
	<li>병원이름: 동물병원</li>
	<li> 주소  : 인천광역시 부평구 시장로 7 5층</li>
	<li>전화번호: 032-262-5890</li>
	<li> 이메일:email@naver.com</li>
	ⓒ2023.hospital name All rights reserved.
</div>
<div class="footer1">
	<li>대표자: 김재준</li>
	<li>대표자 전화번호:000-0000-0000</li>
	<li>사업자 등록번호:000-00-00000</li>
</div>
	<div class="footer2">
	<img src="https://pbs.twimg.com/media/E_U9JwvVEAcM2xG.jpg" width="30%" heigh="20%">
	</div>
	
  <div class="tab_content">
<input type="radio" name="tabmenu" id="tab01" checked>
<input type="radio" name="tabmenu" id="tab02" >
<input type="radio" name="tabmenu" id="tab03" >

<div class="conbox con1"><li>사람</li></div> 
<div class="conbox con2"><li>나무</li></div>
<div class="conbox con3"><li>집</li></div>

<div class="btn">
<label for="tab01"></label>
<label for="tab02"></label>
<label for="tab03"></label>
</div>
</div>
    

    
    
    

</body>
</html>