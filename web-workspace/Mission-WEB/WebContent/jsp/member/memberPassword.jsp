<%@page import="kr.ac.kopo.board.MemberVO"%>
<%@page import="kr.ac.kopo.board.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	MemberVO member = (MemberVO) session.getAttribute("userVO");
	String id = member.getId();
	String passwordRe = request.getParameter("passwordC");
	
	/* System.out.println(passwordRe); */
	
	MemberDAO dao = new MemberDAO();
	dao.changePassword(id, passwordRe);
	
%>

<script>
	alert('패스워드 변경이 완료됐습니다.')
	location.href = "/Mission-WEB/jsp/member/mypageForm.jsp"
</script>