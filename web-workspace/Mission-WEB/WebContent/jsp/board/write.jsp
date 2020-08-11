<%@page import="kr.ac.kopo.board.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. writeForm.jsp에서 날라온 정보를 추출(제목, 글쓴이, 내용)
	2. 추출된 정보를 이용하여 데이터베이스 게시물 테이블에 저장
	3. 목록페이지로 이동
--%>
<%

	// POST 방식으로 받으면, 인코딩 설정을 해야 한다.
	request.setCharacterEncoding("utf-8");

	String saveFolder = "D:/workspace/web/web-workspace/Mission-WEB/WebContent/upload";
	
	// 아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi = new MultipartRequest(
										request, 
										saveFolder, 
										1024 * 1024 * 3, 
										"utf-8",
										new KopoFileNamePolicy()
							  );

	// 1단계 : 게시물 저장(t_board)
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	int boardNo = dao.selectBoardNo();
	
	// 게시물 번호 추출(seq_t_board_no)
	BoardVO board = new BoardVO();
	
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);
	
	dao.insertBoard(board);

	// 2단계 : 첨부파일 저장(t_board_file)
	Enumeration<String> files =  multi.getFileNames();
	while(files.hasMoreElements()) {
		String fileName = files.nextElement();
		File f = multi.getFile(fileName);
		if(f != null) {
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			int fileSize = (int)f.length();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);		// 외래키에 해당 게시물번호
			
			dao.insertFile(fileVO);
		}
	}
/*
	// 1단계
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// 2단계
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);
*/	
%>
<%-- 3단계 --%>
<script>
	alert('게시판에 등록되었습니다');
	location.href = "list.jsp";
</script>









