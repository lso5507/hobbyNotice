<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취미 공유 커뮤니티</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<!-- 기본 레이아웃 css --> 
	<link href="/hobby/resources/css/tiles/layout.css" rel="stylesheet" /> <!-- layout css -->
	<link href="/hobby/resources/css/tiles/header.css" rel="stylesheet" /> <!-- header css -->
	<link href="/hobby/resources/css/tiles/left.css" rel="stylesheet" /> <!-- left css -->
	<link href="/hobby/resources/css/tiles/footer.css" rel="stylesheet" /> <!-- footer css --> 

	<!-- 
		변경 레이아웃 css // url에 따라서 css도 열림, jsp와 css가 같은 이름이어야함
		Controller에서 url의 return 해주는 값으로 tiles.xml의 name매칭 값에 따라 jsp와 css를 같이 링크함. 
	--> 
	<link href="/hobby/resources/css/<tiles:getAsString name="static" ignore="true" />.css" rel="stylesheet"/> 
</head>
<body>
    <div id="mainLayout">
    	<div id="main">
    		<tiles:insertAttribute name="header" />
    		<div id="content">
    			<tiles:insertAttribute name="left" /> <!-- side -->
    			<tiles:insertAttribute name="body" />
    		</div>
    		<tiles:insertAttribute name="footer" />
    	</div>
		<!------------- 배너광고 영역 ------------->
		<div id="banner">
			<div class="banner_size">
				<a href="/hobby/"><img alt="광고1" src="/hobby/resources/img/Banner_Hobby.png"></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고2" src=""></a>
			</div>
		</div>
		<!------------- 배너광고 영역 ------------->
    </div>
</body>
</html>