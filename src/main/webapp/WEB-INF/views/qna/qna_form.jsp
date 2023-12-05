<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_form.css" rel="stylesheet">
<script type="text/javascript">
	function send_check(){
		const f = document.f;
		
		if(f.subject.value == ''){
			alert('제목을 입력하세요');
			f.subject.focus();
			return;
		}
		
		if(f.name.value == ''){
			alert('작성자를 입력하세요');
			f.name.focus();
			return;
		}
		
		if(f.content.value.trim() == ''){
			alert('한글자 이상 입력하세요');
			f.content.focus();
			return;
		}
		
		if(f.pwd.value == ''){
			alert('비밀번호를 입력하세요');
			f.pwd.focus();
			return;
		}
		
		f.action=""
		f.submit();
			
	}

</script>
</head>
<body>
	<!-- Q&A 글쓰기 -->
	<div class="qna_wrapperBox">
		<span class="qna_category">Q&A 카테고리</span>	
		<div class="qna_category">
			<span>
				<input type="button" value="자주 묻는 질문" class="inputBtn" onclick="#">
			</span>
			<span>
				<input type="button" value="메인으로 돌아가기" class="inputBtn" onclick="location.href='qna_main.do'">
			</span>
		</div>
	</div> <!-- qna_wrapperBox -->
	
	<div class="qna_wrapperBox">
		<span class="qna_category">
			자주 묻는 질문 작성하기
		</span>
	</div>	
		<div class="qna_wrapperBox">
			<input type="text" value="${id.u_nickName}" > <!-- 작성자 hidden -->
			<div class="qna_space"></div>
		</div>
		
		<div class="qna_wrapperBox">
			<input class="titleBox" placeholder="제목을 입력해 주세요">
			<div class="qna_space"></div>
			
		<div class="qna_upload_text">
			<textarea class="titleBox_long" placeholder="5자 이상 내용을 입력해주세요"></textarea>
			<div class="qna_space"></div>
		</div>
	</div>
	
	<div class="qna_wrapperBox"> 
		<span class="qna_category">태그 입력</span>
		<input class="titleBox" placeholder="태그를 입력해주세요">
	</div>
	
	<!-- 사진, 동영상 첨부파일 업로드 폼 -->
	<form method="POST" enctype="mulipart/form-data">
		<div class="qna_wrapperBox">
			<span class="qna_category">
				사진 업로드
			</span>
			<div class="qna_imgContainer"></div>
				<input type="file" value="사진첨부" class="inputBtn">
			<p><strong>개당 업로드 용량 : 10MB, 용량을 준수하여 업로드 부탁드립니다</strong></p>
		</div>
		
		<div class="qna_wrapperBox">
			<span class="qna_category">
				동영상 업로드
			</span>
			<div class="qna_imgContainer"></div>
				<input type="file" value="동영상첨부" class="inputBtn">
				<p><strong>개당 업로드 용량 : 60MB, 동영상은 최대 1개 업로드 가능합니다</strong></p>
		</div>
		
		<div class="qna_wrapperBox">
			<span>
				<input type="button" value="글 등록하기" class="inputBtn" onclick="send_check();">
			</span>
			<span>
				<input type="button" value="취소하기" class="inputBtn" onclick="location.href='qna_main.do'">
			</span>
		</div>
	</form> <!-- 사진, 동영상 첨부파일 업로드 폼 -->
	
	
	<div class="qna_wrapperBox">
		<ul>
			<li>
				동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫번째 순서의 사진이 썸네일로 지정됩니다.
			</li>
			<li>
				동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다.
			</li>
			<li>
				현 게시판은 반드시 관리자의 권한을 받아 게시글 업로드를 진행합니다.
			</li>
		</ul>
	</div>
	
	

</body>
</html>