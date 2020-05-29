<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="join" method="POST">
	 ID :  <input type="text" name="memId"><br>
	 PWD :  <input type="password" name="memPw"><br>
	 Email:<input type="email" name="memMail"><br>
	<button type="submit" >Join</button>
	<button type="button" value="back" onclick="history.back()">Back</button>
</form>
<P> <a href="list">JOIN</a> </P>
<P> <a href="list">list</a> </P>
</body>
</html>
