<%@page import="kr.ac.kopo.board.MemberDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
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
	MemberDAO dao = new MemberDAO();
	dao.join(id, name, password, email, domain, tel1, tel2, tel3, post, addr1, addr2);
%>

	<script>
		alert('회원가입을 완료했습니다.');
		location.href = "joinForm.jsp";
	</script>
	