<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	http://localhost:9999/Lecture-WEB/exam02.jsp?id=aaa&name=bbb 호출했다 가정했을 떄의 aaa를 출력하는 코드
	--%>
	<%
		String id = request.getParameter("id");
		String[] hobbys = request.getParameterValues("hobby");
	
	%>
	
	id : <%= id %><br>
	id : <%= request.getParameter("id") %><br>
	id : ${ param.id }<br> <!-- EL 에서는 null 일 때, 아무 것도 반환하지 않는다. -->
	
	name : <%= request.getParameter("name") %> <br>
	name : ${ param.name }<br>
	
	<%--
		http://localhost:9999/Lecture-WEB/exam02.jsp?id=aaa&name=bbb&hobby=music&hobby=movie&hobby=reading
		http://localhost:9999/Lecture-WEB/jsp/le/exam02.jsp?id=aaa&name=bbb&hobby=music
	 --%>
	 
	hobbys[0] : <%= hobbys[0] %><br>
	hobby[0] : ${ paramValues.hobby[0] }<br>
	 

</body>
</html>