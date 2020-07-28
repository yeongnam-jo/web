<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Lecture-WEB/js/httpRequest.js"></script>

<script>
	
	insertText = function callbackFunc() {
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
			let debug = document.getElementById('debug');
			/* debug.innerHTML = httpRequest.responseText  */
			debug.value = httpRequest.responseText  
			
			document.getElementById('test').innerHTML = httpRequest.responseText;

		} 
	}
	
	sendProcess('POST', 'param2.jsp', '홍길동', 'insertText') 
	
</script>
</head>
<body>
	<div id = "test"></div>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<!-- 
	<input type="button" value="GET영문인자 호출" onclick="sendProcess('GET', 'honggildong')">
	<input type="button" value="GET한글인자 호출" onclick="sendProcess('GET', '홍길동')">
	<input type="button" value="POST영문인자 호출" onclick="sendProcess('POST', 'honggildong')"> 
	-->																		<!-- /Lecture-WEB/ajax/type03/param2.jsp?name=" + param  -->
	<input type="button" value="GETㅇㅇ인자 호출" onclick="sendProcess('GET', '/Lecture-WEB/ajax/type03/param2.jsp', 'jj', 'insertText')">
	<input type="button" value="POSTㅇㅇ인자 호출" onclick="sendProcess('POST', '/Lecture-WEB/ajax/type03/param2.jsp', 'jj', 'insertText')">
	<input type="button" value="GET한글인자 호출" onclick="sendProcess('GET', '/Lecture-WEB/HelloServlet', '홍길동', 'insertText')"> 
	<input type="button" value="GET한글인자 호출" onclick="sendProcess('GET', '/Lecture-WEB/ajax/type03/param2.jsp', '홍길동', 'insertText')"> 
	<!-- <input type="button" value="GET한글인자 호출" onclick="alert('ㅁㅁ')"> -->
	<input type="button" value="POST한글인자 호출" onclick="sendProcess('POST', '/Lecture-WEB/ajax/type03/param2.jsp', '홍길동', 'insertText')">
</body>
</html>