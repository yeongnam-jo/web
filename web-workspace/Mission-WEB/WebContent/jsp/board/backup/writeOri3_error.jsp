<%@page import="kr.ac.kopo.board.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	String saveFolder = "D:/workspace/web/web-workspace/Mission-WEB/WebContent/upload";

	request.setCharacterEncoding("utf-8");
	MultipartRequest multi = new MultipartRequest( // new 하면서 생성자를 호출한다. 저장 작업이 이뤄짐.
						request, 
						saveFolder, 
						1024 * 1024 * 3, 
						"utf-8",
						new KopoFileNamePolicy()
						
			);
	//============================수업 코드 작성 필요: 시작==================================================

			
	// wirteForm.jsp의 form 태그의 enctype은 현재  다음과 같다. "multipart/form-data"
	// 멀티파트 REQEUEST얘는 request.getParameter('title') 이렇게 못가져온다.
	// 얘네는 매직넘버 등등 이상한 형태로 되어있었음
	// multi.getParameter('title') 이렇게 가져와야 한다.
	// 그런데 파일명을 가져올 떄는, multi.getParameter("attachfile1") 이렇게 못가져온다.
	// multi.getFileOriName("attachfile1") 이런식으로 가져온다.
	
	//iterator 나오기 전의 순환자가 Enumeration이다. multi.getFilenames() 반환형이 Enumeration이다.
	
	
	// 1단계
	// 1단계 : 게시물 저장(t_board)
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	// 게시물 번호 추출(seq_t_board_no)
	BoardDAO dao = new BoardDAO();
	int boardNo = dao.selectBoardNo();

	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);

	//dao.insertBoard(board);

	// 2단계: 첨부파일 저장(t_board_file)
	// multi.getFileNames() ==> form태그의 name file인 것들을 가져온다. 즉, attatchfile1, attatchfile2가 나온다.
	// 진짜 파일명을 가져오려면 multi.getFileOriName("attachfile1") 이런식으로 가져온다.
	
	Enumeration<String> files =  multi.getFileNames();
	System.out.println(files);
	
	while(files.hasMoreElements()) {
		String fileName = files.nextElement();
		File f = multi.getFile(fileName);
		
		System.out.println(f); //toString 오버라이드 되어있나용?
		if(f != null) {
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			int fileSize = (int)f.length();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo); //외래키에 해당하는 게시물번호

			dao.insertFile(fileVO);
			
		}
	}
	
	
	//============================수업 코드 작성 필요 : 끝==================================================
	
	
	

	/* //1단계
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

	Connection conn = new ConnectionFactory().getConnetion();
	StringBuilder sql = new StringBuilder();
	sql.append(" insert into t_board(no, title, writer, content) ");
	sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	
	pstmt.executeUpdate(); // CRUD 할 때는 executeUpdate 문을 실행한다. 단순히 쿼리 날릴 때는 executeQuery 인듯
	JDBCClose.close(conn,pstmt); */

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
	