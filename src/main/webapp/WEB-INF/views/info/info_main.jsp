<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function go_pet(){
	alert('로그인 필요');
	location.href="login_main.do";
} // go_pet()

</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/info/info.css?after">
</head>
<body style="background-image:url('resources/img/infoimg.jpg')">
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
	  		<a href="main_home.do" class="logo">
						<h1>MY PET DOC</h1>
						<img src="resources/img/hos logo.jpg" width="100px" height="100px">
					</a>
</div>

	<div class="top">
	<input type="button" value="소개" class="btn"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn" onclick=""  >
	<input type="button" value="리뷰" class="btn" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn" onclick="location.href='qna_main.do'"  >
	<input type="button" value="예약"  class="btn" onclick="location.href='rev_main.do'"  >
	<c:choose>
			<c:when test="${empty id}">
				
				<input type="button" value="펫 등록" class="btn"  onclick="go_pet()">
				<input type="button" value="정보수정" class="btn"  onclick="go_pet()">
				<input type="button" value="로그인"class="btn"   onclick="location.href='login_main.do'">
				
			</c:when>
			<c:when test="${not empty id}">
				
				<input type="button" value="펫 등록" class="btn"  onclick="location.href='petinfo_main.do'">
				<input type="button" value="정보수정" class="btn"  onclick="location.href='check_up.do'">
				<input type="button" value="로그아웃" class="btn"   onclick="location.href='logout.do'">
			</c:when>
		</c:choose>
	</div>
			
			<div class="intro_text">
				<h1>병원 소개</h1>
				
				<h3 class="contents1">
					환자를 우선으로 생각하는 따뜻한 마음<br>
					전문적인 수의의료서비스<br>
					경인지역 서부권에서 가장 신뢰받는 병원
					지역주민을 위한 봉사활동<br>
					다년간 축적된 노하우<br>
					끊임없이 연구하는 최상의 치료방법<br>
					
					</h3>
					
			</div>
		</div>
	</div>
	
	<div class="main_text1">
		<h1>SERVICE</h1>
		<div class="contents1">
			저희 동물의료센터를 찾아주신 반려동물 보호자님께 감사의 말씀을 전합니다.
		</div>
		<div class="service">
			<div class="food_photo">
				<img src="${pageContext.request.contextPath}/resources/img/puppy.jpg">
			</div>
			<div class="contents2">
				<h2>우리 동물병원은</h2>
					<li> 과별 분과 진료와</li>
					<li>첨단 장비를 통한 정확한 진단</li> 
					<li> 본원만의 진료 및 치료 노하우</li>
					<li>반려동물과 보호자님께 최고의 수의 의료서비스</li> 
					<li>검단사거리에 위치한 경인지역 서부권 중심병원</li><br>
					<br>
					<h2>마음이 따뜻하고 실력있는 의료진들이 소중한 반려동물과 함께 하겠습니다.</h2>
			</div>
		</div>
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
		<div class="sns">
	<a href="https://www.instagram.com">
	<img src="resources/img/insta.jpg" width="100px" height="100px">
	</a>
	<a href="https://www.kakaocorp.com/page/service/service/KakaoTalk">
	<img src="resources/img/talk.jpg" width="100px" height="100px">
	</a>
	<a href="www.facebook.com">
	<img src="resources/img/facebook.jpg" width="100px" height="100px">
	</a>
	</div>
</body>
</html>