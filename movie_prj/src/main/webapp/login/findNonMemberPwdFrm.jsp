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
</style>
<script type="text/javascript">

$(function(){
	$(".pw_btn_red").on("click", function(){
		
	});
	
	
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
	 <div class="pw_title">비회원 비밀번호 찾기</div>
	 <div class="pw_subtitle">비회원 예매 시 입력한 개인정보 입력 후, [인증번호 받기]를 통해 이메일로 전송 받으신 인증번호를 입력해주세요.</div>
	 
	 <div class="pw_panel">
	     <div class="pw_panel_header">개인정보입력</div>
	     
	     <div class="pw_panel_body">
	         <div class="pw_border_line">
	             <div style="margin-bottom: 15px;">모든 항목이 필수 입력사항입니다.</div>
	             
	             <form action="">
		             <div class="pw_field_row">
		                 <div class="pw_field_name">법정생년월일<br>(6자리)</div>
		                 <div>
		                     <input type="text" class="pw_field_input" required maxlength="6"> * * * * * * *
		                 </div>
		             </div>
		             
		             <div class="pw_field_row">
		                 <div class="pw_field_name">이메일주소</div>
		                 <div style="display: flex; align-items: center;">
		                     <input type="email" class="pw_field_input" style="width: 200px;" required>
		                     <button class="pw_verify_btn">인증번호받기</button>
		                 </div>
		             </div>
		             
		             <div class="pw_field_row">
		                 <div class="pw_field_name">인증번호<br>(4자리)</div>
		                 <div>
		                     <input type="password" class="pw_field_input" maxlength="4">
		                 </div>
		             </div>
		         </div>
		         
		         <div class="pw_btn_group">
		             <button style="background-color: white; border: 1px solid #ddd; padding: 10px 20px;">개인정보 다시입력</button>
	<%-- 	         <button class="pw_btn_red" type="button" data-url="${pageContext.request.contextPath }/member?action=getFindPwdFrm">비밀번호 찾기</button> --%>	             
								 <button class="pw_btn_red" type="button" >비밀번호 찾기</button>
		         </div>
	             </form>
	             
	     </div>
	 </div>
	 
	 <div class="pw_info_box">
	     <div class="pw_info_item">
	         <div class="pw_info_label">이용안내</div>
	         <div class="pw_info_content">
	             <div>CGV 고객센터 : 1544-1122</div>
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