/**
 * send process for ajax 
 */
	
	//sendProcess("POST", "param2.jsp", "name=홍길동", "callbackFunc")
	//sendProcess('POST', 'param2.jsp', 'name=홍길동&age=22', 'callbackFunc')
	
	// 걍..이렇게 만들어 쓸거아니니까 대충 만들자.
	//sendProcess('POST', 'param2.jsp', '홍길동', 'callbackFunc')

	function sendProcess(method, urlInput, paramInput, callbackFunc){
		
		let httpRequest = null;
		if(window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} 
		if(window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		return null;
		

		httpRequest.onreadystatechange = callbackFunc;
		
		/*
			httpRequest.oepn(~)
			POST 방식은 parameter 날라가지 않음.
			send() 내에 인자로 보내야 한다.
		*/
		
		/*/Lecture-WEB/ajax/type03/param2.jsp?name=" + param */		
		
		let url = urlInput;
		param = encodeURIComponent(paramInput);
		let args = 'name=' + param;
		
		
		alert(url)
		alert(args)
		
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

