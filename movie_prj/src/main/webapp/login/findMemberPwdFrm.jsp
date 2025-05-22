<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style>
 #container{ min-height: 650px; margin-top: 30px; margin-left: 20px}
 
.pw-container {
    max-width: 950px;
    margin: 0 auto;
    padding: 20px;
} 
.pw_btn_red {
    background-color: #f14d4d;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 3px;
}
.pw_title {
    margin-bottom: 10px;
    font-size: 16px;
    font-weight: bold;
}
.pw_subtitle {
    color: #666;
    font-size: 14px;
    margin-bottom: 20px;
}
.pw_panel {
    background-color: #f9f9f9;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 3px;
}
.pw_panel_header {
    background-color: #eee;
    padding: 12px 20px;
    margin: -20px -20px 20px -20px;
    font-weight: bold;
}
.pw_panel_body {
    padding: 20px;
    background-color: white;
    border-radius: 3px;
}
.pw_field_row {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}
.pw_field_row:last-child {
    margin-bottom: 0;
}
.pw_field_name {
    width: 150px;
    font-size: 14px;
}
.pw_field_input {
    padding: 8px;
    border: 1px solid #ddd;
    width: 300px;
}
.pw_btn_group {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    gap: 10px;
}
.pw_border_line {
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
}
.pw_info_box {
    background-color: #f7f5e9;
    padding: 20px;
    font-size: 14px;
    margin-top: 30px;
}
.pw_info_item {
    display: flex;
    margin-bottom: 10px;
}
.pw_info_label {
    width: 100px;
    font-weight: bold;
}
.pw_info_content {
    flex: 1;
}
.pw_verify_btn {
    display: inline-block;
    padding: 6px 10px;
    background-color: #f14d4d;
    color: white;
    border: none;
    cursor: pointer;
    margin-left: 10px;
    border-radius: 3px;
}

#email-error{
	display: flex;
	justify-content: center;
	font-size: 12px;
	color: red;
	width: 480px;
}
 
</style>
<!-- <link rel="stylesheet" href="http://localhost/movie_prj/login/css/findMemberPwdFrm.css"> 왜 안되냐-->
<script type="text/javascript">

$(function(){
	
	
	
	
});

</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
  <div id="container">
    <div class="pw-container">
      <div class="pw_title">회원 비밀번호 찾기</div>
      <div class="pw_subtitle">
        회원 가입 시 입력한 개인정보 입력 후, [인증번호 받기]를 통해 이메일로 전송 받으신 인증번호를 입력해주세요.
      </div>

      <div class="pw_panel">
        <div class="pw_panel_header">개인정보입력</div>

        <form action="${pageContext.request.contextPath }/login/controller/findMemPwd.jsp" method="post" name="frm" id="frm">
          <div class="pw_panel_body">
            <div class="pw_border_line">
              <div style="margin-bottom: 15px;">모든 항목이 필수 입력사항입니다.</div>

              <div class="pw_field_row">
                <div class="pw_field_name">아이디</div>
                <div>
                  <input type="text" class="pw_field_input" name="userId" value="${param.userId}" >
                </div>
              </div>

              <div class="pw_field_row">
                <div class="pw_field_name">법정생년월일<br>(6자리)</div>
                <div>
                  <input type="text" class="pw_field_input" name="birth" required maxlength="6"> * * * * * * *
                </div>
              </div>

              <div class="pw_field_row">
                <div class="pw_field_name">이메일주소</div>
                <div style="display: flex; align-items: center;">
                  <input type="email" class="pw_field_input" name="email" style="width: 200px;" required>
                  <button class="pw_verify_btn" type="button">인증번호받기</button>
                </div>
              </div>
              
              <div class="pw_field_row wrongEmail" style="display: none;">
	              <div class="error-message" id="email-error" >올바른 이메일 주소를 입력해주세요.</div>
              </div>

              <div class="pw_field_row">
                <div class="pw_field_name">인증번호<br>(4자리)</div>
                <div>
                  <input type="password" id="verificationNumb" class="pw_field_input" name="verifiedCode" maxlength="4" required>
                </div>
              </div>
            </div>
            
						<script type="text/javascript">
							//이메일검증
							function validateEmail(email) {
				        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				        return regex.test(email);
					    }
						
							$(".pw_verify_btn").on("click", function(){
								const email = $("input[name='email']").val().trim();
								//잘못된 이메일 주소일 때
								if(!validateEmail(email)){
									$(".pw_field_row.wrongEmail").css("display", "block");
									return;
								}
								//옳바른 이메일 주소일 때
								
								
							});
							$("input[name='email']").on("input", function(){
								$(".pw_field_row.wrongEmail").css("display", "none");
							});
							
							
						</script>            
            <!--  
	           		<div class="form-group" id="verification-form" style="display: none;">
									<div class="success-message" id="email-sent-success">
									입력하신 이메일로 인증번호가 발송되었습니다.
									</div>
									<label for="verification-code">인증번호 <span class="timer" id="verification-timer">05:00</span></label><br>
									<div class="input-group">
										<input type="text" id="verification-code" placeholder="인증번호 6자리 입력" maxlength="6">
										<button id="verify-code" type="button">확인</button>
									</div>
									<div class="error-message" id="verification-error">인증번호가 일치하지
										않습니다.</div>
								</div>
						
								<div class="form-group" id="verification-success"
									style="display: none;">
									<div class="success-message" style="display: block;">이메일 인증이
										완료되었습니다.</div>
								</div>
            -->

            <div class="pw_btn_group">
              <button style="background-color: white; border: 1px solid #ddd; padding: 10px 20px;" type="reset">
                개인정보 다시입력
              </button>
              <button id="findPwdBtn" class="pw_btn_red" type="submit">비밀번호 찾기</button>
            </div>
          </div>
        </form>
      </div>

      <div class="pw_info_box">
        <div class="pw_info_item">
          <div class="pw_info_label">이용안내</div>
          <div class="pw_info_content">
            <div>yeonflix 고객센터 : 1544-1122</div>
            <div>상담 가능 시간 : 월-금 09:00~18:00 (이 외 시간은 자동 응답 안내 가능)</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>