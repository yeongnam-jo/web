<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();

	/* MemberVO loginVO = new MemberVO();  */
	MemberVO userVO = (MemberVO)session.getAttribute("userVO");
	
	/* System.out.println(userVO);
	
	String id = userVO.getId();
	String password = userVO.getPassword();
	
	System.out.println(id);
	System.out.println(password); */

	
	/* loginVO.setId(id);
	loginVO.setPassword(password); */
	
	/* MemberVO userVO2 = dao.login(loginVO);
	session.setAttribute("userVO", userVO2); */

	String id = userVO.getId();
	MemberVO mypageVO = dao.selectMemberById(id);
	pageContext.setAttribute("mypageVO", mypageVO); 
	/* request.setAttribute("mypageVO", mypageVO); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function doLeave(id){
		if(confirm("회원탈퇴 화면으로 이동합니다.")){
			location.href = "memberLeaveCheck.jsp?id=" + id;
		}
	}
	
	function doChangePassword(id){
		location.href = "memberPasswordCheck.jsp?id=" + id;
	}
	
	/* function doAction(type){
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
	} */
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		<div align = "center">
		
			<hr width="100%">
			<h2>마이 페이지</h2>			
			<hr width="100%">

			<br>
			<form action = "mypageSave.jsp" method = "post" name = "jForm" onsubmit = "return doCheck()">
				<table border = "1" style = "width : 80%">
					<tr>
						<th>ID</th>
						<!-- <td><input type = "text" name = "id" size = "20px"></td>  -->
						<%-- <td>${ mypageVO.id }</td> --%>
						<td><input type = "text" name = "id" size = "20px" value = ${ mypageVO.id } readonly></td>  
					</tr>
					<tr>
						<th style = "width : 20%">이름</th>
						<td><input type = "text" name = "name" size = "20px" value = ${ mypageVO.name } readonly></td>
						<%-- <td>${ mypageVO.name }</td> --%>
						
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type = "text" name = "email" size = "10px" value = ${ mypageVO.email } >@<input type = "text" name = "domain" size = "10px" value = ${ mypageVO.domain }></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type = "text" name = "tel1" size = "6px" value = ${ mypageVO.tel1 }>-<input type = "text" name = "tel2" size = "7px" value = ${ mypageVO.tel2 }>-<input type = "text" name = "tel3" size = "7px" value = ${ mypageVO.tel3 }></td> 
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type = "text" name = "post" size = "20px" value = ${ mypageVO.post }></td> 
					</tr>
					<tr>
						<th>기본 주소</th>
						<td><input type = "text" name = "addr1" size = "20px" value = ${ mypageVO.addr1 }></td> 
					</tr>
					<tr>
						<th>상세 주소</th>
						<td><input type = "text" name = "addr2" size = "20px" value = ${ mypageVO.addr2 }></td> 
					</tr>
					
				</table>
				<!-- 
				<input type = "button" value = "회원탈퇴" onclick = "location.href = 'memberLeave.jsp'">
				<input type = "button" value = "비밀번호 변경" onclick ="location.href = 'memberPassword.jsp'"> 
				-->
				<input type = "button" value = "회원탈퇴" onclick = "doLeave('${ mypageVO.id }')">
				<input type = "button" value = "비밀번호 변경" onclick ="doChangePassword('${ mypageVO.id }')">
				<input type = "submit" value = "변경 사항 저장">
				<!-- <input type = "submit" value = "등록"> -->
			</form>
		</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>	
	</footer>
</body>
</html>