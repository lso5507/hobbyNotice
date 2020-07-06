<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="myPw_modify_page.css" rel="stylesheet" />

<title>회원정보 수정</title>

<script type="text/javascript">

window.onload = function(){
	var pw = prompt('비밀번호 입력 : ');
	if(pw != ${mVo.memPw}){
		alert("비밀번호가 틀립니다.");	
		window.history.back();
	}
}

function change(){
	var changeForm = document.changeForm;
	var memPw = '${mVo.memPw}';
	//alert(memPw);
	
	if(changeForm.nowPw.value.length == 0){
		alert("현재 비밀번호를 입력하세요!");
		return;
	}
	if(changeForm.newPw.value.length == 0){
		alert("새 비밀번호를 입력하세요!");
		return;
	}
	if(changeForm.newPw2.value.length == 0){
		alert("비밀번호 확인을 입력하세요!");
		return;
	}
	
	if(changeForm.newPw.value != changeForm.newPw2.value){
		alert("새 비밀번호가 일치하지 않습니다");
		return;
	}
	
	if(memPw != changeForm.nowPw.value){
		alert("현재 비밀번호가 일치하지 않습니다!");
		return;
	}
	
	changeForm.memPw.value = changeForm.newPw.value;
	alert("변경된 비밀번호:" + changeForm.memPw.value)
	
	changeForm.action="memberPw_modify";
	changeForm.submit();
}


</script>

</head>
<body>

<form name="changeForm" action="memberPw_modify" method="post">

<div class="mem_myPw_modify">
	<div class="mem_myPw_modify_title">
		비밀번호 변경
	</div>

	<div class="mem_myPw_modify_pw">
		<span class="mem_myPw_modify_span">현재 비밀번호</span>
		<input type="password" name="nowPw" id="nowPw">
	</div>

	<div class="mem_myPw_modify_newPw">
		<span class="mem_myPw_modify_span">새 비밀번호</span>
		<input type="password" name="newPw" id="newPw">
	</div>

	<div class="mem_myPw_modify_RnewPw">
		<span class="mem_myPw_modify_span">새 비밀번호 확인</span>
		<input type="password" name="newPw2" id="newPw2"> 
	</div>

	<div class="mem_myPw_modify_btn">
		<input type="button" value="비밀번호 변경" id="btnChange" onClick="change()">
		<input type="hidden" name="memPw">
	</div>
</div>

</form>

</body>
</html>
