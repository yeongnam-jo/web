<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String targetDt = "20200726";
	String itemPerPage = "10";
	String multiMovieYn = "";
	String repNationCd = "";
	String wideAreaCd = "";
	

	String key = "b2c4569aed37b4c9bfdabc74464639e3";
	KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
	
	String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
	pageContext.setAttribute("dailyResponse", dailyResponse);
	
%>

<script>

	let data = <%= dailyResponse %>;
	let officeList = eval(data);
	
	let msg = '길이: ' + officeList.length +'\n';
	
	document.getElementById("hello").innerHTML = msg;
/* 	for(let i = 0; i < memberList.length; i++){
		let mem = memberList[i];
		let id = mem.id;
		let name = mem.name;
		msg += id + '(' + name + ')\n'; 
	}
 */

	
</script>
</head>
<body>
	<h2>JSON DATA 예제 파일</h2>
	<br>
	<div id = "hello"></div>

	
</body>
</html>