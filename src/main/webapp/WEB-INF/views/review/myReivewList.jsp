<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.top {
    position:absolute;
    top:20px;
    left:400px;


}
.btn1{
    background-color: #A582CF; 
    cursor:pointer;
    margin-left:100px;
    width:70px;
    height:30px;
    color: #fff;
    border-radius:10px;
  	text-align: center;
	border-color:blue;
}
.btn1:hover {
            border-color: aqua;
            color: white;
            box-shadow: 0 0.5em 0.5em -0.4em yellow;
            
            
        }
        .btn2{
        background-color: #A582CF; 
    cursor:pointer;
    color: #fff;
    border-color:blue;
    border-radius:10px;
        }
        .btn2:hover {
            border-color: aqua;
            color: white;
            box-shadow: 0 0.5em 0.5em -0.4em yellow;
        }  

</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review/reviewlist.css?after">
<script type="text/javascript">
	function go(f){
		var u_idx = f.u_idx.value;
		
		if(u_idx == ''){
			alert('로그인이 필요합니다.');
			location.href = "login_main.do";
		} else{
			f.action = "reivewInsert.do";
			f.submit();
		}
	}

</script>
</head>
<body style="background-image:url('resources/img/review.jpg')">
	<div class="logo">
	

		<a href="main_home.do"><img src="resources/img/hos logo.jpg" width="100px" height="100px"> </a>
	</div>
	<div class="top">
	<input type="button" value="소개" class="btn1"  onclick="location.href='info_main.do'"  >
	<input type="button" value="공지" class="btn1" onclick=""  >
	<input type="button" value="리뷰" class="btn1" onclick="location.href='review_main.do'"  >
	<input type="button" value="QNA"  class="btn1" onclick="location.href='qna_main.do'"  >
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
	
	
	
	
	
	<div class="top1">
		<form >
		
				
				<input class="bt1" type="button" value="목록으로" onclick="location.href='review_main.do'">
		
			<div class="list">
				<table border="1" align="center">
					<c:choose>
						<c:when test="${empty list }">
							<h2>작성한 리뷰가 없습니다.</h2>
						</c:when>
						<c:when test="${not empty list }">
							<caption><h2>리뷰</h2></caption>
							<c:forEach var="vo" items="${list }">
							<input type="hidden" name="u_idx" value="${vo.u_idx}">
								<input type="hidden" value="${vo.r_idx}" name="r_idx">
								<tr>
									<th>작성자 : ${vo.u_nickName }</th>
									<th>작성일 : ${vo.r_regdate }</th>
								</tr>
								<tr>
								<td>
									<img src="${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}"
				             	         width="100" height="100" onclick="openImage('${pageContext.request.contextPath}/resources/reviewImg/${vo.r_photo}')"
				             	         style="cursor: pointer;">
				             	</td>
									<td>
									<textarea class="col-auto form-control" id="reviewContents"
								 	 placeholder="${vo.r_content }" readonly></textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="right">
<<<<<<< HEAD
										<input type="button" value="수정"   onclick="location.href='view.do?r_idx=${vo.r_idx}'">
=======
										<input type="button"  value="수정" class="btn2" onclick="location.href='view.do?r_idx=${vo.r_idx}'">
>>>>>>> origin/1211_JIN_dClass
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</div>
		</form>
	</div>
</body>
</html>