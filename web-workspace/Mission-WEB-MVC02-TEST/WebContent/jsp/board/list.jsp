<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
			<br>
			<hr width="100%">
			<h2>게시판 목록</h2>
			<hr width="100%">
			<br>
			<table border="1" style="width: 100%">
				<tr>
					<th width="7%">번호</th>
					<th>제목</th>
					<th width="16%">글쓴이</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ boardList }" var="board" varStatus="loop">
					<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
						<td>${ board.no }</td>
						<td>
							<a href="javascript:doAction(${ board.no })">
								<c:out value="${ board.title }" />
							</a>
						<%--
							<a href="detail.jsp?no=${ board.no }"> 
								<c:out value="${ board.title }" />
							</a>
						 --%>
						</td>
						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<c:if test="${ not empty userVO }">
				<button onclick="goWriteForm()">새글등록</button>
			</c:if>
		</div>
</body>
</html>