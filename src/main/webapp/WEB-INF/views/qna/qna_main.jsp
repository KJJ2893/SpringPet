<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_main.css" rel="stylesheet">
<script type="text/javascript">

	function refresh(){
		location.reload();
	}

	function send_list_form(f){
		//검색창에 조회했을때 조회값 가져오기
		
	}
	
	function testfn(){
		document.getElementById("test").style.maxHeight = "100%";
		
		document.getElementById("testBtn").style.display = "none"
		
	}
</script>
</head>
<body>
	
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='qna_form.do'">
		</div>
	</div> <!-- qna_wrapperBox -->

	<div class="qna_wrapperBox">
		<span class="qna_category">
			필독 공지사항
		</span>
	</div>
	
	<div class="qna_wrapperBox">
		<div class="list_search">
			<form class="searchform" name="list_search_form" onclick="send_list_form(this.form)">
				<fieldset>
					<select id="">
						<option values="title">글 번호</option>
						<option values="title">제목</option>
						<option values="content">내용</option>
					</select>
					<input class="search" type="text" placeholder="검색어를 입력하세요">
					<button class="submit" type="submit" ><img src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png"></button>
				</fieldset>
			</form>
			<p class="bestSearch"><strong>BEST 검색어 : </strong>예약 리뷰 펫등록</p>
		</div>
	</div>
	
	
	<div class="qna_wrapperBox" id="center">
	
		<hr>
		<div id="test">
			<c:forEach var="qna" items="${list }">
				<div class="listBox" onclick="location.href='qna_view.do'">
					
					
					<a href="qna_view.do?q_idx=${qna.q_idx }">
						<div class="table">
							<span class="th">번호</span>
							<span class="align">${qna.q_idx }</span>
						</div>
						<div class="table">
							<span class="th">제목</span>
							<span class="align">${qna.q_title }</span>
						</div>
						<div class="table">
							<span class="th">일자</span>
							<span class="align">${qna.q_regdate }</span>
						</div> 
						<div class="table">
							<span class="th">파일</span>
							<span class="align">
								<img src="${pageContext.request.contextPath}/resources/upload/qna/${qna.q_filename}" width="100px" height="100px">
							</span>
						</div> 
					</a>
				</div>
			</c:forEach>
		</div>
		<input id="testBtn" type="button" class="inputBtn" value="더보기 +" onclick="testfn()">
	</div>
</body>
</html>