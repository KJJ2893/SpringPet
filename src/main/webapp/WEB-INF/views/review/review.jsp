<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review.css">
<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function go(f) {
		var u_idx = f.u_idx.value;

		if (u_idx == '') {
			alert('로그인이 필요합니다.');
			location.href = "login_main.do";
		} else {
			f.action = "reivewInsert.do";
			f.submit();
		}

	}

	function go2(f) {
		var u_idx = f.u_idx.value;

		if (u_idx == '') {
			alert('로그인이 필요합니다.');
			location.href = " login_main.do";
		} else {
			f.action = "myReivewList.do";
			f.submit();
		}
	}

	/* 	function openImage(imageSrc){
	 window.open(imageSrc, '_blank', 'width=1000, height=800');
	 } */
</script>
</head>
<body>
	<div class="logo">
		<a href="main_home.do"><img src="resources/img/hos logo.jpg"
			width="100px" height="100px"> </a>
	</div>
	<div class="top">
		<form>
			<input type="hidden" name="u_idx" value="${id.u_idx}">
			<div class="r_bt">
				<input id="bt" type="button" value="리뷰쓰기" onclick="go(this.form)">
				<input id="bt" type="button" value="내 가 쓴 글"
					onclick="go2(this.form)">
			</div>
			<div class="list">
				<table border="1">
					<c:choose>
						<c:when test="${empty list }">
							<h2>작성된 리뷰가 없습니다.</h2>
						</c:when>
						<c:when test="${not empty list }">
							<caption>:::리뷰:::</caption>
							<c:forEach var="vo" items="${list }">
								<tr>
									<th>작성자 : ${vo.u_nickName }</th>
									<th>작성일 : ${vo.r_regdate }</th>
								</tr>
								<tr>
									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
										width="100" height="100"
										onclick="openImage('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
										style="cursor: pointer;"></td>
									<td><textarea class="col-auto form-control"
											id="reviewContents" placeholder="${vo.r_content }" readonly></textarea></td>
								</tr>
								<input type="hidden" value="${vo.r_idx}" name="r_idx">
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>
		</form>
	</div>
</body>
</html>