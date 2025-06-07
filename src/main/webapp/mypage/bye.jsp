<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.yeonflix.member.MemberService"%>
<%@page import="kr.co.yeonflix.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MemberDTO user = (MemberDTO) session.getAttribute("loginUser");

    if (user != null) {
        MemberService ms = new MemberService();
        boolean result = ms.modifyIsActive(user.getUserIdx(), "N");

        // 세션 종료 (로그아웃)
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style>
 #container{ min-height: 650px; margin-top: 30px; margin-left: 20px}
  .title{

	font-size: 50px;
	margin: 20px auto;
	}
 
 
 .container {
    max-width: 800px;
    margin:20px auto;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
}
 

.delete-form {
    width: 120px;
    background-color: #f8f9fa;
    padding: 12px 15px;
    text-align: left;
    border: 1px solid #ddd;
    font-weight: normal;
    font-size: 14px;
}

.delete-form {
    padding: 8px 15px;
    border: 1px solid #ddd;
}

.card-title{
		font-size:20px;
		padding: 15px 15px;
	}
.card-sec{
		font-size:13px;
		padding: 35px 12px;
}
 
 


</style>
<script type="text/javascript">
</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
	<!-- <div class="title">
    	<h2 style="text-align: center;">회원탈퇴완료</h2>
    </div>
     -->
    <div class="card text-center">
    
  <div class="card-body">
    <img src="http://localhost/movie_prj/common/img/%EA%B0%80%EC%A7%80%EB%A7%9D.gif"/>
    <h5 class="card-title">안녕히 가세요</h5>
  
    <input type="button" value="회원가입" class="btn btn-danger" style="width: 100px"/>
    
    
  </div>
</div>

</div>


</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>