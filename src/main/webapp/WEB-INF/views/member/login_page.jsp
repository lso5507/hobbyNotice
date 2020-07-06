<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

var message = '${msg}';
var returnUrl = '${url}';
if(message.length != 0){
	alert(message);
	document.location.href=url;
}

</script>

<div class="mem_login">
	<form action="login" method="post" id="memLoginForm">

		<div class="mem_login_title">
			<h1 id="memTitle">Hobby 로그인</h1>
		</div>
		
		<div class="mem_login_id">
			<input type="text" placeholder="아이디" name="memId" id="memId" required>
		</div>
		
		<div class="mem_login_pw">
			<input type="password" placeholder="비밀번호" name="memPw" id="memPw" required>
		</div>
		
		<div class="mem_login_submit">
			<input type="submit" value="로그인" name="memSubmit" id="memSubmit">
		</div>
		
		<div class="mem_login_href">
			<span><a href="/hobby/create_account_view">회원가입</a></span> |
			<span><a href="/hobby/idSearch_page">아이디 찾기</a></span> |
			<span><a href="/hobby/pwSearch_page">비밀번호 찾기</a></span>
		</div>
	</form>
</div>	