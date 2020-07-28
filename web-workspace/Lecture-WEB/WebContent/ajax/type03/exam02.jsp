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
	
	function callbackFunc() {
		let msg = '';
		switch(httpRequest.readyState) {
		case 1 : 
			msg += 'Loading...\n';
			break;
		case 2 : 
			msg += 'Loaded...\n';
			break;
		case 3 :
			msg += 'Interactive...\n';
			break;
		case 4 :
			msg += 'Complete...\n';
			// 서버 응답 후 상태코드 확인
			if(httpRequest.status == 200) {
				msg += '웹서버에서 정상적으로 수행완료...\n';
				msg += '실행결과 : ' + httpRequest.responseText + '\n';
			} else {
				msg += '웹서버에서 오류 발생...\n';
				msg += '오류코드 : ' + httpRequest.status + '\n';
				msg += '오류내용 : ' + httpRequest.statusText + '\n';
			}
			break;
		}	
		debugTrace(msg);
	}
	
	function debugTrace(msg) {
		let debug = document.getElementById("debug");
		debug.value += msg;
	}
	
	
	function sendProcess(method, param){
		let msg = "===============================================================\n";
		msg += method + " /Lecture-WEB/ajax/type03/param2.jsp?name=" + param + '\n';
		debugTrace(msg);
		
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callbackFunc;
		
		/*
			httpRequest.oepn(~)
			POST 방식은 parameter 날라가지 않음.
		*/
		
		let url = 'param2.jsp';
		param = encodeURIComponent(param);
		let args = 'name=' + param;
		if(method == 'GET'){
			httpRequest.open(method, url + '?' + args, true);
			httpRequest.send(null);
			
		} else if (method == 'POST'){
			// POST 방식은 form 태그만 가능하다. (form 태그를 보내면 헤더에 form data 라고 뜬다.)
			// 그런데, ajax에서는 form 태그를 사용하지 않는다.
			// form 태그 아니더라도 POST 방식 쓸 수 있게 설정을 하면 된다.
			// Content-Type을 text/plain 에서 form 으로 바꿔주면 된다.
			
			
			
			//POST 방식은 url에 파라미터를 보내지 않는다.
			//send 메세지에 파라미터를 name=value 형태로 보내야 한다.
			httpRequest.open(method, url, true);
			httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded')
			httpRequest.send(args);
			
		}
		
	}
	
	
</script>
</head>
<body>
	<textarea rows="10" cols="80" id="debug"></textarea><br>
	<input type="button" value="GET영문인자 호출" onclick="sendProcess('GET', 'honggildong')">
	<input type="button" value="GET한글인자 호출" onclick="sendProcess('GET', '홍길동')">
	<input type="button" value="POST영문인자 호출" onclick="sendProcess('POST', 'honggildong')">
	<input type="button" value="POST한글인자 호출" onclick="sendProcess('POST', '홍길동')">
</body>
</html>