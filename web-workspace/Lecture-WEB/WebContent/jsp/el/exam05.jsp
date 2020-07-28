<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, String> b = new HashMap<>();

	b.put("no", "10");
	b.put("title", "hello");

	pageContext.setAttribute("board", b);
	


%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	no : <%= b.get("no") %><br>
	title : <%= b.get("title") %><br>
	
	<%-- 공유영역에 등록하고 EL로 표현해보자. --%>
	el no : ${ board.no }<br>
	el title : ${ board.title }<br>
	
</body>
</html>