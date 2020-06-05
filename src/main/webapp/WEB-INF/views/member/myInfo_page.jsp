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

<h1>${mVo.memName } 님의 정보관리</h1>

<form name="myInfo">

	<a href="myInfo_modify_page"> <input type="button" value="회원정보 수정"><br><br> </a>
	
	<a href="myPw_modify_page"> <input type="button" value="비밀번호 변경"> </a><br><br>
	
	<a href="mDelete"> <input type="button" value="회원탈퇴"></a> <br><br> 
	
	<a href="logout"> <input type="button" value="로그아웃"><br> </a>

</form>





</body>
</html>
