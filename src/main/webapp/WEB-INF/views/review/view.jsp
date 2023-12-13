<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/view.css">
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
			<input type="hidden" value="${vo.u_idx}" name="u_idx">
			<input type="hidden" value="${vo.r_idx}" name="r_idx">
			<div class="list">
				<table border="1" align="center">
					<caption><h2>리뷰</h2></caption>
					<tr>
						<th>작성자 : ${vo.u_nickName }</th>
						<th>작성일 : ${vo.r_regdate }</th>
					</tr>
					<tr>
						<c:choose>
								<c:when test="${vo.r_photo != 'no_file' and vo.r_photo!=null}">
								
									<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
										width="100" height="100" onclick="openImg('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
										style="cursor: pointer;"></td>
										</c:when>
										
										<c:when test="${vo.r_photo == 'no_file' or vo.r_photo==null}">
										<td><img
										src="${pageContext.request.contextPath}/resources/reviewImg/defaultImg.jpg"
										width="100" height="100"></td>
										</c:when>
										</c:choose>
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
							<input type="button" class="btn" value="수정하기" onclick="re(this.form)">
							<input type="button" class="btn" value="삭제하기" onclick="del(this.form)">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>