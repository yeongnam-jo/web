<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

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
	msg EL : ${ msg }
	
	<%-- msg2 표현식: <%= msg2 %><br>
	msg2 EL : ${ msg2 } --%>
	
	<h2>인클루드 전</h2>
	
	파라미터 미설정 호출<br>
	<%-- <jsp:include page="one.jsp"/> --%>
	<c:import url="one.jsp"/>
	
	파라미터 설정 호출<br>
	<%-- <jsp:include page = "one.jsp">
		<jsp:param name = "name" value = "hong gil dong"/>
		<jsp:param name = "age" value = "29"/>
	</jsp:include> --%>
	
	<c:import url ="one.jsp">
		<c:param name="name" value="hong, gil-dong"/>
		<c:param name="age" value="24"/>
	</c:import>
	
	
	<h2>인클루드 후</h2>
	<h2>다음 사이트 인클루드</h2>
 	<%-- <jsp:include page="http://kopo.ac.kr"></jsp:include>  --%>
	<c:import url = "http://kopo.ac.kr"/>
</body>
</html>