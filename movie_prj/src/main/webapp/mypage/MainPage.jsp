<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="마이페이지 메인"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YEONFLIX</title>
<c:import url="http://localhost/movie_prj/common/external_file.jsp"/>
<style>
.profile-container {
	max-width: 800px;
	margin: 40px auto;
	font-family: 'Arial', sans-serif;
	color: #333;
}

.profile-header {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #eee;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.profile-img {
	width: 120px;
	height: 120px;
	border-radius: 100%;
	background-color: #ddd;
	margin-right: 30px;
}

.profile-info h2 {
	margin: 0;
	font-size: 24px;
	color: #222;
}

.user-id {
	font-size: 14px;
	color: #888;
	margin-left: 10px;
}

.user-nick {
	font-size: 14px;
	color: #888;
	margin-left: 10px;
}

.edit-btn {
	margin-left: 10px;
	font-size: 12px;
	padding: 5px 8px;
	cursor: pointer;
	background-color: transparent;
	border: 1px solid #aaa;
	border-radius: 4px;
}

/* .button-group {
  display: flex;
  justify-content: center;
  gap: 140px;
  margin-top: 30px;
} */

.button-row {
  display: flex;
  justify-content: center;
  gap: 40px;
  margin-top: 30px;
}

.button-row > div {
  width: 250px;
  height: 120px;
  background-color: #F8F8F8;
  border: 1px solid #333;
  border-radius: 1px;
  text-align: center;
  padding: 20px 10px;
  transition: all 0.3s ease;
  box-shadow: 2px 2px 10px rgba(0,0,0,0.05);
  cursor: pointer;
}

.button-row > div:hover {
  background-color: #DC201A;
  color: white;
  transform: translateY(-5px);
  box-shadow: 4px 4px 15px rgba(0,0,0,0.15);
}

.button-row a {
  display: block;
  text-decoration: none;
  color: inherit;
  font-weight: bold;
  font-size: 16px;
}

.button-row .wish label {
  font-weight: normal;
  font-size: 12px;
  color: #666;
  display: block;
  margin-top: 10px;
}
.button-row .watch label {
  font-weight: normal;
  font-size: 12px;
  color: #666;
  display: block;
  margin-top: 10px;
}
.button-row .review label {
  font-weight: normal;
  font-size: 12px;
  color: #666;
  display: block;
  margin-top: 10px;
}

.button-row > div:hover label {
  color: #ccc;
}

 
 
  
.content-container {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	padding: 25px;
	margin-bottom: 30px;
}

.delete {
	display: flex;
	justify-content: right;
	margin-top: 15px;
	gap: 10px; /* 버튼 사이 간격 설정 */
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 5px;
}

#container {
	min-height: 650px;
	margin-top: 30px;
	margin-left: 20px
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/header.jsp"/>
</header>
<main>
<div id="container">
<div class="profile-container">
  <div class="profile-header">
    <img src="http://192.168.10.83/movie_prj/MyPage/images/default_img.png"  class="profile-img" />
    <div class="profile-info">
      <h2>유연수님 <span class="user-id">아이디: yeonsu2002</span><span class="user-nick"> 닉네임:운전연수</span></h2><br>
        <a href="http://localhost/movie_prj/MyPage/loginFrm.jsp">✏️ 수정</a>
   
    </div>
  </div>
<div class="button-row">
 <div class="wish">
    <a href="http://localhost/movie_prj/MyPage/wishMovie.jsp"  >
    ❤️ <br><br>기대되는 영화<br><label>보고싶은 영화들을 미리<br> 담아두고 싶다면?</label></a>
</div>
 <div class="watch">
    <a href="http://localhost/movie_prj/MyPage/WatchMovie.jsp"  >
    📹<br><br>내가 본 영화<br><label>관람한 영화들을 한번에<br>모아 보고 싶다면?</label></a>
 </div>
<div class="review">
    <a href="http://localhost/movie_prj/MyPage/ReviewMovie.jsp"  >
    📄<br><br>내가 쓴 평점<br><label>관람 후 내 감상평을 적어<br> 추억하고 싶다면?</label></a>
</div>   
</div>
<br><br><br>

<div class="header-container">
 <h2>My 예매내역 <span class="badge bg-secondary">0건</span></h2><br>
 <div class="delete">
 	<input type="button" value="선택 삭제" class="btn btn-danger"/>
 </div>
 </div>
 <div class="content-container">
        <div class="empty-message">
               <table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col" width="5%">
        <input class="form-check-input" type="checkbox" id="checkAll">
      </th>
      <th scope="col">제목</th>
      <th scope="col">상영관</th>
      <th scope="col">관람일시</th>
      <th scope="col">결과</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>미션임파서블</td>
      <td>IMAX</td>
      <td>2025.05.20</td>
      <td>예매완료</td>
    </tr>
    <tr>
    <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>야당</td>
      <td>일반관</td>
      <td>2025.04.20</td>
      <td>예매취소</td>
    </tr>
    <tr>
    <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>극한직업</td>
      <td>SCREENX</td>
      <td>2019.01.23</td>
      <td>예매완료</td>
    </tr>
  </tbody>
</table>
        </div>
    </div>
 <br><br><br>
 
 <div class="header-container">
 <h2>My 문의내역 <span class="badge bg-secondary">0건</span></h2>
 <div class="delete">
 <input type="button" value="선택삭제" class="btn btn-secondary"/>
 <input type="button" value="문의하기" class="btn btn-danger"/>
 </div>
 </div>
 <br>
 <div class="content-container">
      <table class="table table-striped table-hover">
  <thead>
    <tr>
      <th scope="col" width="5%">
        <input class="form-check-input" type="checkbox" id="checkAll">
      </th>
      <th scope="col">유형</th>
      <th scope="col">제목</th>
      <th scope="col">등록일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
     <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>Mark</td>
      <td>영화 재미 없어요</td>
      <td>2025.01.01</td>
    </tr>
    <tr>
    <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>Jacob</td>
      <td>예매 취소 어떻게 해요?</td>
      <td>2025.05.01</td>
    </tr>
    <tr>
    <td>
        <input class="form-check-input" type="checkbox">
      </td>
      <td>Mary</td>
      <td>주차장 근처에 있나요?</td>
      <td>2025.05.15</td>
    </tr>
  </tbody>
</table>
    </div>
</div>
</div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/footer.jsp"/>
</footer>
</body>
</html>