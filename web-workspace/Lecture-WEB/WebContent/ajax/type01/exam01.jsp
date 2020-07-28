<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#msgView{
		border : 1px solid red;
		width : 500px;
		height : 200px;
	}
	
</style>
<script>
	function requestMsg(){
		
		// 1. XMLHttpReqeust 객체 생성
		let httpRequest = null;
		
		if(window.XMLHttpRequest){ 
			// XMLHttpReqeust라는 내장객체가 있으면 생성해라. 요즘 다른 브라우저에는 웬만하면 다 제공한다.
			httpRequest = new XMLHttpRequest();
		} else if (window.ActiveXObject){ 
			// 익스플로러 8버전 이하에는 XMLHttpRequest 내장객체가 없다. ActiveXObject 있으면 생성해라.
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
		}
		console.log(httpRequest);
		
		//2. callback 함수 설정
		//서버의 내용이 바뀔때마다 그것을 인지하는 놈이 필요하다. 그것이 바로 callback 함수다
		httpRequest.onreadystatechange = function(){
			console.log('change.....') // 한번의 요청에 4번이 찍히네
			
			//4. 서버에서 응답 완료
			// readyState가 4번째이면서 ... 200은 성공
			/*
			readyState
			0 : open() 호출 전  
			1 : open() 호출, send() 호출 전
			2 : send() 호출, 서버 응답 전
			3 : 서버응답, header 전송, body 미전송
			4 : 서버에서의 응답이 완료된 상태
			
			/*
			status
			200 : OK(요청 성공)
			404 : Not Found
			500 : Server Error
			*/
			

			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
				
					// 5. 서버 응답 결과를 추출
					alert('마 응답 성공했다')
					console.log(httpRequest.responseText)
					console.log(httpRequest.responseText.length)
					
					document.getElementById('msgView').innerHTML = httpRequest.responseText
					/* let msgView = document.getElementById('msgView');
					msgView.innerHTML = httpRequest.responseText */
					
				}
			}
		}
		
		//3. 서버에 비동기 통신 요청
		// HTTP method, URL, syn/asyn
		httpRequest.open('get', '/Lecture-WEB/HelloServlet', true);
		httpRequest.send(null);
		//open에 설정한 url로 request를 보내는 것이 send 라는 메소드다.
		
		// POST 방식일 때만 의미가 있다. POST 방식인데 name=value 형태로 보낸다고 함..(? 뭐냥)
		// GET 방식인 경우에는 content 값이 null이다. 별도로 URL에 파라미터를 담아 보내는 설정이 필요한듯?
		// 정리필요. 확실히 이해 못함.
		
		// 정리
		//POST 방식은 url에 파라미터를 보내지 않는다.
		//send 메세지에 파라미터를 name=value 형태로 보내야 한다.
		
				
		
		
	}
	

	
	
</script>
</head>
<body>
	<h2>서버에서 받은 메세지</h2>
	<div id = "msgView"></div>
	<input type ="button"value ="서버에 자료 요청" onclick = "requestMsg()">
</body>
</html>