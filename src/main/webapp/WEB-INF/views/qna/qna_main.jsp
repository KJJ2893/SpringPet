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
					<input class="search" type="text" placeholder="검색어를 입력하세요" style="width:900px;">
					<button class="submit" type="submit" ><img src="https://www.coffeebeankorea.com/images/btn/btn_list_search.png"></button>
				</fieldset>
			</form>
		</div>
	</div>
	
	
	<div class="qna_wrapperBox">
	
		<hr background-color="orange">
		<c:forEach var="qna" items="${list }">
			<div class="listBox">
			<a href="qna_view?q_idx=${qna.q_idx }">
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
			</a>
			</div>
			
		</c:forEach>
	</div>
</body>
</html>