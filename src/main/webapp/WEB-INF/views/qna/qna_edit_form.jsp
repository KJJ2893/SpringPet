<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_form.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">

	function refresh(){
		location.reload();
	}
	
	//이거 뭔가 잘못된거 같다
	function qna_edit_finish(f){
		
		alert('수정완료 하시겠습니까?')
		/* if(!confirm("수정완료 하시겠습니까?")){
			return; //이거 뭐 리턴함?
		} */
		
		f.method="POST";
		f.action="qna_insert.do";
		f.submit();	
		
		//잘보내졌으면 수정완료 띄우고 싶은데 if에 뭐가 들어가야되지?
		/* if(json[0].result == 'yes'){
			alert("수정 완료");
			location.href="qna_main.do";  
		} */
		
		alert('수정 완료 !')
		
		let url = "qna_main.do"; 
		let param = "q_idx=${qnaVO.q_idx}";
		
		sendRequest(url,param,delCheck,"POST");

		
			
	}


</script>
</head>
<body>
	<!-- Q&A 수정 글쓰기 -->
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
		<input type="hidden" value="${id.u_idx}" >
	</div>
	
	<form enctype="multipart/form-data">
		<div class="qna_wrapperBox">
			<input class="titleBox" name="q_title" value="${qnaVO.q_title}">
				
			<div class="qna_upload_text">
				<textarea class="titleBox_long" name="q_content" >${qnaVO.q_content}</textarea> 
			</div>
		</div>
		
		<!-- 사진 첨부파일 업로드 폼 -->
		<div class="qna_wrapperBox">
			<span class="qna_category">
				사진 업로드
			</span>
			<div class="qna_imgContainer"></div>
				<input type="file" name="q_file" value="${pageContext.request.contextPath}/resources/upload/qna/${qnaVO.q_filename}"
						width="200px" height="200px" class="inputBtn" multiple>
			<p><strong>개당 업로드 용량 : 10MB, 용량을 준수하여 업로드 부탁드립니다</strong></p>
		</div>
			
		<div class="qna_wrapperBox">
			<span>
				<input type="button" value="수정완료" class="inputBtn" onclick="qna_edit_finish(this.form);">
			</span>
			<span>
				<input type="button" value="돌아가기" class="inputBtn" onclick="location.href='qna_view.do?q_idx=${qnaVO.q_idx}'">
		</div>
	</form> <!-- 사진 첨부파일 업로드 폼 -->
	
	
	<div class="qna_wrapperBox">
		<ul>
			<li>
				관리자의 권한으로 내용 수정시, 수정내용은 저장되지 않으며 수정완료 후 복구가 어렵습니다.
			</li>
			<li>
				현 게시판은 관리자의 권한으로 수정되기 때문에 반드시 관리자가 수정할 것을 권장합니다.
			</li>
		</ul>
	</div>
</body>
</html>