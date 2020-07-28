<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.board.MemberVO"%>
<%@page import="kr.ac.kopo.board.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	/* MemberVO userVO = (MemberVO)session.getAttribute("userVO"); */
	
	String email = request.getParameter("email");
	String domain = request.getParameter("domain");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String post = request.getParameter("post");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String id = request.getParameter("id");
	
	Connection conn = new ConnectionFactory().getConnetion();
	MemberDAO dao = new MemberDAO();
	
	dao.modifyUser(email, domain, tel1, tel2, tel3, post, addr1, addr2, id); 
	
%>

<script>
	alert("회원 정보를 수정했습니다.")
	location.href = "/Mission-WEB/jsp/member/mypageForm.jsp"
</script>