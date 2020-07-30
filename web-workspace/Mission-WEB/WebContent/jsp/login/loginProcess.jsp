<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// post 방식이니까 인코딩 설정이 우선!
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// VO 객체 생성 및 초기화
	MemberVO loginVO = new MemberVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	// DB에서 사용자 check
	MemberDAO dao = new MemberDAO();
	
	// 반환값이 null이면 로그인 실패
	// 반환값이 loginVO 객체라면 로그인 성공
	MemberVO userVO = dao.login(loginVO);
	
	String msg="";
	String url="";
	
	if(userVO == null){
		
		msg = "아이디 또는 패스워드를 잘못 입력했습니다.";
		url = "/Mission-WEB/jsp/login/login.jsp";
		
	}else{ // 제대로 입력한 경우
		
		// 세션 등록
		session.setAttribute("userVO", userVO);
		
		switch(userVO.getType()){
		case "S" : 
			msg = "관리자님 환영합니다.";
			break;
		case "U" : 
			msg = userVO.getId() + "님 환영합니다.";
			break;
		}
		
		url = "/Mission-WEB";
		
	}
	
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
	
%>

<script>
	
	<%-- alert('<%= msg %>'); --%>
	alert('${ msg }');
	location.href = "${ url }" 
	
</script>