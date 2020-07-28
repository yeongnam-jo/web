<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.MemberDAO"%>
<%@page import="kr.ac.kopo.board.MemberVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAllMember();
	pageContext.setAttribute("memberList", list); 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<style>
	div{
		font-size: 15px;
	}
	
</style>
</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
	 	<div align = "center">
			<hr width="100%">
			<h2>회원 관리 페이지</h2>
			<hr width="100%">
			
			<table border="1" style = "width: 100%">
				<tr>
				
					<th>아이디</th>
					<th>이름</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>도메인</th>
					<th>TEL1</th>
					<th>TEL2</th>
					<th>TEL3</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세 주소</th>
					<th>유저구분</th>
					<th>등록일</th>
				</tr>
				
				<c:forEach items="${ memberList }" var = "member"> 
					<tr>
					 	<td>${ member.id }</td>
						<td>${ member.name }</td>
						<td>${ member.password }</td>
						<td>${ member.email }</td>
						<td>${ member.domain }</td>
						<td>${ member.tel1 }</td>
						<td>${ member.tel2 }</td>
						<td>${ member.tel3 }</td>
						<td>${ member.post }</td>
						<td>${ member.addr1 }</td>
						<td>${ member.addr2 }</td>
						<td>${ member.type }</td>
						<td>${ member.reg_date }</td>
					</tr>
				</c:forEach>
				
			</table>
		</div>  
	</section>

	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
	

</body>
</html>