<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="msg" value="<h1> hi jstl...</h1>" />
	value 속성만 지정 : <c:out value="JSTL" /><br>
	
	el msg : ${ msg }<br>
	msg : <c:out value ="${ msg }"/> <br> 
	
	<%-- EL은 태그가 먹기 때문에, core 라이브러리의 out 태그를 사용하는 것이 좋다. --%>
	
	msg : <c:out value ="${ msg }" default ="msg를 찾을 수 없습니다."/> <br>
   escapeXML=true 설정<br>
   <c:out value="<hr>" /> <br>
   escapeXML=false 설정<br>
   <c:out value="<hr>" escapeXml="false" /><br>

</body>
</html>