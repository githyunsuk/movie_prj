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


.form-table {
    width: 45%;
    border-collapse: collapse;
     margin-left: auto;
    margin-right: auto;
}

.form-table th {
    width: 120px;
    background-color: #f8f9fa;
    padding: 12px 15px;
    text-align: left;
    border: 1px solid #ddd;
    font-weight: normal;
    font-size: 14px;
}

.form-table td {
    padding: 8px 15px;
    border: 1px solid #ddd;
}

.required:before {
    content: "* ";  
    color: #ff0000;
}

.inputBox {
    padding: 6px 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.btnBox {
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    padding: 6px 10px;
    cursor: pointer;
    border-radius: 3px;
}

.search-button {
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    padding: 5px 10px;
    font-size: 12px;
    cursor: pointer;
}

select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.submit-section {
    text-align: center;
    margin-top: 20px;
}


.btn btn-light {
	border: none;
	background-color: #aaa;
    cursor: pointer;
}

.btn btn-danger {
    background-color: #ff6600;
    color: white;
    border: none;
    padding: 8px 20px;
    font-size: 16px;
    border-radius: 3px;
    cursor: pointer;
}

.btn btn-secondary {
    background-color: #aaa;
    color: white;
    border: none;
    padding: 8px 20px;
    font-size: 16px;
    border-radius: 3px;
    cursor: pointer;
    margin-left: 10px;
}

.radio-group label {
    margin-right: 15px;
}

.submit-delete {
  
    text-align: right;
    margin-top: 20px;
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
<br><br>
<div id="container">

<div class="title">
<h2 style="text-align: center">회원정보수정</h2>

</div>

    <table class="form-table">
      <tr>
        <th class="required" scope="row" style="text-align: center; vertical-align: middle;">프로필</th>
        <td>
          <div style="display: flex; align-items: center;">
            <div>
              <img src="http://localhost/movie_prj/mypage/images/default_img.png" class="profile-img" />
              <input class="form-control" type="file" id="formFile" style="margin-top: 15px;">
              <label style="margin-top: 10px;">JPG, GIF, BMP 파일만 등록 가능합니다.</label>
            </div>
           
          </div>
        </td>
      </tr>

      <tr>
        <th class="required">닉네임</th>
        <td>
          <input type="text" class="inputBox" style="width: 500px;">
          <button class="search-button" style="font-size: 17px">중복확인</button>
          <div style="font-size: 12px; color: #666; margin-top: 5px;">한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)</div>
        </td>
      </tr>

      <tr>
        <th class="required">아이디</th>
        <td>
        	<label>yeonsu2002</label>
        </td>
      </tr>

      <!-- 비밀번호 -->
      <tr>
        <th class="required">비밀번호</th>
        <td>
          <input type="password" class="inputBox" style="width: 200px" id="pass" name="pass">
          <span style="margin-left: 15px;">비밀번호 확인</span>
          <input type="password" class="inputBox" style="width: 200px" id="chkPass" name="chkPass">
          <div style="font-size: 12px; color: #666; margin-top: 5px;">영문, 숫자, 특수문자 조합 8자 이상 입력하세요.</div>
        </td>
      </tr>

      <!-- 이름 -->
      <tr>
        <th class="required">이름</th>
        <td><input type="text" class="inputBox" style="width: 150px" name="name"></td>
      </tr>

      <!-- 성별 -->
      <tr>
        <th>성별</th>
        <td>
          <select style="width: 150px">
            <option>선택하세요</option>
            <option>남자</option>
            <option>여자</option>
          </select>
        </td>
      </tr>

      <tr>
        <th>생년월일</th>
        <td>
          <select style="width: 80px"><option>- 년 -</option></select>
          <select style="width: 70px"><option>- 월 -</option></select>
          <select style="width: 70px"><option>- 일 -</option></select>
        </td>
      </tr>

      <tr>
        <th class="required">이메일</th>
        <td>
          <input type="text" class="inputBox" style="width: 150px">
          <span>@</span>
          <input type="text" class="inputBox" style="width: 150px">
          <select style="width: 150px; margin-left: 8px;">
            <option>- 직접입력 -</option>
            <option>gmail.com</option>
            <option>naver.com</option>
            <option>daum.net</option>
          </select>
        </td>
      </tr>

      <tr>
        <th>휴대폰</th>
        <td>
          <select style="width: 80px">
            <option>- 선택 -</option>
            <option>010</option>
            <option>011</option>
          </select>
          <span>-</span>
          <input type="text" class="inputBox" style="width: 80px">
          <span>-</span>
          <input type="text" class="inputBox" style="width: 80px">
        </td>
      </tr>

      <tr>
        <th class="required">이메일 수신</th>
        <td>
          <input type="radio" id="email_yes" name="email_reception">
          <label for="email_yes">수신동의</label>
          <input type="radio" id="email_no" name="email_reception" checked>
          <label for="email_no">수신거부</label>
        </td>
      </tr>

      <tr>
        <th class="required">SMS 수신</th>
        <td>
          <input type="radio" id="sms_yes" name="sms_reception">
          <label for="sms_yes">수신동의</label>
          <input type="radio" id="sms_no" name="sms_reception" checked>
          <label for="sms_no">수신거부</label>
        </td>
      </tr>
    </table>

    <div class="submit-section" style="margin-top: 20px;">
      <button class="btn btn-danger" style="width:80px">수정</button>
      <button class="btn btn-secendary" style="width:80px">취소</button>
    </div>
     <div class="submit-delete" style="margin-top: 20px;">
      <a href="http://localhost/movie_prj/mypage/remove.jsp" class="btn btn-light" style="right: 50px;" >탈퇴</a>
    </div>
  </div>
	<br><br>
</main>

<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>