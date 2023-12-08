<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/reviewinsert.css?after">



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
	<div class="top">
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