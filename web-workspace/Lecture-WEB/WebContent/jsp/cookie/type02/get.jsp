<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<%
	Cookie[] cookies = request.getCookies();

	StringBuilder sb = new StringBuilder();
	if(cookies != null){
		for(Cookie c : cookies){
			String cName = c.getName();
			String cValue = c.getValue();
			
			// decoding
			cName = URLDecoder.decode(cName, "utf-8");
			cValue = URLDecoder.decode(cValue, "utf-8");
			
			sb.append("쿠키이름 : " + cName + " , ");
			sb.append("쿠키값: " + cValue + "<br>");
		}
		
	} else{
		sb.append("설정된 쿠키 정보가 없습니다.");
		
	}
	/* System.out.println(cookies); */
	
	
	
	pageContext.setAttribute("cookies123", cookies);

	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>설정된 쿠키 정보</h2>
	<%= sb.toString() %>
	
	<hr>
	<hr>
	<hr>
	<c:forEach var="cookie" items="${ cookies123 }">
		${ cookie.cName } <br>
		${ cookie.cValue } <br>
	</c:forEach>
	
	<a href = "makeForm.jsp">쿠키설정 이동</a>
</body>
</html>