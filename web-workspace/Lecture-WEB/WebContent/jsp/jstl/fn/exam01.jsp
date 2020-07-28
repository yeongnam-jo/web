<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	String msg = "hello jstl!!";
	pageContext.setAttribute("msg", msg);
%> --%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="msg" value="hello jstl!!" scope = "page"/>
	msg %nbsp; : ${ msg }<br>
	fn:length(msg) : ${ fn:length(msg) } : ${ fn:length("hello jstl!!") }<br>
	fn:substring(msg,2,10) : ${ fn:substring(msg,2,10) }

</body>
</html>