<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<String> nameList = new ArrayList<>();
	nameList.add("강기리보이");
	nameList.add("소기리보이");

	pageContext.setAttribute("nameL", nameList);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= nameList.get(0) %><br>
	<%= nameList.get(1) %><br>
	<br>
	
	<%= pageContext.getAttribute("nameL") %><br>
	<%= ( (List)pageContext.getAttribute("nameL")).get(0) %><br>
	<br>
	
	${ nameL[0] }<br>
	${ nameL[1] }<br>
</body>
</html>