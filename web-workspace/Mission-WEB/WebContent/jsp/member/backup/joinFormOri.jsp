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
<style>

	th{
		background-color: gray;
	}
	
	tr{
		height : 80px;
	}

</style>

<script>
	function doCheck(){ // type 이름을 아래에 적어서, 제약조건 걸자.
		
		let f = document.jForm;
	
		if(f.name.value  == ''){
			alert('이름을 입력하세요.')
			f.name.focus();
			return false;
		}
		
		if(f.id.value  == ''){
			alert('아이디를 입력하세요.')
			f.id.focus();
			return false;
		}
		
		if(f.password.value  == ''){
			alert('비밀번호를 입력하세요.')
			f.password.focus();
			return false;
		}
		
		if(f.passwordRe.value  == ''){
			alert('확인 비밀번호를 입력하세요.')
			f.passwordRe.focus();
			return false;
		}
		
		if(f.password.value != f.passwordRe.value){
			alert('입력하신 비밀번호가 다릅니다.')
			f.passwordRe.focus();
			return false;
		}
		
		
		if(f.email.value  == ''){
			alert('이메일을 입력하세요.')
			f.email.focus();
			return false;
		}
		
		if(f.domain.value  == ''){
			alert('상세 이메일 주소를 입력하세요.')
			f.domain.focus();
			return false;
		}
		
		if(f.tel1.value  == ''){
			alert('휴대폰 번호를 입력하세요.')
			f.tel1.focus();
			return false;
		}
		if(f.tel2.value  == ''){
			alert('휴대폰 번호를 입력하세요.')
			f.tel2.focus();
			return false;
		}
		if(f.tel3.value  == ''){
			alert('휴대폰 번호를 입력하세요.')
			f.tel3.focus();
			return false;
		}
		
		if(f.post.value  == ''){
			alert('우편번호를 입력하세요.')
			f.post.focus();
			return false;
		}
		
		if(f.addr1.value  == ''){
			alert('기본 주소를 입력하세요.')
			f.addr1.focus();
			return false;
		}
		
		if(f.addr2.value  == ''){
			alert('상세 주소를 입력하세요.')
			f.addr2.focus();
			return false;
		}
		
		return true;
	}
	
	
	function doReset(){
		location.href = "joinForm.jsp";
	}
	
	

 
 	window.onload = function(){
		let btn = document.getElementById("idBtn");
		btn.onclick = function(){
			
			
			<% 
			String id = request.getParameter("id");  // 일단 이걸 쓸 수 없다.
			System.out.println("id ========> " + id);
			
			//DB 접속
			String url ="jdbc:oracle:thin:@172.16.88.120:1521:dink";

			String user ="DA09";
			String password ="DA09";
		 	Connection conn = new ConnectionFactory().getConnection(url, user, password);
			
			//쿼리 작성
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT ID FROM T_MEMBER WHERE ID = ? ");
			
			//prepaparedStatement 방식으로 sql을 전달한다.
			PreparedStatement pstmt = conn.prepareStatement(sql.toString()); //StringBuilder 클래스이기 때문에, toString을 통해 문자열로 바꿔야 함.
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery(); 
			
			System.out.println(rs.next());
			/* String var = rs.getString("id");
			System.out.println("id value ====>" + var); */
			
			%>
			
			<%
			System.out.println(rs.next());
			if(rs.next()){
			%>			
				alert("ID가 중복됩니다.")
			<%
			} else {
			%>
				alert("사용 가능한 ID입니다.")
			<%
			}
			%>
		}
	}

	
</script>

</head>
<body>
	<div align = "center">
		<hr width = "80%">
		<h2>회원 가입</h2>
		<hr width = "80%">
		<br>
		
		<form action = "join.jsp" method = "post" name = "jForm" onsubmit = "return doCheck()">
			<table border = "1" style = "width : 80%">
				<tr>
					<th style = "width : 20%">이름</th>
					<td><input type = "text" name = "name" size = "20px"></td> 
				</tr>
				<tr>
					<th>ID</th>
					<td><input type = "text" name = "id" size = "20px"><input type = "button" value = "중복확인" id = "idBtn"></td> 
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type = "password" name = "password" size = "20px"></td> 
				</tr>
				<tr>
					<th>비밀번호 재입력</th>
					<td><input type = "password" name = "passwordRe" size = "20px"></td> 
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type = "text" name = "email" size = "10px">@<input type = "text" name = "domain" size = "10px"></td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><input type = "text" name = "tel1" size = "6px">-<input type = "text" name = "tel2" size = "7px">-<input type = "text" name = "tel3" size = "7px"></td> 
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type = "text" name = "post" size = "20px"></td> 
				</tr>
				<tr>
					<th>기본 주소</th>
					<td><input type = "text" name = "addr1" size = "20px"></td> 
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type = "text" name = "addr2" size = "20px"></td> 
				</tr>
				
			</table>
			
			<input type = "button" value = "초기화" onclick ="doReset()">
			<input type = "submit" value = "등록">
			
		</form>

	</div>
</body>
</html>