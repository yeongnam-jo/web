<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href = "<%= request.getContextPath() %>/list.do">게시판</a><br>
	<a href = "<%= request.getContextPath() %>/write.do">새글등록</a><br>
</body>
</html>