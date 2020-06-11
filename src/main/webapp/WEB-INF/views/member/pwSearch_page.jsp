<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="pwSearch_page.css" rel="stylesheet" />

<title>비밀번호 찾기</title>

<script type="text/javascript">

var memPw = '${mVo.memPw}';
if(memPw.length != 0){
	alert('비밀번호 : ' + memPw);	
}

</script>

</head>
<body>

<form method="post" action="pwSearch">

<div class="mem_pwSearch">
	<div class="mem_pwSearch_title">
		<h1 id="pwSearch_title">비밀번호 찾기</h1>
	</div>
	
	<div class="mem_pwSearch_id">
		<span class="pwSearch_span">아이디</span>
		<input type="text" name="memId" id="memId" placeholder="아이디">
	</div>
	
	<div class="mem_pwSearch_hint">
		<span class="pwSearch_span">힌트</span>
		<select id="memPwHint">
			<option value="0">어릴때 별명은? </option>
			<option value="1">가장 친한친구 이름은?  </option>
		</select>
	</div>
	
	<div class="mem_pwSearch_anwser">
		<span class="pwSearch_span">답변</span>
		<input type="text" name="memPwAns" id="memPwAns" placeholder="가입 시 입력한 답변">
	</div>
	
	<div class="mem_pwSearch_btn">
		<input type="submit" id="memSearch" value="비밀번호 찾기">
		<a href="login_page"> <input type="button" id="memLogin" value="로그인 하기"> </a>
	</div>
</div>

</form>

</body>
</html>