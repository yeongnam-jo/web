<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] names = {"홍기리보이", "윤기리보이", "강기리보이"};
	pageContext.setAttribute("names", names);
	pageContext.setAttribute("namesLength", names.length - 1);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${ fn:length(names) }<br>
	
	<c:forEach items="${ names }" varStatus="loop">
		${ loop.first } : ${ loop.last } : ${ loop.index } : ${ loop.count } <br>
	</c:forEach>
	<br>
	<br>
	<c:forEach items="${ names }" var ="name" varStatus ="loop">
		<%-- <c:if test="${ not loop.first }"> --%>
		<%-- <c:if test="${ loop.index != 0 }"> --%>
		<c:if test="${ loop.count ne 1 }">
			,
		</c:if>
		${ name }
	</c:forEach>
	<br>============================<br>
	
	<c:forEach items="${ names }" var = "name" varStatus ="loop">
		${ name }
		<c:if test="${ not loop.last }">
		,
		</c:if>
	</c:forEach>

	<br>============================<br>
	<c:forEach begin="0" end ="${ namesLength }" var = "i">
		${ names[i] } <br>
	</c:forEach>
	<br>
	<br>
	
	<br>============================<br>
	<c:set var="cnt" value="1"/>
	<c:forEach items="${ names }" var="name">
		<c:if test="${ cnt != 1}">
		,
		</c:if>
		${ name }
		<c:set var="cnt" value = "${ cnt + 1 }"/>
	</c:forEach>
	<br>============================<br>
	
	<c:forEach begin="0" end="${ fn:length(names) - 1 }" var="i">
		${ names[i] } 
	</c:forEach>

	<br>============================<br>
	<c:remove var="cnt" scope="page"/>
	<br>

	1 ~ 10 사이의 정수 출력<br>
	<c:forEach begin="1" end="10" var="i">
	
		${ i }
	
	</c:forEach>
	<br>
	연도 선택 : 
	<select>
		<option>2020</option>
		<option>2019</option>
		<option>2018</option>
		<option>2017</option>
	</select>
	<br>
	
	연도 선택 : 
	<select>
		<c:forEach begin="1980" end="2020" var = "year" step ="10">
			<option>${ year }</option>
		</c:forEach>
	</select>

</body>
</html>