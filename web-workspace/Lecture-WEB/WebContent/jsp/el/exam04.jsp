<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.*"%> <%-- 와일드 카드 사용하여 해당 패키지 모두 임포트 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 아래의 내용이 바디 태그 내에 있어도 상관없다. --%>
<%

	BoardVO b = new BoardVO();

	b.setNo(10);
	b.setTitle("hello");
	
	// 공유영역에 해당 변수를 추가하자 
	
	// pageContext 영역에 객체 등록
	// 이름 : board 값 : 생성된 BoardVO 객체
	pageContext.setAttribute("board", b);
	
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	${board.no} ==> 자바빈즈 혹은 맵이 될 수 있다.
 --%>

	no : <%= b.getNo() %><br>
	
<%-- EL로 자바 객체를 표현하려면, 우선 공유영역에 해당 변수를 등록해야 한다. 저 위에서 공유영역에 등록하는 코드를 추가하자. --%>

<%-- 우선 공유영역에 등록된 객체를 자바표현식으로 나타내보자. --%>
	no : <%= pageContext.getAttribute("board") %><br> <%-- 이건 객체의 주소값이 나온다. --%>
	no : <%= ((BoardVO) pageContext.getAttribute("board")).getNo() %><br>
	
	title : <%= b.getTitle() %><br>
	title : <%= ((BoardVO)pageContext.getAttribute("board")).getTitle() %><br>
	
<%-- EL 방식으로 공유영역에 등록된 객체를 표현해보자. 자바표현식보다 훨씬 간편하다. --%>
	el no : ${ board.no }<br>
	el title : ${ board.title } <br>

</body>
</html>