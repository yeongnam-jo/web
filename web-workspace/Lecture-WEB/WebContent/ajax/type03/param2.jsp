<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(request.getMethod().equalsIgnoreCase("POST")){
		request.setCharacterEncoding("utf-8");
	}
%>

name : ${ param.name }

<h2>테스터터터터</h2>