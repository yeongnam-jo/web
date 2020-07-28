<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	
	<!-- 파일의 이름뿐만 아니라, 내용까지 보내려면 enctype 속성의 값을 multpart/form-data로 바꿔야만 한다. -->
	<form action = "uploadInfo.jsp" method = "post"
			enctype = "multipart/form-data">
		ID: <input type="text" name="id"><br>
		파일 : <input type="file" name = "uploadfile"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>