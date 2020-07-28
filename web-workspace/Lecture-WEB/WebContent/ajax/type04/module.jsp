<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="httpRequest.js"></script>
<script>
	function sendOnClick() {
		/* sendProcess('GET', 'sample.jsp', 'name=hong&age=20', callback); */

		// 파라미터를 JSON 형태로 넘길 수 있다. 그러나 httpRequest.js에 별도 로직을 추가해야 함.
		/* let params = {name : 'hong', age : 22};
		sendProcess('POST', 'sample.jsp', params, callback);  */
		
		let f = document.inputForm;
		/* let n = f.name.value;
		let a = f.age.value; 
		let ad = f.addr.value; */
		
		// JSON : JavaScript Object Notation 
		let params = {
				name : f.name.value, 
				age : f.age.value, 
				addr : f.addr.value
				};
		
		sendProcess('POST', 'sample.jsp', params, callback);  
	}
	
	function callback() {
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
</script>
</head>
<body>
	<h2>XMLHttpRequest 모듈을 이용한 예제</h2>
	<br>
	<form name="inputForm">
		<textarea rows="10" cols="80" id="debug"></textarea><br>
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		주소 : <input type="text" name="addr"><br>
		<input type="button" value="서버에 자료전송" onclick="sendOnClick()" >
	</form>
</body>
</html>