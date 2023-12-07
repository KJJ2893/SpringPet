<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/review.css">
<script type="text/javascript">
	
	function del(f){
		var u_idx = f.u_idx.value;
		var r_idx = f.r_idx.value;
		
		if(!confirm("리뷰를 삭제하시겠습니까?")){
			return;
		} else {
			
			f.action = "delReview.do";
			f.submit();
		}
	}
	
	function re(f){
		var r_content = f.r_content.value.trim();
		var u_idx = f.u_idx.value;
		var r_idx = f.r_idx.value;
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
		
		if(!confirm('수정하시겠습니까?')){
			return;
		}
		
		f.action = "upReview.do";
		f.submit();
	}
	
	// 이미지 파일인지 확인하는 함수
	function isImageFile(input){
		var allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
		return input.files.length > 0 && allowedTypes.includes(input.files[0].type);
	}
</script>
</head>
<body>
	<div class="logo">
		<a href="main_home.do"><img src="resources/img/hos logo.jpg"
			width="100px" height="100px"> </a>
	</div>
	<div class="top">
		<form method="POST" enctype="multipart/form-data">
			<input type="hidden" value="${vo.u_idx}" name="u_idx">
			<input type="hidden" value="${vo.r_idx}" name="r_idx">
			<div class="list">
				<table border="1">
					<caption>:::리뷰:::</caption>
					<tr>
						<th>작성자 : ${vo.u_nickName }</th>
						<th>작성일 : ${vo.r_regdate }</th>
					</tr>
					<tr>
						<td>
							<img
							src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
							width="100" height="100"
							onclick="openImage('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
							style="cursor: pointer;">
						</td>
						<td>
							<textarea name="r_content"class="col-auto form-control"
								id="reviewContents" placeholder="${vo.r_content }"></textarea>
						</td>
					</tr>
					<tr>
					<th>이미지 수정</th>
					<td><input type="file" name="photo"></td>
				</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="button" value="수정하기" onclick="re(this.form)">
							<input type="button" value="삭제하기" onclick="del(this.form)">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>