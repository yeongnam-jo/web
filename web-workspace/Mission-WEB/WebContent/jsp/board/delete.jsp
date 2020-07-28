<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	dao.deleteBoard(no);
	
%>

<script>
	alert("${ param.no }번 게시물이 삭제됐습니다.");
	location.href = "list.jsp";
</script>

<%-- <%
	response.sendRedirect("list.jsp");
%> --%>