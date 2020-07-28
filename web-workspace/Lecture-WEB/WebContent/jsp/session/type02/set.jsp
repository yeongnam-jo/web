<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	
	// 객체 생성 및 초기화
	MemberVO member = new MemberVO();
	member.setId(id);
	member.setPassword(password);
	
	// 세션등록 : 쿠키는 문자열만 저장 가능한 반면, session은 객체 저장이 가능하다.
	/* 
	session.setAttribute("id", id);
	session.setAttribute("password", password); 
	*/
	session.setAttribute("member", member);
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션설정 완료</h2>
	<a href="get.jsp">설정된 세션정보 보기</a>
</body>
</html>