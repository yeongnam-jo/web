<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/* // 1. 자바빈즈클래스 + 컬렉션
	BoardVO board = new BoardVO();
	board.setTitle("성공");
	
	List<BoardVO> boardList = new ArrayList<>();
	boardList.add(board); */
	

	/* //2. 자바빈즈클래스 + 배열
	BoardVO board = new BoardVO();
	board.setTitle("성공");
	BoardVO[] boardList = {board}; */
	
	
	/* //3. 맵객체 + 배열
	Map<String, String> board = new HashMap<>();
	board.put("title", "성공");
	
	Map[] boardList = {board}; */
	
	
	//4. 맵객체 + 컬렉션
	Map<String, String> board = new HashMap<>();
	board.put("title", "성공");
	List<Map<String, String>> boardList = new ArrayList<>();
	boardList.add(board);
	
	pageContext.setAttribute("boardList", boardList);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	성공/실패 ? ${ boardList[0].title }<br>
	<%-- [] ==> 배열 또는 컬렉션 --%>
	<%-- .  ==> 자바빈즈(게터), 맵(key) --%>
</body>
</html>