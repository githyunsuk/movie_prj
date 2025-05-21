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
  
  #container {
  min-height: 650px;
  margin: 30px auto; /* 위아래 여백 + 가운데 정렬 */
  max-width: 1200px;  /* 최대 너비 제한 */
  display: flex;
}

/* 좌측 사이드바 스타일 */
.sidebar {
  width: 250px;
  border-right: 1px solid #e0e0e0;
  padding: 0 10px;
}

/* 우측 콘텐츠 영역 */
.content-area {
  flex: 1;
  padding: 20px;
}
 
 
 
 .profile {
 display: flex;
  flex-direction: column;      /* 세로로 쌓기 */
  align-items: center;         /* 중앙 정렬 */
  text-align: center;
 }
 

 
 .profile-info {
   display: flex;
   flex-direction: column;
   justify-content: center;
 }
 
 
 .profile-id {
   display: block;              /* 줄바꿈 */
  margin-top: 3px;             /* 각 라인 간격 */
  font-size: 14px;
  color: gray;
 }
 
 
 
 
 .content-area {
   margin-left: 270px;
   padding: 20px;
 }
 

 
 .empty-content {
   text-align: center;
   padding: 40px;
   background-color: white;
   border-radius: 5px;
   box-shadow: 0 2px 5px rgba(0,0,0,0.1);
 }
 
 
 .profile-img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  margin-bottom: 10px; 
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
  <div class="sidebar">
    <!-- 프로필 섹션 -->
    <div class="profile">
        <!-- 프로필 이미지 또는 아이콘 -->
        <img src="http://localhost/movie_prj/common/img/default_img.png"  class="profile-img" />
      <div class="profile-info">
        <h2>유연수님 </h2>
        <span class="profile-id">아이디: yeonsu2002</span>
        <span class="profile-id">닉네임: 운전연수</span>
      </div>
    </div>
    <br><br>
   <a href="http://localhost/movie_prj/mypage/wishMovie.jsp" class="btn btn-light" style="width:230px; height:50px">기대되는 영화</a>
<a href="http://localhost/movie_prj/mypage/WatchMovie.jsp" class="btn btn-light" style="width:230px; height:50px">내가 본 영화</a>
<a href="http://localhost/movie_prj/mypage/ReviewMovie.jsp" class="btn btn-danger" style="width:230px; height:50px">내가 쓴 평점</a>
  </div>
  
  <div class="content-area">
    <div class="section-header">
      <h3 class="section-title">내가 쓴 평점 <span class="count-badge">0</span></h3>
    </div>
    
    <div class="empty-content">
      <p>내가 쓴 평점이 없습니다.</p>
      <a href="http://localhost/movie_prj/mypage/WatchMovie.jsp" class="btn btn-danger mt-3">내가 본 영화</a>
    </div>

  </div>
</div>

</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>