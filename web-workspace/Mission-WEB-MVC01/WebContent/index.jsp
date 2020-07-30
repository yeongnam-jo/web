<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome to HOMEPAGE</h1>
	<a href = "<%= request.getContextPath() %>/list.do">게시판</a><br><br>
	<a href = "<%= request.getContextPath() %>/write.do">새글등록</a><br><br>
	
	<c:if test ="${ empty userVO }"> 
		<%-- session에 userVO가 등록되어 있기 때문에, userVO 사용가능. session.userVO로 해도 될듯! --%>
		<a href = "<%= request.getContextPath() %>/login.do">로그인</a><br>
	</c:if>
	
	<c:if test ="${ not empty userVO }">
		<a href = "<%= request.getContextPath() %>/logout.do">로그아웃</a><br>
		<%-- 로그아웃 하면, 세션객체를 삭제하고 main 페이지로 이동한다. --%>
	</c:if>
	
</body>
</html>