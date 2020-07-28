<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("id", "hong");
	%>
	

	msg 표현식: <%= msg %><br>
	msg EL : ${ msg }<br>
	
	msg2 표현식: <%= msg2 %> <br>
	msg2 EL : ${ msg2 }<br>
	
	<h2>인클루드 전</h2>
	
	파라미터 미설정 호출<br>
	<jsp:include page="one.jsp"/>
	
	파라미터 설정 호출<br>
	<jsp:include page = "one.jsp">
		<jsp:param name = "name" value = "hong gil dong"/>
		<jsp:param name = "age" value = "29"/>
	</jsp:include>
	
	<h2>인클루드 후</h2>
</body>
</html>