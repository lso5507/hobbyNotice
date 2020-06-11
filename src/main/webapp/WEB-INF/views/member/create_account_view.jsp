<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="create_account_view.css">

<title>회원가입</title>

<script type="text/javascript">


var idOk = '${result}';
var id = '${memId}';

//아이디 중복확인
function idCkeck(){
	if(inputForm.memId.value.length == 0){
		alert("아이디를 입력하세요!");
		inputForm.memId.focus();
		return;
	}
	
	document.inputForm.action = "idCheck?memId=" + document.inputForm.memId.value;
	document.inputForm.submit();
}

/*
//이메일 인증번호 전송
function checkEmail(){
	
	var inputForm = document.inputForm;
	var memEmail = inputForm.email1.value + "@" + inputForm.email2.value;
	alert(memEmail);
	
	document.location.href="/hobby/sendMail.do?memEmail="+memEmail;
	
}

var randomNum = ${randomNum}
//alert('인증번호: ' + randomNum);

// 이메일 인증번호 확인
function checkEmail2(){
	
	if(document.inputForm.checkEmailNumber.value != randomNum){
		alert("이메일 인증번호가 틀립니다! 인증번호:" + randomNum);
		return;
	}
	
}
*/


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
	if(idOk != 'true'){
		alert("아이디 중복확인을 해주세요!");
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

<form method="post" name="inputForm" >

<div class="mem_create_account_view">
	<div>
		<h1 id="mem_create_title">회원가입</h1>
	</div>
	
	<div class="mem_create_id">
		<span class="mem_create_span">아이디</span>
        <input type="text" name="memId" id="memId" placeholder="영문 소문자/숫자 조합 최대 20자" value="${memId}">
        <input type="button" value="중복확인" id="idcheck" onClick="idCkeck()">
		<span class="memEx"> ${msg}</span>
	</div>
	
	<div class="mem_create_pw">
		<span class="mem_create_span">비밀번호</span>
        <input type="password" name="memPw" id="memPw" placeholder="비밀번호를 입력하세요"> 
        <span class="memEx">* 영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자</span>       
	</div>
	
    <div class="mem_create_rpw">
		<span class="mem_create_span">비밀번호 확인</span>
        <input type="password" name="pwdCheck" id="mempwdCheck" placeholder="한번 더 입력하세요">
    </div>
    
	<div class="mem_create_pwhint">
		<span class="mem_create_span">비밀번호 힌트</span>
		<select id="memPwHint">
			<option value="0">어릴때 별명은?</option>
			<option value="1">가장 친한친구 이름은?</option>
		</select>
	</div>
	
	<div class="mem_create_pwans">
		<span class="mem_create_span">비밀번호 답변</span>
		<input type="text" name="memPwAns" id="memPwAns">
	</div>
	
	<div class="mem_create_name">
        <span class="mem_create_span">이름</span>
        <input type="text" name="memName" id="memName" size="20px"> 
    </div>
    
	<div class="mem_create_brith_sex">
		<span class="mem_create_span">생일/성별</span>
        <script type="text/javascript">
            var today = new Date();
            var toyear = parseInt(today.getFullYear ());
            var start = toyear;
            var end = toyear - 50;
            document.write("<select name=birth1 id=brith1> ");
            document.write("<option value='----' selected>");
            for (i=start;i>=end;i--) document.write("<option>"+i);
            document.write("</select> 년  ");
            document.write("<select name=birth2 id=brith2>");
            document.write("<option value='--' selected>");
            for (i=1;i<=12;i++) document.write("<option>"+i);
            document.write("</select> 월  ")
            document.write("<select name=birth3 id=brith3>");
            document.write("<option value='--' selected>");
            for (i=1;i<=31;i++) document.write("<option>"+i);
            document.write("</select> 일  </font>");
        </script>
        <!-- 
        <input type="radio" name="gender" value="남" checked> 남
        <input type="radio" name="gender" value="여"> 여
         -->
	</div>
	
	<div class="mem_create_city">
        <span class="mem_create_span">지역</span>
    	<select id="memRegion" name="memRegion">
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
		</select>
        <input type="text" name="memCity" id="memCity" placeholder=" 시/군/구 ">
    </div>
    
	<div class="mem_create_email">
        <span class="mem_create_span">이메일</span>
        <input type="text" name="email1" id="email1"> @
        <select id="email2">
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
        </select>
        <input type="button"  value="이메일 인증" onClick="checkEmail()"> <br>
                  
    </div>

    <div>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 인증번호 : <input type="text" name="checkEmailNumber"> 
		<input type="button" value="확인" onClick="checkEmail2()"><br>
    </div>
    
	<div class="mem_create_phone">	
		<span class="mem_create_span">휴대전화</span>
        <select id="smartPhone" name="smartPhone">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="019">019</option>
        </select>
        - <input type="text" name="smartPhone1" id="smartPhone1">
        - <input type="text" name="smartPhone2" id="smartPhone2">
 	</div>
 	
 	<!-- 
	<div class="mem_create_hobby">
		<span class="mem_create_span">취미</span>
		<input type="checkbox" name="memHobby" value="게임"> e-sport(게임)
		<input type="checkbox" name="memHobby" value="운동"> sport(운동)
		<input type="checkbox" name="memHobby" value="문화"> culture(문화)
	</div>
	 -->
	<div class="mem_create_btnjoin">
		<input type="button" id="join" value="회원가입" onClick="joincheck()">
	</div>
	
	<div class="mem_create_hidden">
		<input type="hidden" name="memEmail" value="">
        <input type="hidden" name="memPhone" value="">
        <input type="hidden" name="memBirth" value="">
    </div>
</div>

</form>

</body>
</html>