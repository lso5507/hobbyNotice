<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="login_ui.css">

<title>로그인</title>

<script>

var message = '${msg}';
var returnUrl = '${url}';
if(message.length != 0){
	alert(message);
	document.location.href=url;
}


</script>

</head>
<body>


<form action="login" method="post">

	<div class="mem_section">
		<div class="mem_section_title">
			<h1 id="memTitle">Hobby 로그인</h1>
		</div>
		
		<div class="mem_section_id">
			<input type="text" placeholder="ID" name="memId" id="memId" required>
		</div>
		
		<div class="mem_section_pw">
			<input type="password" placeholder="Password" name="memPw" id="memPw" required>
		</div>
		
		<div class="mem_section_submit">
			<input type="submit" value="로그인" name="memSubmit" id="memSubmit">
		</div>
		
		<div class="mem_section_href">
			<span><a href="/hobby/create_account_view">회원가입</a></span> |
			<span><a href="/hobby/idSearch_page">아이디 찾기</a></span> |
			<span><a href="/hobby/pwSearch_page">비밀번호 찾기</a></span>
		</div>
	</div>
	
</form>


</body>
</html>