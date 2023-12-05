<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/qna/qna_main.css" rel="stylesheet">
</head>
<body>
<!-- <!-- Q&A 게시판 Main 
	<div class="qna_main_wrapper" border="1">
		<div class="contentBox">
			<div>
				<div class="ImgBox">
					<img alt="test" width="500" height="500" 
					src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221214144619159434.jpg"
					style="border-radius: 20px;">
				</div>
				<div class="textBox">
					<div class="content_title">
					 자주 묻는 질문 1
					</div>
					<div class="content_writer">
					관리자
					</div>
				</div>
			</div>
		</div>  contentBox 끝
		<div class="contentBox">
			<div class="ImgBox">
				<span></span>
			</div>
			<div class="textBox">
				<div class="content_title">
				 자주 묻는 질문 2
				</div>
				<div class="content_writer">
				관리자
				</div>
			</div>
		</div>  contentBox 끝
		<div class="contentBox">
			<div class="ImgBox">
				<span></span>
			</div>
			<div class="textBox">
				<div class="content_title">
				 자주 묻는 질문 3
				</div>
				<div class="content_writer">
				관리자
				</div>
			</div>
		</div>  contentBox 끝
		<div class="contentBox">
			<div class="ImgBox">
				<span></span>
			</div>
			<div class="textBox">
				<div class="content_title">
				 자주 묻는 질문 4
				</div>
				<div class="content_writer">
				관리자
				</div>
			</div>
		</div>  contentBox 끝
		<div class="contentBox">
			<div class="ImgBox">
				<span></span>
			</div>
			<div class="textBox">
				<div class="content_title">
				 자주 묻는 질문 5
				</div>
				<div class="content_writer">
				관리자
				</div>
			</div>
		</div>  contentBox 끝
		<div class="contentBox">
			<div class="ImgBox">
				<span></span>
			</div>
			<div class="textBox">
				<div class="content_title">
				 자주 묻는 질문 6
				</div>
				<div class="content_writer">
				관리자
				</div>
			</div>
		</div>  contentBox 끝 	
	</div> qna_main_wrapper 끝
	
	
<div class="flex_container">
	<div class="flex-item">
		<div class="item_inner">
			<div class="img">
			</div>
			<div class="title">
			</div>
			<div class="writer">
			</div>
		</div>
	</div>
	<div class="flex-item">content2</div>
	<div class="flex-item">content3</div>
	<div class="flex-item">content4</div>
	<div class="flex-item">content5</div>
	<div class="flex-item">content6</div>
</div> -->

<table>
	<tr>
		<th>순서</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	
	<c:forEach var="qna" items="${list }">
		<tr>
			<td>${qna.q_idx }</td>
			<td>${qna.q_title }</td>
			<td>${qna.q_content }</td>
		</tr>
	</c:forEach>
</table>

이곳은  qna main
</body>
</html>