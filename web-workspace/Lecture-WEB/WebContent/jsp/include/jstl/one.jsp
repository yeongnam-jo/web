<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri = "http://java.sun.com/jstl/core" %>
<hr>
id : <%= request.getAttribute("id") %><br>
id : ${ id } <br>

날라온 파라미터<hr>
name : <%= request.getParameter("name") %><br>
age : <%= request.getParameter("age") %><br>
<hr>
name : ${ param.name }<br>
age : ${ param.age }<br>

<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<h2>인클루드된 내용</h2>
<hr>

<c:set var="phone" value="010-1111-2222" scope = "request"/> <br>
phone : ${ phone }

