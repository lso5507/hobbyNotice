<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

function CheckId(){
	alert(document.Create.memId.value);
	
	document.Create.action = "/hobby/idCheck?memId=" + document.Create.memId.value;
	document.Create.submit();
}

</script>


<body>



<form name="Create" action="create_account" method="post">
	
	아이디 : <input type="text" name="memId">
	<input type="button" value="중복확인" onClick="CheckId()"> ${msg } <br>
	
	비밀번호 : <input type="password" name="memPw"><br>
	이름 : <input type="text" name="memName"><br>
	
	이메일 : <input type="text" name="memEmail"><br>
	핸드폰 : <input type="text" name="memPhone"><br>
	도 : <input type="text" name="memRegion"><br>
	시 : <input type="text" name="memCity"><br>
	비밀번호 힌트 : <input type="text" name="memPwHint"><br>
	비밀번호 답변 : <input type="text" name="memPwAns"><br>
	
	<input type="submit" value="회원가입">
	
</form>

</body>
</html>