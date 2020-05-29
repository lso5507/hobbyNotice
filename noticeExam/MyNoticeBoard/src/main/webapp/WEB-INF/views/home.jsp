<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<c:if test="${empty member}">
	<a>${member.getMemId()}</a>
	<P> <a href="joinview">JOIN</a> </P>
	<P> <a href="loginForm">Login</a> </P>
</c:if>

<c:if test="${!empty member}">
	<P> <a href="team">Team</a> </P>

	<P> <a href="tip">Tip </a> </P>
	
	<P> <a href="freeboard">FreeBoard </a> </P>
	
	<P> <a href="writeform">Write</a> </P>
</c:if>
</body>
</html>
