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
	<link href="/hobby/resources/css/mainstyle.css" rel="stylesheet"> <!-- 메인화면 css -->
</head>
<body>
    <div id="mainLayout">
    	<div id="main">
    		<tiles:insertAttribute name="header" />
    		<div id="content">
    			<tiles:insertAttribute name="left" />
    			<tiles:insertAttribute name="body" />
    		</div>
    		<tiles:insertAttribute name="footer" />
    	</div>
		<!------------- 배너광고 영역 ------------->
		<div id="banner">
			<div class="banner_size">
				<a href=""><img alt="광고1" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고2" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고3" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고4" src=""></a>
			</div>
			<div class="banner_size">
				<a href=""><img alt="광고5" src=""></a>
			</div>
		</div>
		<!------------- 배너광고 영역 ------------->
    </div>
</body>
</html>