<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<script type="text/javascript">

var memEmail = document.idSearchForm.email.value + "@" + document.idSearchForm.email.value.emadress 
document.idSearchForm.memEmail.value = memEmail;

</script>

</head>
<body>

<div class="find">
    <form id="idSearchForm" method="post" action="idSearch">
      <h1>회원계정 찾기</h1>
        <fieldset>
        
          <legend>아이디 찾기</legend>
            <table>
              <tr>
                <td>이름</td>
                <td><input type="text" size="35" name="memName" placeholder="이름"></td>
              </tr>
              <tr>
                <td>이메일</td>
                <td><input type="text" name="email">@<select name="emadress">
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="gmail.com">gmail.com</option></select></td>
              </tr>
            </table>
            
          <input type="hidden" name="memEmail" value="">
          <input type="submit" value="아이디 찾기" />
          
      </fieldset>
    </form>
    
    
  </div>
  <div class="find">
      <form method="post" action="member_find_pw.php">
        <fieldset>
          <legend>비밀번호 찾기</legend>
            <table>
              <tr>
                <td>아이디</td>
                <td><input type="text" size="35" name="userid" placeholder="아이디"></td>
              </tr>
            </table>
          <input type="submit" value="비밀번호 찾기" />
      </fieldset>
    </form>
  </div>

</body>
</html>