<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- <script type="text/javascript" src="event.js"></script> -->
<script type="text/javascript">

// 아이디 중복확인
function idCkeck(){
	document.inputForm.action = "/hobby/idCheck?memId=" + document.inputForm.memId.value;
	document.inputForm.submit();
}


// 회원가입 버튼
function joincheck(){
	var memEmail = document.inputForm.email1.value + "@" + document.inputForm.email2.value
	var memPhone = document.inputForm.smartPhone.value+"-"+document.inputForm.smartPhone1.value+"-"+document.inputForm.smartPhone2.value
	var memBirth = document.inputForm.birth1.value+'년'+document.inputForm.birth2.value+'월'+document.inputForm.birth3.value+'일'
		
	document.inputForm.memEmail.value = memEmail;
	document.inputForm.memPhone.value = memPhone;
	document.inputForm.memBirth.value = memBirth;
	
	document.inputForm.action="create_account";
	document.inputForm.submit();
}   

</script>


</head>
<body>

<form method="post" name="inputForm">
        <table width="1000px">
            <tr>
                <td>
                    <label for="id">아이디
                </td>
                <td>
                    <input type="text" name="memId" id="id" size="20px">
                    <input type="button" id="idCheck" value="중복확인" onClick="idCkeck()"> ${msg }
                </td>
            </tr>
            <tr>
                <td>
                    <label for="pwd">비밀번호
                </td>
                <td>
                    <input type="text" name="memPw" id="pwd" size="20px"> 
                    *영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자
                </td>
            </tr>
            <tr>
                <td>
                    <label for="pwdCheck">비밀번호 확인
                </td>
                <td>
                    <input type="text" name="pwdCheck" id="pwdCheck" size="20px">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="sname">이름
                </td>
                <td>
                    <input type="text" name="memName" id="sname" size="20px"> 
                </td>
            </tr>
            <tr>
                   <td>
                         	생일/성별
                    </td>
                    <td>
                    <script type="text/javascript">
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
                         </script>
                         <input type="radio" name="gender" value="남">남
                         <input type="radio" name="gender" value="여" checked>여
                    </td>
               </tr>
            <tr>
                <td>
                    <label for="home">집주소
                </td>
                <td>
                    <input type="text" name="memRegion" id="home" size="60"> 
                </td>
            </tr>
            <tr>
                <td>
                    <label for="email">이메일
                </td>
                <td>
                    <input type="text" name="email1" id="email" size="10">@
                    <select id="email2">
                        <option value=""></option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                  	  휴대폰
                </td>
                <td>
                    <select id="smartPhone" name="smartPhone">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="019">019</option>
                    </select>
                    -<input type="text" name="smartPhone1" size="5">
                    -<input type="text" name="smartPhone2" size="5">
                    <input type="button" id="check2" value="번호인증">
                </td>
            </tr>
            <tr>
            <tr>
                <td>
                    <label for="news">뉴스메일
                </td>
                <td>
                    <input type="radio" name="news" checked>받습니다.
                    <input type="radio" name="news">받지 않습니다.
                </td>
            </tr>
            <tr>
                <td>
                    <label for="sms">SMS안내(이벤트)
                </td>
                <td>
                    <input type="radio" name="sms" checked>받습니다.
                    <input type="radio" name="sms">받지 않습니다.
                </td>
            </tr>
            <tr>
                <td>
                    <label for="hobby">취미
                </td>
                <td>
                    <input type="checkbox" name="hobby" value="게임" checked>e-sport
                    <input type="checkbox" name="hobby" value="운동">sport
                    <input type="checkbox" name="hobby" value="문화">culture
                </td>
            </tr>
        </table>
        <center><input type="button" id="join" value="회원가입" onClick="joincheck()"></center>
        
        <input type="hidden" name="memEmail" value="">
        <input type="hidden" name="memPhone" value="">
        <input type="hidden" name="memBirth" value="">
        
    </form>

</body>
</html>