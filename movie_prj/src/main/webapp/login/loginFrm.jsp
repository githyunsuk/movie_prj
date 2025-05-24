<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="loginPage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<link rel="stylesheet" href="http://localhost/movie_prj/login/css/cgv_login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	let loginFrmHtml = null;
	
	$(function(){
		loginFrmHtml = $(".box-login.login_1408").html(); //DOM이 모두 준비된 후에 백업
		
		$("#form2_capcha").on("submit", function(event){
			event.preventDefault(); //폼 기본전송 x 
		});
		
		$("#memberLoginBtn").on("click", function(event){
			event.preventDefault();
			$(".box-login.login_1408").empty().html(loginFrmHtml); //저장해놨던 원래html불러옴
			$(".sect-loginad").show();
			$(".box-login.login_1408").css("width", "");
		});
		
		$("#nonMemberLoginBtn").on("click", function(event){
			event.preventDefault();
			nonMemberLoginFrm();
			$(".sect-loginad").show();
			$(".box-login.login_1408").css("width", "");//원래대로
		});
		
		$("#nonMemberCheckReservationBtn").on("click", function(event){
			event.preventDefault();
			nonMemberCheckReservationFrm();
			$(".sect-loginad").hide(); //광고숨김
			$(".box-login.login_1408").css({width:"900px", height:"680px"});  //사이즈조절
		});
		
		$(document).on("click", ".guest-btn.guest-btn-primary", function(){
			alert("입력하신 정보와 일치하는 예매내역이 없습니다.");
			//추후에 ajax로 조회해서, modal창으로 조회 출력하기 
		});
		
		
		
		liClassChangeToOn(); //뭐였는지 까먹었지만 css관련 함수 
		
		refreshCaptcha(); //자동입력방지문자 갱신 함수 
		
		login(); //로그인 관련 모음 함수 
		

		
		
	});//--------------------------------------------------------------------------------ready
	
	function nonMemberLoginFrm(){
		//비회원 예매 버튼 클릭시
		$(".box-login.login_1408").empty();
		
		let nonMemberLoginFrm = `
			<form id="nonMemRevFrm" method="post" action="${pageContext.request.contextPath}/login/controller/nonMemReservation.jsp">
			  <fieldset>
			    <legend>개인정보 입력(이메일,법정생년월일,비밀번호)</legend>
			    <br>
			    <div class="info_notice">
			      <p>개인정보를 잘못 입력하시면 예매내역 확인/취소 및 티켓 발권이 어려울 수 있으니, 입력하신 정보를 다시 한번 확인해주시기 바랍니다.</p>
			    </div>
			    
			    <div class="form_row">
			      <label for="birth">법정생년월일(8자리)</label>
			      <input type="text" id="birth" name="birth" maxlength="8" />
			    </div>
			    
			    <div class="form_row">
			      <label for="email">이메일 주소</label>
			      <div class="email_wrap">
			        <input type="text" id="emailId" name="emailId" placeholder="아이디" />
			        <span>@</span>
			        <select id="emailDomain" name="emailDomain">
			          <option value="">이메일 선택</option>
			          <option value="gmail.com">gmail.com</option>
			          <option value="naver.com">naver.com</option>
			          <option value="daum.net">daum.net</option>
			          <option value="custom">직접 입력</option>
			        </select>
			        <input type="text" id="emailCustomDomain" name="emailCustomDomain" style="display:none;" placeholder="직접 입력" />
			        <button type="button" class="btn_sub" style="width: 112px">인증번호받기</button>
			      </div>
			    </div>
			    
			    <div class="form_row">
			      <label for="auth">인증번호 (4자리)</label>
			      <input type="text" id="auth" name="auth" maxlength="4" />
			      <button type="button" class="btn_sub">인증확인</button>
			    </div>
			    
			    <div class="form_row">
			      <label for="pw">비밀번호(4자리)</label>
			      <input type="password" id="pw" name="pw" maxlength="4" />
			    </div>
			    
			    <div class="form_row">
			      <label for="pw_confirm">비밀번호확인</label>
			      <input type="password" id="pw_confirm" name="pw_confirm" maxlength="4" />
			    </div>
			    
			    <div class="form_submit">
			      <button type="submit" class="btn_submit">비회원 예매하기</button>
			    </div>
			  </fieldset>
			</form>
			`;
		
		$(".box-login.login_1408").html(nonMemberLoginFrm);
		
	}
	
	function nonMemberCheckReservationFrm(){
		//비회원 예매확인 버튼 클릭시
		$(".box-login.login_1408").empty();
		let nonMemberCheckReservationFrm =`
			<div class="guest-reservation" style="height: 640px;">
		    <div class="guest-container">
		      <h2 class="guest-title">비회원 예매 확인</h2>
		      
		      <p class="guest-info-text">비회원으로 예매하신 고객님은 개인정보(법정생년월일, 이메일 주소, 비밀번호(4자리))를 입력해 주세요.</p>
		      
		      <div class="guest-tab-container">
		        <div class="guest-tab-header">
		          <div class="guest-active">비회원 예매확인</div>
		          <div>비회원 예매 비밀번호 찾기</div>
		        </div>
		        
		        <div class="guest-tab-content">
		          <div class="guest-tab-left">
		            <div class="guest-form-row">
		              <p>모든 항목은 필수 입력사항입니다.</p>
		            </div>
		            
		            <div class="guest-form-row">
		              <label>법정생년월일(8자리)</label>
		              <input type="text" maxlength="8" placeholder="예) 19900101">
		            </div>
		            
		            <div class="guest-form-row">
		              <label>이메일주소</label>
		              <div class="guest-email-wrap">
		                <input type="text" placeholder="아이디">
		                <span>@</span>
		                <select>
		                  <option value="">선택</option>
		                  <option value="gmail.com">gmail.com</option>
		                  <option value="naver.com">naver.com</option>
		                  <option value="daum.net">daum.net</option>
		                  <option value="custom">직접입력</option>
		                </select>
		              </div>
		            </div>
		            
		            <div class="guest-form-row">
		              <label>비밀번호(4자리)</label>
		              <input type="password" maxlength="4">
		            </div>
		            
		            <div class="guest-form-row guest-text-center">
		              <button class="guest-btn guest-btn-primary">비회원 예매확인</button>
		            </div>
		          </div>
		          
		          <div class="guest-tab-right">
		            <p>비회원 예매 시, 입력한 이메일주소로 SMS인증을 하면 비회원 예매 비밀번호를 찾으실 수 있습니다.</p>
		            
		            <div class="guest-divider"></div>
		            
		            <div class="guest-text-center" style="margin-top: 30px;">
		              <button class="guest-btn guest-btn-outline"><a href="http://localhost/movie_prj/login/findNonMemberPwdFrm.jsp"> 이메일로 인증번호 받기</a></button>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		`;
		$(".box-login.login_1408").html(nonMemberCheckReservationFrm);
	}

	/* 로그인, 비회원예매 버튼 클릭시 클래스값 on 제거/추가 */
	function liClassChangeToOn(){
		$(".tab-menu-round li").on("click", function(e){
			e.preventDefault();
			$(".tab-menu-round li").removeClass('on');
			$(this).addClass('on');
		});
	}
	 
	/* 자동입력 방지문자 리프레쉬 버튼 클릭 */
	function refreshCaptcha(){
		let refreshNumber = "";
		while(refreshNumber.length < 6){
			let randomNumb = Math.floor(Math.random() * 10);
			refreshNumber = refreshNumber + randomNumb;
		}
		$(".refresh-number").val(refreshNumber);
	}
	
	/* 로그인 함수 */
	function login(){
		let loginBtn = document.getElementById("submit");
		
		//자동입력방지문자 확인 
		loginBtn.addEventListener("click", function(e){
			e.preventDefault(); //제출 기본동작 방지
			
			let txtCaptcha = $("#txtCaptcha").val();
			let refreshNumber = $(".refresh-number").val();
			
			if(txtCaptcha !== refreshNumber){
				alert("자동입력 방지 문자를 확인 후 입력해주세요");
				refreshCaptcha(); //갱신 
				return; //까먹지마라 
			} 
			
			//로그인 
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/login/controller/loginProcess.jsp",
				data:$("#form2_capcha").serialize(), /* memberId, memberPwd */
				success:function(response){
					if(response.trim() === "success"){
						alert("로그인 성공");
	          location.href = "${pageContext.request.contextPath}/index.jsp"; 
					} else if (response.trim() === "fail"){
	          alert("아이디 또는 패스워드가 맞지 않습니다. 확인 후 입력해주세요.");
	          $("#txtUserId, #txtPwd1").val("");
	          refreshCaptcha();
	        }
				},
				error:function(xhr, status, error){
			    console.log("에러 상태 코드:", xhr.status);
			    console.log("에러 응답:", xhr.responseText);
			    alert("서버 오류(" + xhr.status + "): " + error);
	      }
				
			});
			
		});
		
		
	}
	
	
