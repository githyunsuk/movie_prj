<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
   	<link rel="stylesheet" href="http://localhost/movie_prj/common/css/reset.css">
    <link rel="stylesheet" href="http://localhost/movie_prj/common/css/style.css">
</head>
<body>
<div class="headerTop">
	<h1 class="logo"><a href=""><img src="http://localhost/movie_prj/common/img/logo.png" alt=""></a></h1>
 	<div class="member">
		<ul class=login_menu>
		<li><a href=""><img src="http://localhost/movie_prj/common/img/loginPassword.png" alt="">로그인</a></li>
		<li><a href=""><img src="http://localhost/movie_prj/common/img/loginJoin.png" alt="">회원가입</a></li>
		<li><a href=""><img src="http://localhost/movie_prj/common/img/loginMember.png" alt="">마이페이지</a></li>
		<li><a href=""><img src="http://localhost/movie_prj/common/img/loginCustomer.png" alt="">고객센터</a></li>
		</ul>
	 </div>
</div>
<nav>
<div class="nav_wrap">
	<ul class="nav_menu">
		<li><a href="">영화</a></li>
		<li><a href="">극장</a></li>
		<li><a href=""><strong>예매</strong></a></li>
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
</body>
</html>