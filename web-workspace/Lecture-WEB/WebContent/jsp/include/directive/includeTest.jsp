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
	msg1 : <%= msg %><br>
	msg2 : ${ msg }
	
	<h2>인클루드 전</h2>
	<%-- <jsp:include page="one.jsp"/> --%>
	<%@ include file="one.jsp" %>
	<h2>인클루드 후</h2>
</body>
</html>