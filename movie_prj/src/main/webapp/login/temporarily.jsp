<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="비밀번호 확인 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style>
 #container{ min-height: 650px; margin-top: 30px; margin-left: 20px}
body {
    font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    color: #333;
}
.container {
    max-width: 650px;
    margin: 0 auto;
    padding: 20px;
}
.header {
    text-align: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
}
.header h1 {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 15px;
}
.header p {
    font-size: 16px;
    color: #666;
}
.content {
    background-color: #f9f9f9;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    padding: 40px 20px;
    text-align: center;
    margin-bottom: 30px;
}
.email-icon {
    width: 80px;
    height: 80px;
    margin: 0 auto 30px;
}
.email-message {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 40px;
}
.email-address {
    color: #ff6600;
    font-weight: bold;
}
.login-button {
    display: inline-block;
    background-color: #333;
    color: white;
    padding: 15px 40px;
    text-decoration: none;
    font-size: 16px;
    border-radius: 3px;
    cursor: pointer;
}
.login-button:hover {
    background-color: #555;
}
</style>
<script type="text/javascript">
$(function(){
	
	$(".login-button").on("click", function(){
		location.href="${pageContext.request.contextPath}/login/loginFrm.jsp"
	})
	
});

</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
	<div class="container">
    <div class="header">
      <h1>비밀번호 확인</h1>
      <p>회원님의 개인정보 보호를 위해 관련 정보의 일부가 *로 표시됩니다.</p>
    </div>
    
    <div class="content">
      <div class="email-icon">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" fill="#999">
          <rect x="10" y="20" width="80" height="60" rx="5" ry="5" fill="none" stroke="#999" stroke-width="3"/>
          <path d="M10,25 L50,55 L90,25" fill="none" stroke="#999" stroke-width="3"/>
          <path d="M75,45 L95,65" fill="none" stroke="#999" stroke-width="3"/>
        </svg>
      </div>
      
      <div class="email-message">
        <!--  신*기님의 임시비밀번호가 <span class="email-address">si**************@naver.com</span>으로 발송완료 되었습니다. -->
        ${name}님의 임시비밀번호가 <span class="email-address">${email}</span>으로 발송완료 되었습니다.
      </div>
      
      <button class="login-button">로그인</button>
    </div>
  </div>
</div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>