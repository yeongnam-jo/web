<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#msgView {
		border: 1px solid red;
		height: 200px;
		width: 500px;
	}
</style>
<script>
	$(document).ready(function() {
		$(':button').click(function() {
			/*
			url 	: 요청주소(문자열)
			type 	: 메소드(문자열) => 디폴트는 GET
			data	: 파라미터(문자열, 객체)
			success : 수신 성공(함수) => 즉, httpRequest.readyState == 4 && httpRequest.status == 200
			erroe 	: 수신 실패(함수)
			*/
			$.ajax({
				url: 'hello.jsp',
				success : function(data) { //request.responseText 값을 data라는 매개변수로 받는다.
					console.log(data)
					$('#msgView').append(data);
				}
			})
		})
	})
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id="msgView"></div>
	<input type="button" value="서버에 자료 요청" >
</body>
</html>










