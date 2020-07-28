<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(member != null) {
	%>
		설정된 세션 id : <%= member.getId() %><br>
		설정된 세션 password : <%= member.getPassword() %><br>
	<%
		} else {
	%>
		설정된 세션 정보 없음<br>
	<%
		}
	%>
	<hr>
	<c:choose>
		<c:when test="${ not empty member }">
			설정된 세션 id : ${ sessionScope.member.id }<br>
			설정된 세션 password : ${ member.password }<br>
		</c:when>
		<c:otherwise>
			설정된 세션 정보 없음<br>
		</c:otherwise>
	</c:choose>
	
	<a href="remove.jsp">세션삭제</a>
</body>
</html>











