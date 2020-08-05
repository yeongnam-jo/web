<%@page import="kr.ac.kopobank.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopobank.util.ConnectionFactory"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goWriteForm(){
		alert("click...")
		location.href = "writeForm.jsp"; 
		/* location.herf = "/Mission-WEB/board/writeForm.jsp"; */   /* 최초 슬래쉬는 deploy path 이다. localhost:9999/Mission-WEB/board/writeForm.jsp*/
	}
</script>

</head>
<body>

	<%
		//DB 접속
		String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";

		String user ="DA09";
		String password ="DA09";
	 	Connection conn = new ConnectionFactory().getConnection(url, user, password);
		
		//쿼리 작성
		StringBuilder sql = new StringBuilder();
		sql.append(" Select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("   from t_board ");
		sql.append("   order by no "); 
  
		//prepaparedStatement 방식으로 sql을 전달한다.
		PreparedStatement pstmt = conn.prepareStatement(sql.toString()); //StringBuilder 클래스이기 때문에, toString을 통해 문자열로 바꿔야 함.
		ResultSet rs = pstmt.executeQuery(); 
		
	%>


	<div align = "center">
		<hr width = 80%>
		<h2>게시판 목록</h2>
		<hr width = 80%>
		
		<table border="1" style = "width: 80%">
			<tr>
				<th width = 7%>번호</th>
				<th >제목</th>
				<th width = 16%>글쓴이</th>
				<th width = 20%>등록일</th>
			</tr>
			
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%= rs.getInt("no") %></td>
					<td><%= rs.getString("title") %></td>
					<td><%= rs.getString("writer") %></td>
					<td><%= rs.getString("reg_date") %></td>
				</tr>
			<%
				}
			%>
			
			
		</table>
		<br>
		<!-- <a href = "">새글 등록</a> -->
		<button onclick="goWriteForm()">새글등록</button>
		
	</div>
	
	<%
		JDBCClose.close(conn, pstmt);
	%>

</body>
</html>