<%@page import="kr.ac.kopo.board.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 

    
<%
	// http://localhost:9999/Mission-WEB/board/detail.jsp?no=5 요청
	
	/*
		작업 순서
		1. no의 파라미터 값을 추출
		2. no에 해당하는 게시물을 DB에서 얻어온다(t_board)
		3. 조회된 게시물을 화면에 출력
	*/
	
	// 파라미터 추출
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	
	// 조회수 증가  
	String type = request.getParameter("type");
	if(type != null && type.equals("list"))
		dao.incrementViewCnt(no);
	
	
	// 게시판 번호에 의한 게시물 조회
	BoardVO board = dao.selectByNo(no);
	
	// 첨부파일 조회
	List<BoardFileVO> fileList = dao.selectFileByNo(no);
	
	// 공유영역(pageContext)에 게시물, 파일list 등록
	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<style>
	hr, table {
		width : 100%;
	}
</style> 
<script>
	function doAction(type){
		switch(type){
		case 'U':
			location.href = "updateForm.jsp?no=${ param.no }";
			break;
		case 'D':
			if(confirm('삭제 하시겠습니까?')){
				location.href = "delete.jsp?no=${ param.no }";
			}
			break;
		case 'L':
			location.href = 'list.jsp'
			break;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align = "center">
			<hr>
			<h2>게시판 상세 페이지</h2>
			<hr>
			<br>
			<table border = "1"> 
				<tr>
					<th width = "25%">번호</th>
					<td>${ board.no }</td>
				</tr>
				<tr>
					<th width = "25%">제목</th>
					<td><c:out value ="${ board.title }"/></td>
				</tr>
				<tr>
					<th width = "25%">글쓴이</th>
					<td>${ board.writer }</td>
				</tr>
				<tr>
					<th width = "25%">조회수</th>
					<td>${ board.viewCnt }</td>
				</tr>
				<tr>
					<th width = "25%">등록일</th>
					<td>${ board.regDate }</td>
				</tr>
				<tr>
					<th width = "25%">내용</th>
					<td style = "height : 200px;">${ board.content }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:forEach items="${ fileList }" var="file">
							<a href = "/Mission-WEB/upload/${ file.fileSaveName }">
								${ file.fileOriName }
							</a>
							(${ file.fileSize } bytes)<br>
						</c:forEach>
					</td>
				</tr>
			</table>
			<br>
			<input type=button value ="수정" onclick = "doAction('U')">&nbsp;&nbsp;
			<input type=button value ="삭제" onclick = "doAction('D')">&nbsp;&nbsp;
			<input type=button value ="목록" onclick = "doAction('L')">&nbsp;&nbsp;
		</div>
	</section>

	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>