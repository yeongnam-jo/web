<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.min.js"></script> <!--  'latest.min.js' 이렇게 가져오면 jQuery 1점대 버전을 가져옴 -->
<!-- <script src = "http://code.jquery.com/jquery-3.4.1.min.js"></script> --> 
<script src = "httpRequest.js"></script>
<script>
	
	function sendOnClick(){
		sendProcess('get', 'sample.xml', null, callback);
	}
	
	function callback() {
		let msg = '';

		// console.log('!!')

		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				let xmlDoc = httpRequest.responseXML;
				//let xmlDoc = $.parseXML(httpRequest.responseText);
				//console.log(xmlDoc);
				
				let memberList = $(xmlDoc).find('member'); // find : 하위에 속한 요소들을 모두 가져온다.
				//console.log(memberList)
				
				memberList.each(function(){ //jQuery each() 메소드
					// console.log(this)
					let id = $(this).find('id').text(); // this는 배열 안에 있는 각각의 객체
					let name = $(this).find('name').text(); // 객체.text 하면 모든 text를 가져온다.
					
					msg += id + '(' + name + ')\n';
					
				})

			}

			debugTrace(msg)
		}
	}

	function debugTrace(msg) {
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