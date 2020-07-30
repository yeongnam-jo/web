<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id"); 

	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectMemberById(id);
	
	String password = member.getPassword();
	
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("password", password);
	
	/* System.out.println(id);
	System.out.println(password); */
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doCheck(){
		let f = document.pForm;
		
		/* alert("입력한 값 " + f.password.value);
		alert('원래 비번 ' + '${ password }') */
		
		if(f.password.value != '${ password }'){
			alert("현재 비밀번호를 잘못 입력하셨습니다.")
			return false;
		} 
		
		if(f.passwordC.value != f.passwordC2.value){
			alert("변경할 비밀번호가 일치하지 않습니다.")
			return false;
		} 
		
		return true;
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
			<h2>회원 탈퇴</h2>			
			<hr width="100%">

			<br>
			<form action = "memberPassword.jsp" method = "post" name = "pForm" onsubmit = "return doCheck()">
				<table border = "1" style = "width : 100%">
					<tr>
						<th width = "200px">현재 비밀번호 입력</th>
						<!-- <td><input type = "text" name = "id" size = "20px"></td>  -->
						<%-- <td>${ mypageVO.id }</td> --%>
						<td><input type = "password" name = "password"></td>  
					</tr>
					<tr>
						<th>변경 비밀번호 입력</th>
						<td><input type = "password" name = "passwordC"></td>
					</tr>
					<tr>
						<th>변경 비밀번호 재입력</th>
						<td><input type = "password" name = "passwordC2"></td>
					</tr>
				</table>
				<input type = "submit" value = "비밀번호 변경">
			</form>
		</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>	
	</footer>
</body>
</html>