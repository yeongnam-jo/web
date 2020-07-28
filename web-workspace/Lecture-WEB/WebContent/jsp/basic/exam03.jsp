<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1 ~ 10 사이의 임의의 정수 출력</h1>
	<%
		//java.util.Random r = new java.util.Random();
		Random r = new Random();
		int random = r.nextInt(10) + 1;
		
	%>
	추출된 정수 : <%= random %> <!-- 표현식 내에는 수식 혹은 변수만 써야한다. 예를 들어 3 * 6 또는 sumVar 등등-->

</body>
</html>