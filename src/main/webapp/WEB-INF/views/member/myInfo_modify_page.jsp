<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<script type="text/javascript">

function change(){
	var changeForm = document.changeForm;
	
	if(changeForm.memPhone.value.length == 0){
		alert("휴대폰 번호를 입력하세요!!");
		changeForm.memPhone.focus();
		return;
	}
	if(changeForm.memEmail.value.length == 0){
		alert("이메일 입력하세요!!");
		changeForm.memEmail.focus();
		return;
	}
	
	
	changeForm.action="member_modify";
	changeForm.submit();
}


</script>

</head>
<body>

<h2>회원정보 수정</h2>

<form name="changeForm" action="member_modify" method="post">

이름 : ${mVo.memName }<br><br>

휴대폰 : <input type="text" name="memPhone" placeholder="${mVo.memPhone }"><br><br>

이메일 : <input type="text" name="memEmail" placeholder="${mVo.memEmail }"><br><br>

지역 : <input type="text" name="memRegion" placeholder="${mVo.memRegion }">  
     <input type="text" name="memCity" placeholder="${mVo.memCity }"><br><br>

생일 : <input type="text" name="memBirth" placeholder="${mVo.memBirth }"><br><br>

<input type="button" value="변경" onClick="change()">

</form>


</body>
</html>
