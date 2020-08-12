<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<a href="${ pageContext.request.contextPath }">HOME</a>
<a href="${ pageContext.request.contextPath }/board/list.do">게시판</a>
<c:choose>
	<c:when test = "${ empty userVO }">
		<a href="${ pageContext.request.contextPath }/login.do">로그인</a>
	</c:when>
	<c:otherwise>
		<a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
