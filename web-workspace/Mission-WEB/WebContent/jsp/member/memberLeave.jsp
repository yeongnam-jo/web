<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");
		
		MemberVO member = (MemberVO) session.getAttribute("userVO");
		String id = member.getId();
		System.out.println(member.getId());
		
		MemberDAO dao = new MemberDAO();
		dao.leave(id);
		
		session.invalidate(); 
%>

<script>
	alert("그동안 이용해주셔서 감사합니다.")
	location.href = "/Mission-WEB/index.jsp"
</script>