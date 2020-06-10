<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>


<script type="text/javascript">

//아이디 중복확인
function idCkeck(){
	document.inputForm.action = "/hobby/idCheck?memId=" + document.inputForm.memId.value;
	document.inputForm.submit();
}

// 회원가입 버튼
function joincheck(){
	var inputForm = document.inputForm;
	
	if(inputForm.memId.value.length == 0){
		alert("아이디를 입력하세요!");
		return;
	}
	if(inputForm.memPw.value.length == 0){
		alert("비밀번호를 입력하세요!");
		return;
	}
	if(inputForm.memPw.value != inputForm.pwdCheck.value){
		alert("비밀번호가 일치하지 않습니다!");
		return;
	}
	if(inputForm.memPwAns.value.length == 0){
		alert("비밀번호 답변을 입력하세요!");
		return;
	}
	if(inputForm.memName.value.length == 0){
		alert("이름을 입력하세요!");
		return;
	}
	
	
	var memEmail = inputForm.email1.value + "@" + inputForm.email2.value
	var memPhone = inputForm.smartPhone.value+"-"+ inputForm.smartPhone1.value+"-"+inputForm.smartPhone2.value
	var memBirth = inputForm.birth1.value+'년'+inputForm.birth2.value+'월'+inputForm.birth3.value+'일'
	
	inputForm.memEmail.value = memEmail;
	inputForm.memPhone.value = memPhone;
	inputForm.memBirth.value = memBirth;
	
	
	inputForm.action="create_account";
	inputForm.submit();
}   


</script>

</head>
<body>

	<form method="post" name="inputForm">
		<center>
			<table width=952px;>
				<tr>
					<td><label for="memId">아이디 </td>
					<td><input type="text" name="memId" id="memId" size="20px"
						placeholder="아이디를 입력하세요"> <input type="button" id="check"
						value="중복확인" onClick="idCkeck()"> * 영문 소문자,숫자 조합 최대 20자 <br>${msg }
					</td>
				</tr>
				<tr>
					<td><label for="memPw">비밀번호 </td>
					<td><input type="password" name="memPw" id="memPw" size="20px"
						placeholder="비밀번호를 입력하세요"> * 영문 대소문자/숫자/특수문자를 혼용하여
						2종류10~16자 또는 3종 8~16자</td>
				</tr>
				<tr>
					<td><label for="pwdCheck">비밀번호 확인 </td>
					<td><input type="password" name="pwdCheck" id="pwdCheck"
						size="20px" placeholder="한번 더 입력하세요"></td>
				</tr>
				<tr>
					<td><label for="memPwHint">비밀번호 힌트 </td>
					<td><select id="memPwHint">
							<option value="0">어릴때 별명은?</option>
							<option value="1">가장 친한친구 이름은?</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="memPwAns">비밀번호 답변 </td>
					<td><input type="text" name="memPwAns" id="memPwAns"
						size="20px"></td>
				</tr>
				<tr>
					<td><label for="memName">이름 </td>
					<td><input type="text" name="memName" id="memName" size="20px">
					</td>
				</tr>
				<tr>
					<td>생일/성별</td>
					<td><script type="text/javascript">
                         var today = new Date();
                         var toyear = parseInt(today.getFullYear ());
                         var start = toyear;
                         var end = toyear - 50;

                         document.write("<select name=birth1> ");
                         document.write("<option value='2015' selected>");
                         for (i=start;i>=end;i--) document.write("<option>"+i);
                         document.write("</select>년  ");

                         document.write("<select name=birth2>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=12;i++) document.write("<option>"+i);
                         document.write("</select>월  ");

                         document.write("<select name=birth3>");
                         document.write("<option value='' selected>");
                         for (i=1;i<=31;i++) document.write("<option>"+i);
                         document.write("</select>일  </font>");
                    </script> <input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<td><label for="City">지역 </td>
					<td><select id="memRegion" name="memRegion">
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="제주">제주</option>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="울산">울산</option>
							<option value="부산">부산</option>
							<option value="광주">광주</option>
							<option value="세종">세종</option>
					</select> <input type="text" name="memCity" id="memCity" size="10"
						placeholder="시/군/구"></td>
				</tr>
				<tr>
					<td><label for="email">이메일 </td>
					<td><input type="text" name="email1" id="email1" size="10">
						@ <select id="email2">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
					</select> <input type="button" id="checkEmail" value="중복확인"></td>
				</tr>
				<tr>
					<td><label for="phone">휴대폰 </td>
					<td><select id="smartPhone" name="smartPhone">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
					</select> - <input type="text" name="smartPhone1" size="5"> - <input
						type="text" name="smartPhone2" size="5"> <input
						type="button" id="checkPhone" value="번호인증"></td>
				</tr>
				<tr>
					<td><label for="memHobby">취미 </td>
					<td><input type="checkbox" name="memHobby" value="게임">e-sport(게임)
						<input type="checkbox" name="memHobby" value="운동">sport(운동)
						<input type="checkbox" name="memHobby" value="문화">culture(문화)
					</td>
				</tr>
			</table>
		</center>
		<center>
			<input type="button" id="join" value="회원가입" onClick="joincheck()">
		</center>

		<input type="hidden" name="memEmail" value=""> <input
			type="hidden" name="memPhone" value=""> <input type="hidden"
			name="memBirth" value="">


	</form>

</body>
</html>