<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		공유영역 4가지 : pageContext, request, session, application
	
		공유영역에 객체 등록방법
		공유영역.setAttribute("이름", "값")
	
	*/
	
	pageContext.setAttribute("msg", "page영역에 객체등록");
	
	request.setAttribute("id", "홍길동");
	request.setAttribute("msg", "request영역에 객체등록");

	String message = (String) pageContext.getAttribute("msg");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- el에서의 공유영역 4가지 : pageScope, requestScope, sessionScope, applicationScope --%>
	empty msg : ${ empty msg }<br>
	msg : ${ msg }<br>
	msg : ${requestScope.msg} <br>
	message : <%= message %><br> 
	message : <%= pageContext.getAttribute("msg") %><br>
	request message : <%= request.getAttribute("msg") %><br>
	request message : length <%= ((String)request.getAttribute("msg")).length() %><br>
	id : ${ id }<br>
	
</body>
</html>