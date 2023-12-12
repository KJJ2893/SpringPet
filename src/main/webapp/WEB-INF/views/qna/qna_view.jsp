<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_view.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function refresh(){
		location.reload();
	}
	
	function qna_del(){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		var pwd = "${id.u_pwd}"; //관리자 비번?
		var c_pwd = document.getElementById("c_pwd").value; //입력한 비밀번호
		
		if(pwd != c_pwd){
			alert("비밀번호 불일치");
			return;
		}
		
		var url = "qna_del.do"; //현재 구현안되있음
		var param = "q_idx=${qnaVO.q_idx}";
		
		sendRequest(url,param,delCheck,"POST");
	}
	
	function delCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data =xhr.responseText; //xhr = new XMLHttpRequest(); 를 담는 변수
			
			var json = eval(data);
			
			if(json[0].result == 'yes'){
				alert("삭제 성공");
				location.href="qna_main.do";  
			} else {
				alert("삭제 실패");
			}
		}
	}
	
	function qna_edit_form(){
		let q_idx = ${qnaVO.q_idx};
		location.href="qna_edit_form.do?q_idx="+q_idx;
	}
	

</script>
</head>
<body>
	
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
				<input type="button" value="상세보기" class="inputBtn" onclick="location.reload()">
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='main_home.do'">
				<input type="button" value="공지사항" class="inputBtn" onclick="location.href='qna_main.do'">
				<input type="button" value="글쓰기" class="inputBtn" onclick="location.href='qna_form.do'">
		</div>
	</div> <!-- qna_wrapperBox -->

	<div class="qna_wrapperBox">
		<span class="qna_category">
			공지사항 상세보기
		</span>
	</div>
	
	<div class="qna_wrapperBox">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${qnaVO.q_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qnaVO.q_idx }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${qnaVO.q_regdate }</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<img src="${pageContext.request.contextPath}/resources/upload/qna/${qnaVO.q_filename}"
					width="200px" height="200px">
				</td>
			</tr>
			
			
			<tr>
				<th>내용</th>
				<td width="500px" height="200px">${qnaVO.q_content }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="c_pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<!-- 수정 -->
					<img src="${pageContext.request.contextPath}/resources/img/testttt.png1" alt="수정" width="10px" height="10px" onclick="qna_edit_form()">
				<!-- 삭제 -->
					<img src="${pageContext.request.contextPath}/resources/img/testttt.png" width="10px" height="10px" onclick="qna_del()">
				</td>
			</tr>
			
		</table>
	</div>
</body>
</html>