<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Q&A 글쓰기 -->
	<div class="qna_textUpload">
		<span class="qna_category">카테고리</span>
		
		<div class="qna_category_select">
			<!-- <div>
				<input type="radio" name="announcement" id="공지사항" value="공지사항" checked>
				<input type="button" value="공지사항">
			</div> -->
			<div>
				<input type="radio" name="question" id="자주묻는질문" value="자주묻는질문">
				<input type="button" value="자주묻는질문">
			</div>
			<!-- <div>
				<input type="radio" name="ect" id="기타" value="기타">
				<input type="button" value="기타">
			</div> -->
		</div>
	</div> <!-- qna_textUpload -->
	
	<div> <!-- qna upload -->
		<div>
			<span class="qna_upload">
				공지사항 글 작성하기
			</span>
		</div>	
		<input class="qna_upload_title" placeholder="제목을 입력해 주세요" value>
		<div class="qna_space"></div>
		<div class="qna_upload_text">
			<textarea class="qna_upload_textarea" placeholder="5자 이상 내용을 입력해주세요"></textarea>
			<div class="qna_space"></div>
		</div>
		
		<div> <!-- 태그입력하기 -->
			<div class="qna_upload_tag">태그 입력</div>
			<input class="qna_titleTag" placeholder="태그를 입력해주세요" value>
		</div>
		
		<!-- 사진, 동영상 첨부파일 업로드 폼 -->
		<form class="qna_upload_file" enctype="mulipart/form-data">
			<div class="qna_fileInputWrapper">
				<span class="qna_imgUploadTitle">
					사진 업로드
				</span>
				<div class="qna_imgContainer"></div>
				<input type="file" id="uploadFile" multiple accept="image/jpg,image/png,jpeg,image/gif" style="display:none;">
				<input type="button" value="사진첨부">
				<span class="upload_notice">개당 업로드 용량 : 10MB, 용량을 준수하여 업로드 부탁드립니다</span>
			</div>
			
			<div class="qna_fileInputWrapper">
				<span class="qna_imgUploadTitle">
					동영상 업로드
				</span>
				<div class="qna_imgContainer"></div>
				<input type="file" id="uploadFile" multiple accept="video/mp4, video/" style="display:none;">
				<input type="button" value="동영상첨부">
				<span class="upload_notice">개당 업로드 용량 : 60MB, 동영상은 최대 1개 업로드 가능합니다</span>
			</div>
		</form> <!-- 사진, 동영상 첨부파일 업로드 폼 -->
		<div class="qna_subText">
			<ul>
				<li>
					::marker
					"동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫번째 순서의 사진이 썸네일로 지정됩니다."
				</li>
				<li>
					::marker
					"동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다"
				</li>
				<li>
					::marker
					"현 게시판은 반드시 관리자의 권한을 받아 게시글 업로드를 진행합니다"
				</li>
			</ul>
		</div>
		<input type="button" class="qna_registration_btn" value="공지사항 등록하기"></button>	
	</div><!-- qna upload -->
	
</body>
</html>