<%@page import="kr.ac.kopobank.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopobank.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String domain = request.getParameter("domain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String post = request.getParameter("post");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");

	Connection conn = new ConnectionFactory().getConnetion();
	System.out.println(conn);
	
	StringBuilder sql = new StringBuilder();
	
	sql.append(" INSERT INTO T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, REG_DATE) ");
	sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'U', sysdate) ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, password);
	pstmt.setString(4, email);
	pstmt.setString(5, domain);
	pstmt.setString(6, tel1);
	pstmt.setString(7, tel2);
	pstmt.setString(8, tel3);
	pstmt.setString(9, post);
	pstmt.setString(10, addr1);
	pstmt.setString(11, addr2);
	
	pstmt.executeUpdate(); 
	JDBCClose.close(conn,pstmt);
%>

	<script>
		alert('회원가입을 완료했습니다.');
		location.href = "joinForm.jsp";
	</script>
	