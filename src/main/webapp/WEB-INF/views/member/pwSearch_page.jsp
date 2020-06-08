<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script type="text/javascript">

var memPw = '${mVo.memPw}';
if(memPw.length != 0){
	alert('비밀번호 : ' + memPw);	
}

</script>

</head>
<body>
<div class="find">
<form method="post" action="pwSearch">
<h1>비밀번호 찾기</h1>
	<fieldset>
		<legend>비밀번호 찾기</legend>
		<table>
			<tr>
				<td>아이디</td>
				<td>
				<input type="text" size="20px" name="memId" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td>힌트</td>
				<td>
					<select id="memPwHint">
						<option value="0">어릴때 별명은? </option>
						<option value="1">가장 친한친구 이름은?  </option>
					</select>
				</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					<input type="text" name="memPwAns" id="memPwAns" size="20px" placeholder="가입 시 입력한 답변">
				</td>
			</tr>
		</table>
		<input type="submit" value="비밀번호 찾기">
		<a href="login_page"> <input type="button" value="로그인 하기"> </a>
	</fieldset>
</form>
</div>

</body>
</html>