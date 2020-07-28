<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		InputStreamReader isr = new InputStreamReader(request.getInputStream(), "utf-8"); 
		//InputStram은 바이트 스트림이기 때문에 한글을 읽을 수 없다. 그래서 utf-8로 바꾼다(?)
		BufferedReader br = new BufferedReader(isr);
		// 속도를 빠르게 하기 위해 BufferedReader를 쓴다.
		while(true){
			String buf = br.readLine();
			if(buf == null) break;
			
			out.print(buf + "<br>");
		}
		
	%>

</body>
</html>