</script>

</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
  <div class="wrap-login">
    <div class="sect-login">
      <ul class="tab-menu-round">
        <li class="on" id="memberLoginBtn">
          <a href="http://localhost/movie_prj/login/loginFrm.jsp">로그인</a>
        </li>
        <li id="nonMemberLoginBtn">
          <a href="#" >비회원 예매</a>
        </li>
        <li  id="nonMemberCheckReservationBtn">
          <a href="#">비회원 예매확인</a>
        </li>
      </ul>
      
      <div class="box-login login_1408">
        <h3 class="hidden">회원 로그인</h3>
        <div class="loginFormDiv">
	        <form id="form2_capcha" method="post" action="" novalidate="novalidate">
	          <fieldset>
	<!--        <legend style="display: none">회원 로그인</legend> -->
	            <div class="txt_wrap">               
	              <h3></h3>
	              <p>정보보호를 위해 아이디, 비밀번호와 함께 <br>자동 입력 방지 문자를 입력하셔야 합니다.</p> 
	            </div>
	            
	            <div class="login">
	              <input type="text" title="아이디" id="txtUserId" name="memberId" value="" placeholder="아이디">
	              <input type="password" title="패스워드" id="txtPwd1" name="memberPwd" placeholder="비밀번호">
	            </div>
	            
