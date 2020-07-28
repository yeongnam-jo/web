/**
 * Ajax와 관련된 함수 집합
 */

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

function sendProcess(method, url, params, callback) {
	// 1. request 객체 생성
	httpRequest = getXMLHttpRequest();
	
	// 2. callback 함수 정의
	httpRequest.onreadystatechange = callback;
	
	// method 초기값 설정
	let httpMethod = method.toUpperCase();
	if(httpMethod != 'GET' && httpMethod != 'POST')
		httpMethod = 'GET';

	// parameter 설정 : json 형태로 넘어 올 수 있으니, httpParams 라는 변수를 별도로 만든다.
	httpParams = params;
	if(params == null || params == '')
		httpParams = '';
	
	if(typeof(httpParams) == 'object'){
		// json 형태로 들어올 경우, 파라미터를 초기화하고, name=value 형태로 변환한다.
		// json to 'name=value&name=value'
		httpParams = '';
		for(let key in params){
			if(httpParams != '')
				httpParams += '&'
			httpParams += key + "=" + encodeURIComponent(params[key]);
			console.log(httpParams);
			
		}
		
		
	}
	
	
	// 3. 메소드에 맞게 초기화하여 전송
	httpUrl = url;
	if(httpMethod == 'GET' && httpParams != ''){
		httpUrl = url + '?' + httpParams;
	} 
	
	httpRequest.open(httpMethod, httpUrl, true);
	if(httpMethod == 'POST'){
		httpRequest.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
	}
	
	// 3항 연산자 활용하여 전송
	httpRequest.send(httpMethod == 'GET' ? null : httpParams);
	
}


