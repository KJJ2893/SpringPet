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
	
	function qna_edit_finish(f){
		
		f.action="qna_edit_finish.do";
		f.method="POST";
		f.submit();
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
		<form enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th>제목</th>
					<td><input name="q_title" value="${qnaVO.q_title}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="hidden" name="u_idx" value="${qnaVO.u_idx }">
						<input type="hidden" name="q_idx" value="${qnaVO.q_idx }">
					</td>
					
				</tr>
				<tr>
					<th>작성일</th>
					<td><input value="${qnaVO.q_regdate }"></td>
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
					<td width="500px" height="200px">
					<textarea name="q_content">${qnaVO.q_content}</textarea>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" id="c_pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
					<!-- 수정 -->
					<%-- 	<img src="${pageContext.request.contextPath}/resources/img/testttt.png1" alt="수정완료" 
						width="10px" height="10px" onclick="qna_edit_finish(this.form)"> --%>
						<input type="button" value="수정완료" class="inputBtn" onclick="qna_edit_finish(this.form);">
					<!-- 삭제 -->
						<img src="${pageContext.request.contextPath}/resources/img/testttt.png" width="10px" height="10px" onclick="qna_del()">
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</body>
</html>