<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<style>

/* 	th{
		background-color: gray;
	}
	
	tr{
		height : 80px;
	} */

</style>

<script>
	function doCheck(){
		
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
	
	
</script>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align = "center">
		
			<hr width="100%">
			<h2>회원 가입</h2>
			<hr width="100%">
			

			<br>
			<form action = "join.jsp" method = "post" name = "jForm" onsubmit = "return doCheck()">
				<table border = "1" style = "width : 80%">
					<tr>
						<th style = "width : 20%">이름</th>
						<td><input type = "text" name = "name" size = "20px"></td> 
					</tr>
					<tr>
						<th>ID</th>
						<td><input type = "text" name = "id" size = "20px"></td> 
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
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
	
</body>
</html>