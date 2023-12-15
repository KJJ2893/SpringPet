<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go(){
		var url = "revInsert.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '예약하기', windowFeatures);
	   
	}
	

	function rev_select(f){
		var u_idx = f.u_idx.value;
		
		f.action = "rev_select.do";
		f.submit();
	}
	
	</script>
</head>
<body style="	background-repeat: no-repeat;
			background-size:100%;
			background-color:#E7D7B2;">
					
	<%-- <div class="wrapper">
		<div class="intro-bg">
		<div class="header">
			<div class="logo">
					<a href="main_home.do" id="logoa"><img src="resources/img/titleLogo.jpg" width="130px" height="130px"></a>
		        </div>
			<div class="title">
		        	<ul class="nav">
			            <li><a href="info_main.do">병원소개</a></li>
			            <li><a href="review_main.do">리뷰</a></li>
			            <li><a href="qna_main.do">QNA</a></li>
			            <li><a href="rev_main.do">예약</a></li>
			          	<c:choose>
							<c:when test="${empty id}">
								<li><a href="login_main.do">펫 등록</a></li>
								<li><a href="login_main.do">정보수정</a></li>
								<li><a href="login_main.do">로그인</a></li>
							</c:when>
							<c:when test="${not empty id}">
								<li><a href="petinfo_main.do">펫 등록</a></li>
								<li><a href="check_up.do">정보수정</a></li>
								<li><a href="logout.do">로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div> --%>
	<form>
		<input type="button" value="예약하기" onclick="go()">
		
		<c:choose>
			<c:when test="${empty id}">
				<input type="button" value="예약조회" onclick="location.href='login_main.do'">
			</c:when>
			<c:when test="${not empty id}">
				<input type="hidden" name="u_idx" value="${id.u_idx}" >
				<input type="button" value="예약조회" onclick="rev_select(this.form)">
			</c:when>
		</c:choose>
	</form>
</body>
</html>