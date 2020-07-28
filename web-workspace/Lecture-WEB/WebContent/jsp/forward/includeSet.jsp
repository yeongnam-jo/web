<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %> --%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
	<%
		 String id = request.getParameter("id");
	%>
	<h2>결과화면</h2>
	<%
		if(id.equals("admin")) {
	%>
		관리자님 환영합니다<br>
	<%
		} else {
	%>
		<%= id %>님  환영합니다<br>
	<%
		}
	%>
	 --%>
	 
	<h2>결과 화면</h2>
	<c:if test="${ param.id eq 'admin'}">
		<jsp:include page="admin.jsp"/>
	</c:if> 
	
	<c:if test="${ param.id ne 'admin'}">
		${ param.id }님 환영합니다.<br>
	</c:if> 
	
</body>
</html>