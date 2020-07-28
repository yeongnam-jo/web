<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		exam04.jsp?type=S or exam04.jsp?type=U
	 --%>
	
	<c:if test="${ empty param.type }">
	 	type 파라미터가 전송되지 않았습니다.
	</c:if>
	 
	 <c:if test="${ param.type == 'S' }">
	 	관리자님 환영합니다.
	 </c:if>
	 
	 <c:if test="${ param.type == 'U' }">
	 	일반 사용자님 환영합니데이
	 </c:if>
	 
	 
	 
</body>
</html>