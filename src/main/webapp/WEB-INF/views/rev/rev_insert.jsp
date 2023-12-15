<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function next(f){
		var userId = f.userId.value;
		var rv_day = f.rv_day.value;
		
		
		if(rv_day == ''){
			alert('날짜를 선택해 주세요.');
			return;
		}
		
		console.log(rv_day);
		
		
		f.action = "rev_time.do";
		f.submit();
	}
</script>
</head>
<body>
	
	<div class="wrapper">
		<form>
			<input type="hidden" name="userId" id="userId" value="${successLoginUser}">
		<div class="date">
			<label for="rev_date">예약 날짜</label> 
	        <input type="date" min="${today}" name="rv_day" id="rev_Date">
        </div>
        <div class="next">
        	<input type="button" value="다음" onclick="next(this.form)">
        </div>
	</form>
</div>
</body>
</html>