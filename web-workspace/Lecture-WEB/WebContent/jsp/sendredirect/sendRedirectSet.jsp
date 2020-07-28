<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결과 화면</h2>
	<c:if test="${ param.id == 'admin' }">
	<%
		response.sendRedirect("/Lecture-WEB/jsp/sendredirect/admin.jsp");
	%>
	</c:if>
	
	<c:if test="${ param.id != 'admin' }">
		<%-- <c:set var="id" value="${ param.id }" scope ="request"/>  request 영역 접근 못함.--%>
	<%
		response.sendRedirect("/Lecture-WEB/jsp/sendredirect/user.jsp?id=" + request.getParameter("id"));
	%>
	</c:if>
	
</body>
</html>