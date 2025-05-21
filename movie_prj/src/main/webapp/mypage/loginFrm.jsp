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
 #container{ min-height: 950px; margin-top: 30px; margin-left: 20px}
 

main {
    display: flex;
    justify-content: center; /* 가로 가운데 */
    align-items: center;     /* 세로 가운데 */
    min-height: 100vh;       /* 뷰포트 높이만큼 */
    padding: 20px;
    box-sizing: border-box;
    background-color: #333;
  }
  
  
.mb-5{ font-size:35px}
 
 

</style>
<script type="text/javascript">
</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
        <div class="card border-0 shadow-sm rounded-4">
          <div class="card-body p-3 p-md-4 p-xl-5 mt-5">
            <div class="row">
              <div class="col-12">
                <div class="mb-5">
                  <h2 style="text-align: center;">개인정보변경</h2>
                  
                </div>
              </div>
            </div>
            
            <form name="loginFrm">
              <div class="row gy-3 overflow-hidden">
                
                <div class="col-12">
                  <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="password" id="password">
                    <label for="password" class="form-label">Password</label>
                  </div>
                </div>
                
                <div class="col-12">
                  <div class="d-grid">
                   <a href="http://localhost/movie_prj/mypage/edit.jsp" class="btn btn-danger">Login</a>
                  </div>
                </div>
              </div>
            </form>
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