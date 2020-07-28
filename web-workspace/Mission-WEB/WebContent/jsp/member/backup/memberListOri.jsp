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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		font-size: 10px;
	}
	
</style>
</head>
<body>

	<%
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.selectAllMember();
		pageContext.setAttribute("memberList", list); 
		
	
		/* //DB 접속
		String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";

		String user ="DA09";
		String password ="DA09";
	 	Connection conn = new ConnectionFactory().getConnection(url, user, password);
		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT * FROM T_MEMBER ");
  
		PreparedStatement pstmt = conn.prepareStatement(sql.toString()); 
		ResultSet rs = pstmt.executeQuery();  */
		
		
	%>



 	<div align = "center">
		<hr width = 80%>
		<h2>회원 관리 페이지</h2>
		<hr width = 80%>
		
		<table border="1" style = "width: 80%">
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
	
	
	<%-- <div align = "center">
		<hr width = 80%>
		<h2>회원 관리 페이지</h2>
		<hr width = 80%>
		
		<table border="1" style = "width: 80%">
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
			
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%= rs.getString("ID") %></td>
					<td><%= rs.getString("NAME") %></td>
					<td><%= rs.getString("PASSWORD") %></td>
					<td><%= rs.getString("EMAIL_ID") %></td>
					<td><%= rs.getString("EMAIL_DOMAIN") %></td>
					<td><%= rs.getString("TEL1") %></td>
					<td><%= rs.getString("TEL2") %></td>
					<td><%= rs.getString("TEL3") %></td>
					<td><%= rs.getString("POST") %></td>
					<td><%= rs.getString("BASIC_ADDR") %></td>
					<td><%= rs.getString("DETAIL_ADDR") %></td>
					<td><%= rs.getString("TYPE") %></td>
					<td><%= rs.getString("REG_DATE") %></td>
				</tr>
			<%
				}
			%>
			
		</table>
	</div> --%>
	


</body>
</html>