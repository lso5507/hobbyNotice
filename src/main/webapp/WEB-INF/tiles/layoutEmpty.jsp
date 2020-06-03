<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취미 공유 커뮤니티</title>
	<!------------------- 사용하는 js 링크 ------------------------>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		
		
	<!------------------- 사용하는 css 링크 ------------------------>	
	<link href="/hobby/resources/css/layoutEmpty.css" rel="stylesheet"> <!-- 레이아웃 css -->

</head>
<body>
    <div id="emptyLayout">
    	<tiles:insertAttribute name="body" />
    </div>
</body>
</html>