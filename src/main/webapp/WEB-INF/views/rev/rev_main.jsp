<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
		<input type="button" value="예약하기"
			onclick="location.href='revInsert.do'"> 
		<input type="button" value="예약조회" onclick="">
		
		
		<%-- 조회로 가야할거
		
		<table border="1" align="center">
			<caption>예약 리스트</caption>
			<tr>
				<th>예약번호</th>
				<th>예약자명</th>
				<th>예약날짜</th>
				<th>예약시간</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.rv_idx }</td>
					<td>${vo.u_idx }</td>
					<td>${vo.rv_day }</td>
					<td>${vo.rv_time }</td>
				</tr>
			</c:forEach> --%>
			
			
		</table>
	</form>
</body>
</html>