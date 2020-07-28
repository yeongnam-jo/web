<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	작업 순서
	1. writeForm.jsp에서 날라온 정보를 추출(제목, 글쓴이, 내용)
	2. 추출된 정보를 이용하여 데이터베이스 게시물 테이블에 저장
	3. 목록 페이지로 이동
--%>

<%
	//1단계
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setTitle(writer);
	board.setTitle(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);
	
	/* System.out.println("title : " + title );
	System.out.println("writer : " + writer );
	System.out.println("content : " + content ); */
	
	
	
	
	Connection conn = new ConnectionFactory().getConnetion();
	StringBuilder sql = new StringBuilder();
	sql.append(" insert into t_board(no, title, writer, content) ");
	sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	
	pstmt.executeUpdate(); // CRUD 할 때는 executeUpdate 문을 실행한다. 단순히 쿼리 날릴 때는 executeQuery 인듯
	JDBCClose.close(conn,pstmt);

%>

<!-- 	새글 등록을 완료했습니다. <br>
	5초 후에 자동으로 목록게시판으로 이동합니다. 
	<a href = "list.jsp">목록으로 이동</a>
	
	<script>
		setTimeout(function(){
			location.href = "list.jsp";
		}, 5000)
	</script> -->
	
	<script>
		alert('게시판에 등록됐습니다.');
		location.href = "list.jsp";
	</script>
	