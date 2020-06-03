<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script>
	var message = '${msg}';
	var returnUrl = '${url}';
	if(message.length != 0){
		alert(message);
	}
	document.location.href=url;
</script>


</head>
<body>

<form method="post" action="login">
	<div class="header_container">
		<center> <h1> Hobby </h1> </center>   
	</div>
	<div class="container"><center>
		<div class="inp_id">
			<input type="text" placeholder="ID" name="memId" required>
		</div>
		<div class="inp_pw">   
			<input type="password" placeholder="Password" name="memPw" required>
		</center></div><br>
		<div class="login_sub"><center>
			<button type="submit">로그인</button>
		</center></div>
	</div>
	<div class="footer_container"><center>
			<a href="/hobby/create_account_view">회원가입</a>
			<a href="/hobby/idSearch_page">아이디 찾기</a>
			<a href="/hobby/Login_FindPW">비밀번호 찾기</a>  
	</center></div>
</form> 

</body>
</html>