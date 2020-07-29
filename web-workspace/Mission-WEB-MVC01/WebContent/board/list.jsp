<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL의 core 라이브러리를 사용하기 위해 jar 파일을 우선 WEB-INF/lib에 넣는다. 총 4개임 --%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<h2>목록 페이지</h2>
	<hr>
	<table>
	
		<tr>
			<th>제목</th>
			<th>글쓴이</td>
		</tr>
		<%-- <c:forEach items ="${ request.list }" var = "board"> --%>
		<c:forEach items ="${ list }" var = "board">
			<tr>
				<td>${ board.title }</td>
				<td>${ board.writer }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>