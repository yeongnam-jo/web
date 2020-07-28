<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "httpRequest.js"></script>
<script>
	function sendOnClick(){
		sendProcess('get', 'sample.jsp', null, callback)
		
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				// console.log(httpRequest.responseText)
				let data = httpRequest.responseText;
				let memberList = eval(data);
				
				let msg = '회원수: ' + memberList.length +'명\n';
				
				for(let i = 0; i < memberList.length; i++){
					let mem = memberList[i];
					let id = mem.id;
					let name = mem.name;
					msg += id + '(' + name + ')\n'; 
				}
				
				debugTrace(msg);
			}
		}
	}
	
	function debugTrace(msg){
		let debug = document.getElementById("debug");
		debug.value += msg;
		
	}
	
</script>
</head>
<body>
	<h2>JSON DATA 예제 파일</h2>
	<br>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type ="button" value = "서버에 자료 요청" onclick ="sendOnClick()">
	
</body>
</html>