<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
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
 
.box_member {
  margin-top: 60px;
  padding: 50px;
  border-top: 1px solid #222;
  background: #f8f8f8;
  
  display: flex;
  justify-content: center; /* 수평 정렬 */
  align-items: center;     /* 수직 정렬 */
  height: 400px; /*  .img 요소가 수직 가운데 정렬이 되기 위해서는 일정한 높이가 필요 */
  flex-direction: column;
  align-items: center;
}
user agent stylesheet
div {
  display: block;
  unicode-bidi: isolate;
}
.certification_sec {
  text-align: center;
}
body, input, textarea, select, button, table {
  color: #555;
  font-size: 14px;
  font-family: Arial, nbgr, '나눔바른고딕', '돋음';
  line-height: 24px;
}
body {
  margin: 0;
  padding: 0;
  color: #555;
  font-size: 14px;
	line-height: 24px;
  -webkit-text-size-adjust: none;
}

.img {
	display: flex;
  justify-content: center; /* 수평 정렬 */
  align-items: center;     /* 수직 정렬 */
  height: 200px; /*  .img 요소가 수직 가운데 정렬이 되기 위해서는 일정한 높이가 필요 */
  
 }
 
.b_txt{
	font-size: 20px;
	margin: 5px;
}
.s_txt{
	font-size: 12px;
	text-align: center;
}

#findIdBtn, #goLoginBtn  {
	min-width: 128px;
	border: 1px solid #333;
}

</style>
<script type="text/javascript">
$(function(){
	
	$("#findIdBtn").on("click", function(){
		const userId = "<c:out value='${userId}'/>";
		location.href="${pageContext.request.contextPath}/login/findMemberPwdFrm.jsp?userId="+userId;
	});
	
	$("#goLoginBtn").on("click", function(){
		location.href="${pageContext.request.contextPath}/login/loginFrm.jsp";
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

<div class="box_member">
	<div class="certi_txt check">
		<span class="img"><img src="${pageContext.request.contextPath }/common/img/alreadyMember.jpg" style="width: 150px; height: 150px; border-radius: 5em;" ></span>
		<p class="b_txt" ><strong class="em" style="color: #EE7C00"><c:out value="${name}"/></strong>님! 이미 YEONFLIX 회원으로 등록되어 있습니다.</p>			
		<p class="s_txt">회원 아이디<em>(<c:out value="${userId}" />)</em>로 로그인을 진행해 주세요.</p>
	</div>
	<div class="btn_sec">
		<!-- 간편인증 시  -->
		<input type="button" id="findIdBtn" class="btn btn-white btn-sm" value="비밀번호 찾기" style="margin-top: 30px;" >
		<input type="button" id="goLoginBtn" class="btn btn-dark btn-sm" value="로그인" style="margin-top: 30px;">
	</div>
				
</div>
</div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>