<!-- 캡차 영역 시ㅣ작-->
	            <div class="captcha">
	              <div class="captcha_box" id="image_captcha">
	                <span class="captcha_img">
	                  <div id="imageCatpcha">
	                    <!-- <img src="https://www.cgv.co.kr/user/login/find-account-captcha-random.aspx?result=7UP1lgj71DlzKGQbmEe1hw%3D%3D"> -->
	                   	<input type="text" style="border-color: white;" class="refresh-number" value="" readonly oncopy="return false;">
	                  </div>
	                </span>
	                <a href="javascript:refreshCaptcha();" id="captchaReLoad" class="btn_refresh"><span class="sp">새로고침</span></a>
	              </div>
	              
	              <div class="input_row" id="chptcha_area">
	                <span class="input_box">
	                  <label for="chptcha" class="lbl" id="label_chptcha_area">자동입력 방지문자</label>
	                  <input type="text" id="txtCaptcha" name="txtCaptcha" placeholder="자동입력 방지문자 (앵간하면 captcha쓰자)" class="int">
	                </span>
	              </div>
	            </div>
<!-- 캡차 영역 끝-->
	            
	            <button type="button" id="submit" title="로그인"><span>로그인</span></button>
	            <div class="save-id"><input type="checkbox" id="save_id"><label for="save_id">아이디 저장</label></div>
	            <div class="login-option">
	              <a href="http://localhost/movie_prj/login/isMemberChk.jsp" >아이디 찾기</a>
	              <a href="http://localhost/movie_prj/login/findMemberPwdFrm.jsp" >비밀번호 찾기</a>
	            </div>
	            
		          <div class="naver-login">
		            <a href="javascript:getNaverLoginURL();" class="btn_loginNaver">
		              <img src="https://img.cgv.co.kr/image_gt/login/btn_loginNaver.jpg" alt="네이버 로그인">
		            </a>
		          </div>
	          </fieldset>
	        </form>
        </div><!-- loginFormDiv -->
      </div><!-- box-login login_1408 -->
      
    </div>
    
    <div class="sect-loginad" style="background:#d2cbbe; width: 350px;">
      <div>
      	<a href="https://sepay.org/spm/join?regSiteCode=OZ&ctgCode=1&subCode=1" target="_blank">
        	<img src="http://localhost/movie_prj/common/img/loginAd.png" width="350" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Login_bigbanner" id="Login_bigbanner"></iframe>
        </a>
      </div>
    </div>
  </div>
</div>
</main>
<script type="text/javascript">
/* 비회원예매확인 js 참고하고, 수정하자. */
// 탭 전환 기능 
const guestTabHeaders = document.querySelectorAll('.guest-tab-header div');

guestTabHeaders.forEach(header => {
  header.addEventListener('click', () => {
    guestTabHeaders.forEach(h => h.classList.remove('guest-active'));
    header.classList.add('guest-active');
  });
});

// 이메일 직접 입력 기능
const guestEmailSelect = document.querySelector('.guest-email-wrap select');
const guestEmailInput = document.querySelector('.guest-email-wrap input:first-child');

guestEmailSelect.addEventListener('change', function() {
  if (this.value === 'custom') {
    const customInput = document.createElement('input');
    customInput.type = 'text';
    customInput.placeholder = '직접입력';
    
    if (document.querySelector('.guest-email-wrap input:nth-child(4)')) {
      document.querySelector('.guest-email-wrap input:nth-child(4)').remove();
    }
    
    this.parentNode.insertBefore(customInput, this.nextSibling);
  } else if (document.querySelector('.guest-email-wrap input:nth-child(4)')) {
    document.querySelector('.guest-email-wrap input:nth-child(4)').remove();
  }
});
</script>

<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>