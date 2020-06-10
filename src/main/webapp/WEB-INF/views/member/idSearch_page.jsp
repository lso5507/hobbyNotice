<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script type="text/javascript">

function idSearch(){
	var memEmail = document.idSearchForm.email.value + "@" + document.idSearchForm.emadress.value
	document.idSearchForm.memEmail.value = memEmail;
	
	document.idSearchForm.action="idSearch";
	document.idSearchForm.submit();
}

var memId = '${mVo.memId}';
if(memId.length != 0){
	alert('아이디 : ' + memId);	
}


</script>

</head>
<body>

	<div class="find">
		<form name="idSearchForm" method="post" action="idSearch">
			<h1>회원계정 찾기</h1>
			<fieldset>

				<legend>아이디 찾기</legend>
				<table>
					<tr>
						<td>이름</td>
						<td><input type="text" size="35" name="memName"
							placeholder="이름"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email"> @ <select
							name="emadress">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
						</select></td>
					</tr>
				</table>

				<input type="hidden" name="memEmail" value=""> <input
					type="button" value="아이디 찾기" onClick="idSearch()" /> <a
					href="login_page"> <input type="button" value="로그인 하기">
				</a>

			</fieldset>
		</form>
</body>
</html>