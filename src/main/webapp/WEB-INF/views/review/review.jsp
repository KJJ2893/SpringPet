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

function go_pet(){
	alert('로그인 필요');
	location.href="login_main.do";
} // go_pet()


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
<body style="background-image:url('resources/img/review.jpg')">
	<div class="logo">
		<a href="main_home.do"><img src="resources/img/hos logo.jpg"
			width="100px" height="100px"> </a>
	</div>
	<div class="logo1">MY PET DOC
</div>
	
	<div class="top">
	<input type="button" value="소개" class="btn1"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn1" onclick=""  >
	<input type="button" value="리뷰" class="btn1" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn1" onclick="location.href='qna_form.do'"  >
	<input type="button" value="예약"  class="btn1" onclick="location.href='rev_main.do'"  >
	<c:choose>
			<c:when test="${empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="go_pet()">
				<input type="button" value="정보수정" class="btn1"  onclick="go_pet()">
				<input type="button" value="로그인"class="btn1"   onclick="location.href='login_main.do'">
				
			</c:when>
			<c:when test="${not empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="location.href='petinfo_main.do'">
				<input type="button" value="정보수정" class="btn1"  onclick="location.href='check_up.do'">
				<input type="button" value="로그아웃" class="btn1"   onclick="location.href='logout.do'">
			</c:when>
		</c:choose>
	</div>
	<div class="post">
		<form>
			<input type="hidden" name="u_idx" value="${id.u_idx}">
			<div class="r_bt">
				<input class="bt1" type="button" value="리뷰쓰기" onclick="go(this.form)">
				<input class="bt" type="button" value="내 가 쓴 글" onclick="go2(this.form)">
			</div>
			<div class="list">
				<table border="1">
					<c:choose>
						<c:when test="${empty rlist }">
							<h2>작성된 리뷰가 없습니다.</h2>
						</c:when>
						<c:when test="${not empty rlist }">
							<caption><h2>리뷰목록</h2></caption>
							<c:forEach var="vo" items="${rlist }">
								<tr>
									<th>작성자 : ${vo.u_nickName }</th>
									<th>작성일 : ${vo.r_regdate }</th>
								</tr>
								<tr>
								
								<c:choose>
								<c:when test="${vo.r_photo}!='no_file' || ${vo.r_photo}!=null">
								
									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
										width="100" height="100"></td>
										</c:when>
										<c:otherwise>
										<td><img
										src="${pageContext.request.contextPath}/resources/petImg/defaultImg.jpg"
										width="100" height="100"></td>
										</c:otherwise>
										</c:choose>
									<td><textarea class="col-auto form-control"
											id="reviewContents" placeholder="${vo.r_content }" readonly></textarea></td>
								</tr>
								<input type="hidden" value="${vo.r_idx}" name="r_idx">
							</c:forEach>
							<!-- 페이징 -->
							<tr>
				             <td colspan="6"  style="text-align: center;">
				               <div class="paging">
									<c:if test="${nowpage!=1}">
										<c:choose>
											<c:when test="${nowpage>jumpgingPage}">
												<a href="review_main.do?page=${nowpage-jumpgingPage}">◀</a>
											</c:when>
											<c:otherwise>
												<a href="review_main.do?page=1" >◀</a>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:forEach var="index" begin="${minpage}" end="${maxpage}" step="1">
										<c:choose>
											<c:when test="${index==nowpage}">
												<a href="review_main.do?page=${index}" class="bolder">${index}</a>
											</c:when>
											<c:otherwise>
												<a href="review_main.do?page=${index}">${index}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${nowpage!=maxpage}">
										<c:choose>
											<c:when test="${nowpage<pagingCount-jumpgingPage}">
												<a href="review_main.do?page=${nowpage+jumpgingPage}">▶</a>
											</c:when>
											<c:otherwise>
												<a href="review_main.do?page=${pagingCount}">▶</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>	
				             </td>
				             </tr>
						</c:when>
					</c:choose>
				</table>
			</div>
		</form>
	</div>
	
</body>
</html>