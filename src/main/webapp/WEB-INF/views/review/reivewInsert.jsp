<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*작성하기 취소하기 버튼  */
.bt1{
		background-color:orange;
		 cursor:pointer;}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/reviewinsert.css">



<script src="resources/js/httpRequest.js"></script>
<script type="text/javascript">

		function send(f){
			var r_content = f.r_content.value.trim();
			var u_idx = f.u_idx.value;
			var photoInput = f.photo;
			
			if(r_content == ''){
				alert('리뷰를 작성해주세요 ㅠ');
				return;
			}
			
			if(photoInput.files.length > 0){
				if(!isImageFile(photoInput)){
					alert('이미지 파일만 첨부 가능합니다.');
					return;
				}
			}
			
			f.action = "review_insert.do";
			f.submit();
		}
		
		// 이미지 파일인지 확인하는 함수
		function isImageFile(input){
			var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
			return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
		}
</script>
</head>
<body style="background-image:url('resources/img/review.jpg')">
<a href="main_home.do">
<img src="resources/img/hos logo.jpg" width="100px" height="100px">
</a>
<div class="logo1">MY PET DOC
</div>
<div class="top">
	<input type="button" value="소개" class="btn1"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn1" onclick=""  >
	<input type="button" value="리뷰" class="btn1" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn1" onclick="location.href='qna_main.do'"  >
	<input type="button" value="예약"  class="btn1" onclick="location.href='rev_main.do'"  >
	<c:choose>
		<c:when test="${empty id}">
				
				<input type="button" value="펫 등록" class="btn"  onclick="go_pet()">
				<input type="button" value="정보수정" class="btn"  onclick="go_pet()">
				<input type="button" value="로그인"class="btn"   onclick="location.href='login_main.do'">
				
			</c:when>
			<c:when test="${not empty id}">
				
				<input type="button" value="펫 등록" class="btn1"  onclick="location.href='petinfo_main.do'">
				<input type="button" value="정보수정" class="btn1"  onclick="location.href='check_up.do'">
				<input type="button" value="로그아웃" class="btn1"   onclick="location.href='logout.do'">
			</c:when>
		</c:choose>
	</div>



	<div class="top1">
		<form method="POST" enctype="multipart/form-data">
			<input type="hidden" name="u_idx" value="${id.u_idx}">
			<table border="1" align="center">
				<caption><h2>리뷰 작성하기</h2></caption>
				<tr>
					<th colspan="2">이용 후기를 남겨주세요</th>
				</tr>
				<tr>
					<th>리뷰 내용 작성</th>
					<td><textarea  name="r_content" class="text" rows="10" cols="50"></textarea></td>	
				<tr>
					<th>이미지 첨부</th>
					<td><input type="file" name="photo"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="button" class="bt1" value="취소하기" onclick="location.href='review_main.do'">
					<input type="button" class="bt1" value="작성하기" onclick="send(this.form)"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>