<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	// 1단계
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 2단계
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setContent(content);
	board.setNo(no);
	
	BoardDAO dao = new BoardDAO();
	dao.updateBoard(board);

	request.setAttribute("no", no);

%>
<script>
	alert('게시글을 수정했습니다.')
	location.href = "detail.jsp?no=${ no }"
</script>