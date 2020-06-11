<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="myInfo_modify_page.css" rel="stylesheet" />

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
<div class="mem_myInfo_modify">
<h1 id ="mem_myInfo_modify_title">회원정보 수정</h1>

	<form name="changeForm" action="member_modify" class="member_modify" method="post">
		<div class="mem_myInfo_modify_name">
		<span class="mem_myInfo_modify_span">이름 : </span>  
		<span id="memSpan"> ${mVo.memName }</span>
		</div>
		
		<div class="mem_myInfo_modify_phone">
		<span class="mem_myInfo_modify_span">휴대폰 :</span>
		<input type="text" name="memPhone" id="memPhone" placeholder="${mVo.memPhone }">
		</div>
		
		<div class="mem_myInfo_modify_email">
		<span class="mem_myInfo_modify_span">이메일 : </span>
		<input type="text" name="memEmail" id="memEmail" placeholder="${mVo.memEmail }">
		</div>
		
		<div class="mem_myInfo_modify_city">
		<span class="mem_myInfo_modify_span">지역 : </span>
		<input type="text" name="memRegion" id="memRegion" placeholder="${mVo.memRegion }">  
		<input type="text" name="memCity" id="memCity" placeholder="${mVo.memCity }">
		</div>
		
		<div class="mem_myInfo_modify_brith">
		<span class="mem_myInfo_modify_span">생일 :</span>
		<input type="text" name="memBirth" id="memBirth" placeholder="${mVo.memBirth }">
		</div>
		
		<div class="mem_myInfo_modify_btn">
		<input type="button" value="변경" id="memChange" onClick="change()">
		</div>
	</form>

</div>
</body>
</html>
