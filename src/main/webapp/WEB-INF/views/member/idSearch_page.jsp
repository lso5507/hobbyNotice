<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function idSearch(){
	var memEmail = document.idSearchForm.email.value + "@" + document.idSearchForm.emadress.value
	var memName = document.idSearchForm.memName.value;
	
	$.ajax({
		type:"get",
		dataType:"text",
		async:false,
		url:"/hobby/idSearch",
		data:{memEmail:memEmail, memName:memName},
		success:function(data){
			if(data.length != 0){
				alert('아이디 : ' + data);	
			}else{
				alert("검색된 아이디가 없습니다");
			}
		},
		error:function(){
			alert("에러");
		}
	});
	
}

</script>

<div class="mem_idSearch">
	<form name="idSearchForm">
		<div class="mem_idSearch_title">
			<h1 id="idSearch_title">회원계정 찾기</h1>
		</div>
		
		<div class="mem_idSearch_name">
			<span class="mem_idSearch_span">이름</span>
			<input type="text" name="memName" id="memName" placeholder="이름">
		</div>
		
		<div class="mem_idSearch_email">
			<span class="mem_idSearch_span">이메일</span>
			<input type="text" name="email" id="email1"> @
		        <select name="emadress" id="email2">
		            <option value="naver.com">naver.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="gmail.com">gmail.com</option>
		        </select>
		</div>
		
		<div class="mem_idSearch_btn">
			<input type="button" value="아이디 찾기" id="btn_idSearch" onClick="idSearch()" />
			<a href="login_page"><input type="button" id="btn_login" value="로그인 하기"></a>
		</div>
	</form>
</div>