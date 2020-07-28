<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
   // 자바코드로 쓰면 이렇게
   //pageContext.setAttribute("cnt", 1);
   // 대신에 <c:set var="cnt" value="1" scope="page" /> 쓸라고함 워닝이 있음
   // 그래서 해결 하려고 태그 라이브러리 지시자 필요
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1값을 가지는 변수 cnt를 공유영역(page)에 설정<br>
	<c:set var="cnt" value="1" scope="request" />
 	<br>
 	
 	공유영역에 설정된 cnt 값을 출력<br>
   	${ cnt }<br>
   	<br>
   
	변수 cnt 값을  1증가<br>
	<%-- <c:set></c:set> --%>
	<c:set var="cnt" value ="${ cnt + 1 }" />
   	${ cnt }<br>
   	request cnt : ${ requestScope.cnt } <br>

</body>
</html>

<%-- 
	JSP				EL				JSTL
	------------------------------------
	pageContext		pageScope		page
	...
--%>