<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let httpRequest = null;
	
	function getXMLHttpRequest() {
		
		if(window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} 
		if(window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		return null;
	}

	function sendProcess() {
		httpRequest = getXMLHttpRequest();
		
		httpRequest.onreadystatechange = callbackFunc;
		httpRequest.open('get', 'hello2.jsp', true);
		httpRequest.send(null);
	}
	
	function callbackFunc(){
		/*
			readyState(요청의 현재 상태)
			0 : open() 호출 전  
			1 : open() 호출, send() 호출 전
			2 : send() 호출, 서버 응답 전
			3 : 서버응답, header 전송, body 미전송
			4 : 서버에서의 응답이 완료된 상태
			
		*/
		
		/*
			
			status(서버 처리 결과 상태 코드)
			200 : OK(요청 성공)
			404 : Not Found
			405 : 서블릿 에러
			500 : Server Error
			
		*/
		
		let debug = document.getElementById("debug")
		
		switch(httpRequest.readyState){
			case 1:
				debug.value += 'Loading...\n'
				break;
			case 2:
				debug.value += 'Loaded...\n'
				break;
			case 3:
				debug.value += 'Interactive...\n'
				break;
			case 4:
				debug.value += 'Complete...\n'
				if(httpRequest.status == 200){
					debug.value += '웹서버에서 정상적으로 수행완료....\n';
				} else{
					debug.value += '웹서버에서 오류 발생...';
					debug.value += '오류 코드 : ' + httpRequest.status +'\n';
					debug.value += '오류 내용 : ' + httpRequest.statusText +'\n';
				}
				break;
		}
			
		
	}
	
</script>
</head>
<body>
	<textarea rows="10" cols="80" id = "debug"></textarea><br>
	<input type="button" value = "서버호출" onclick = "sendProcess()">
	<input type="button" value = "초기화" onclick = "document.getElementById('debug').value=''">

</body>
</html>