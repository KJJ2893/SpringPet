<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go(){
		var url = "revInsert.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '예약하기', windowFeatures);
	   
	}
	

	function rev_select(f){
		var u_idx = f.u_idx.value;
		
		f.action = "rev_select.do";
		f.submit();
	}
	
	</script>
</head>
<body>
	<form>
		<input type="button" value="예약하기" onclick="go()">
		
		<c:choose>
			<c:when test="${empty id}">
				<input type="button" value="예약조회" onclick="location.href='login_main.do'">
			</c:when>
			<c:when test="${not empty id}">
				<input type="hidden" name="u_idx" value="${id.u_idx}" >
				<input type="button" value="예약조회" onclick="rev_select(this.form)">
			</c:when>
		</c:choose>
	</form>
</body>
</html>