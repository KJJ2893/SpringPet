<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function rev_go(){
		var url = "revInsert.do";
	    var size = "width=450px, height=500px, scrollbars=no";

	    var leftPosition = (window.screen.width - 450) / 2; // 화면 가로 중앙
	    var topPosition = (window.screen.height - 500) / 2; // 화면 세로 중앙

	    var windowFeatures = size + ", top=" + topPosition + ", left=" + leftPosition;

	    window.open(url, '예약하기', windowFeatures);
	    
	    }
	</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<tr>
				<th>
				<input type="button" value="예약하기" onclick="rev_go()"> 
				</th>
				<th>
				<input type="button" value="예약조회" onclick="location.href='rev_check.do'">	
				</th>
			</tr>
		</table> 
	</form>
</body>
</html>