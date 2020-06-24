<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!--                                이곳은 리디렉트전 alert 창을 띄우기 위한 jsp 폼입니다.                                -->
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		var msg="${message}";
		alert(msg);
		document.location.href="${url}";
	</script>
</body>
</html>