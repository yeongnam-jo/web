<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(no);
	
	pageContext.setAttribute("board", board);

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	hr, table {
		width : 100%;
	}
</style> 
<script>
	function doWrite(){
		let f = document.uForm;
		if(f.title.value  == ''){
			alert('제목을 입력하세요.')
			f.title.focus();
			return false;
		}
		
		/* if(f.writer.value  == ''){
			alert('글쓴이를 입력하세요.')
			f.writer.focus();
			return false;
		} */
		
		if(f.content.value  == ''){
			alert('내용을 입력하세요.')
			f.content.focus();
			return false;
		}
		
		return true;
	}

	function doAction(type){
		switch(type){
		case 'P':
			location.href = "detail.jsp?no=${ param.no }";
			break;
		}
	}
	
	window.onload = function() {
		/* alert('수정완료') */
		/* location.href = "detail.jsp?no=${ param.no }"; */
		
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
			<h2>게시글 수정 페이지</h2>
			<hr>
			<br>
			<form action = "update.jsp" method ="post" name = "uForm" onsubmit="return doWrite()">
				<table border = "1"> 
					<tr>
						<th width = "25%">번호</th>
						<td>${ board.no }</td>
						<input type="hidden" name="no" value ="${ board.no }">
					</tr>
					<tr>
						<th width = "25%">제목</th>
						<td><input type = "text" name = "title" value ="${ board.title }" style = "height:100%; width:100%;"></td>
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
						<td style = "height : 200px;"><input type = "text" name = "content" value ="${ board.content }" style = "height:100%; width:100%;"></td>
					</tr>
				
				</table>
			
				<input type="submit" value ="수정 완료">&nbsp;&nbsp;
				<input type="button" value ="이전" onclick = "doAction('P')">&nbsp;&nbsp;
			</form>
			<br>
		</div>
	</section>

	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>