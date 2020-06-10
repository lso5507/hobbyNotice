<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

<script type="text/javascript">

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

	<h2>비밀번호 변경</h2>

	<form name="changeForm" action="memberPw_modify" method="post">

		현재 비밀번호 : <input type="password" name="nowPw"><br> <br>
		새 비밀번호 : <input type="password" name="newPw"><br> <br>
		새 비밀번호 확인 : <input type="password" name="newPw2"> <br> <br>
		<input type="button" value="비밀번호 변경" onClick="change()"> <input
			type="hidden" name="memPw">

	</form>


</body>
</html>
