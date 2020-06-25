<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function pwSearch(){
	var pwSearchForm = document.pwSearchForm;
	var memId = pwSearchForm.memId.value;
	var memPwHint = pwSearchForm.memPwHint.value;
	var memPwAns = pwSearchForm.memPwAns.value;
	
	$.ajax({
		type:"post",
		dataType:"text",
		async:false,
		url:"http://localhost:8090/hobby/pwSearch",
		data:{memId:memId, memPwHint:memPwHint, memPwAns:memPwAns},
		success:function(data){
			if(data.length != 0){
				alert('비밀번호 : ' + data);	
			}else{
				alert("입력 정보가 틀립니다");
			}
		},
		error:function(){
			alert("에러");
		}
	});
	
}

</script>

</head>
<body>

<div class="mem_pwSearch">
	<form name="pwSearchForm">
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
			<input type="button" id="memSearch" value="비밀번호 찾기" onclick="pwSearch()">
			<a href="login_page"> <input type="button" id="memLogin" value="로그인 하기"> </a>
		</div>
	</form>
</div>
</body>
</html>