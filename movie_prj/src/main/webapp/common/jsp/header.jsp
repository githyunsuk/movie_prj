<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="headerTop">
	<h1 class="logo"><a href="http://localhost/movie_prj/index.jsp"><img src="http://localhost/movie_prj/common/img/logo.png" alt=""></a></h1>
 	<div class="member">
		<ul class=login_menu>
		<%
			boolean flag = new Random().nextBoolean();
			pageContext.setAttribute("flag", flag);
		%>
		<c:choose>
  	    <c:when test="${flag}">
      	<li><a href=""><img src="http://localhost/movie_prj/common/img/loginPassword.png" alt="">로그인</a></li>
      	<li><a href=""><img src="http://localhost/movie_prj/common/img/loginJoin.png" alt="">회원가입</a></li>
        </c:when>
        <c:otherwise>
        <li><a href=""><img src="http://localhost/movie_prj/common/img/loginPassword.png" alt="">로그아웃</a></li>
        </c:otherwise>
        </c:choose>
		<li><a href="http://localhost/movie_prj/mypage/MainPage.jsp"><img src="http://localhost/movie_prj/common/img/loginMember.png" alt="">마이페이지</a></li>
		<li><a href=""><img src="http://localhost/movie_prj/common/img/loginCustomer.png" alt="">고객센터</a></li>
		</ul>
	 </div>
</div>
<nav>
<div class="nav_wrap">
	<ul class="nav_menu">
		<li><a href="">영화</a></li>
		<li><a href="">극장</a></li>
		<li><a href="http://localhost/movie_prj/reservation/reservation.jsp"><strong>예매</strong></a></li>
	</ul>

	<div class="search_wrap">
	<form action="" name="searchtxt" id="searchtxt">
		<fieldset>
		<legend class = 'xx'> 검색창</legend>
		<label for="text_search" class="xx">입력창</label> 
		<input type="text" id="text_search">
		<button class="fixedbtn_search">검색</button>
		</fieldset>
	</form>
 	</div>
</div>
</nav>  
