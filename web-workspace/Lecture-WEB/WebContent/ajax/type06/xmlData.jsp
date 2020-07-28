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
		sendProcess('get', 'sample.xml', null, callback);
	}
	
	function callback(){
		let msg = '';
		
		// console.log('!!')
		
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				let xmlDoc = httpRequest.responseXML;
				// console.log(xmlDoc);
				let memberList = xmlDoc.getElementsByTagName("member");
				msg += '회원수: ' + memberList.length + '명\n';
				
				for(let i = 0; i < memberList.length; i++){
					let mem = memberList[i];
					//console.log(mem)
					
					//let idT =  mem.getElementsByTagName("id")[0]
					let id = mem.getElementsByTagName("id")[0].innerHTML // getElementsByTagName은 무조건 배열 형태로 반환된다. 값이 하나임을 보장할 수 없기 때문이다.
					let name = mem.getElementsByTagName("name")[0].innerHTML
					//console.log(idT);
					//console.log(id);
					
					msg += id + '(' + name + ')\n';
				}
				
				debugTrace(msg)
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
	<h2>XML DATA 응답예제</h2>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type ="button" value ="서버에 자료 요청" onclick ="sendOnClick()">
	
</body>
</html>