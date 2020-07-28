<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	StringBuilder sb = new StringBuilder();
	if(cookies != null){
		for(Cookie c : cookies){
			String cName = c.getName();
			String cValue = c.getValue();
			
			sb.append("쿠키이름 : " + cName + " , ");
			sb.append("쿠키값: " + cValue + "<br>");
		}
		
	}
	/* System.out.println(cookies); */
	
	
	
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
	<a href = "makeForm.jsp">쿠키설정 이동</a>
</body>
</html>