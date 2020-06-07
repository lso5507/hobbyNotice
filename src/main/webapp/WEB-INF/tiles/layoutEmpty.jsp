<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취미 공유 커뮤니티</title>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

	<!-- 기본 레이아웃 css -->	
	<link href="/hobby/resources/css/tiles/layoutEmpty.css" rel="stylesheet"> 
	<link href="/hobby/resources/css/tiles/header.css" rel="stylesheet" /> <!-- header css -->
	
	<!-- 
	변경 레이아웃 css
	Controller에서 url의 return 해주는 값으로 tiles.xml의 name매칭 값에 따라 jsp와 css를 같이 링크함. 
	--> 
	<link href="/hobby/resources/css/<tiles:getAsString name="static" ignore="true" />.css" rel="stylesheet"/> 

</head>
<body>
    <div id="emptyLayout">
    	<tiles:insertAttribute name="header" />
    	<div id="emptyLayout-body">
    		<tiles:insertAttribute name="body" />
    	</div>
    	
    </div>
</body>
</html>