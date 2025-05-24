<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 정보입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
#container{ min-height: 650px; margin-top: 30px; margin-left: 20px}

/* Adding modern and consistent styling for join3 page */
.join3_container {
    background-color: #f8f9fa;
    border-radius: 12px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
    width: 100%;
    max-width: 600px;
    padding: 40px 50px;
    margin: 50px auto;
    transition: all 0.3s ease;
}

.join3_container:hover {
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

.join3_title {
    text-align: center;
    margin-bottom: 35px;
    font-size: 32px;
    color: #333;
    font-weight: 600;
}

.join3_steps {
    display: flex;
    justify-content: space-between;
    margin-bottom: 40px;
    position: relative;
}

.join3_steps::before {
    content: '';
    position: absolute;
    top: 35px;
    left: 15%;
    right: 15%;
    height: 3px;
    background-color: #e9ecef;
    z-index: 1;
    border-radius: 3px;
}

.join3_step {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 2;
    width: 25%;
}

.join3_step-icon {
    width: 70px;
    height: 70px;
    background-color: white;
    border: 3px solid #e9ecef;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 12px;
    transition: all 0.3s ease;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.join3_step.active .join3_step-icon {
    border-color: #ff6b01;
    color: #ff6b01;
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(255, 107, 1, 0.2);
}

.join3_step.completed .join3_step-icon {
    background-color: #ff6b01;
    border-color: #ff6b01;
    color: white;
}

.join3_step-text {
    font-size: 15px;
    color: #888;
    text-align: center;
    font-weight: 500;
    transition: all 0.3s ease;
}

.join3_step.active .join3_step-text {
    color: #ff6b01;
    font-weight: 600;
}

.join3_step.completed .join3_step-text {
    color: #ff6b01;
    font-weight: 500;
}

.join3_divider {
    height: 1px;
    background-color: #e9ecef;
    margin: 30px 0;
    border-radius: 1px;
}

.join3_form-group {
    margin-bottom: 25px;
}

.join3_form-label {
    display: block;
    margin-bottom: 10px;
    font-size: 15px;
    color: #333;
    font-weight: 500;
}

.join3_form-input {
    width: 100%;
    padding: 14px 16px;
    border: 1px solid #dee2e6;
    border-radius: 6px;
    font-size: 15px;
    transition: all 0.3s ease;
    background-color: #fff;
}

.join3_form-input:focus {
    outline: none;
    border-color: #ff6b01;
    box-shadow: 0 0 0 3px rgba(255, 107, 1, 0.1);
}

.join3_input-group {
    display: flex;
    gap: 12px;
    align-items: center;
}

.join3_input-group .join3_form-input {
    flex: 1;
}

.join3_button {
    background-color: #495057;
    color: white;
    border: none;
    border-radius: 6px;
    padding: 14px 18px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
}

.join3_button:hover {
    background-color: #343a40;
    transform: translateY(-1px);
}

.join3_button.join3_btn-primary {
    background-color: #ff6b01;
    width: 100%;
    font-weight: 600;
    font-size: 16px;
    padding: 16px;
    letter-spacing: 0.5px;
}

.join3_button.join3_btn-primary:hover {
    background-color: #e65c00;
    box-shadow: 0 4px 12px rgba(255, 107, 1, 0.2);
}

.join3_button:disabled {
    background-color: #dee2e6;
    cursor: not-allowed;
    transform: none;
    box-shadow: none;
}

.join3_button.join3_btn-primary:disabled {
    background-color: #ffb27f;
}

.join3_help-text {
    font-size: 13px;
    color: #6c757d;
    margin-top: 8px;
}

.join3_validation-message {
    font-size: 13px;
    color: #e74c3c;
    margin-top: 8px;
    display: none;
}

.join3_validation-message.show {
    display: block;
}

.join3_password-strength {
    margin-top: 10px;
    height: 5px;
    background-color: #e9ecef;
    border-radius: 3px;
    overflow: hidden;
}

.join3_password-strength-meter {
    height: 100%;
    width: 0%;
    border-radius: 3px;
    transition: width 0.3s ease, background-color 0.3s ease;
}

.join3_password-strength-meter.weak {
    background-color: #e74c3c;
    width: 33%;
}

.join3_password-strength-meter.medium {
    background-color: #f39c12;
    width: 66%;
}

.join3_password-strength-meter.strong {
    background-color: #2ecc71;
    width: 100%;
}

.join3_button-group {
    display: flex;
    justify-content: space-between;
    gap: 15px;
    margin-top: 40px;
}

.join3_button.join3_btn-back {
    background-color: #e9ecef;
    color: #495057;
    flex: 1;
}

.join3_button.join3_btn-back:hover {
    background-color: #dee2e6;
}

.join3_btn-primary {
    flex: 3;
}

/* Making form elements more visually attractive */
.join3_form-input::placeholder {
    color: #adb5bd;
}

.join3_form-input.join3_input-error {
    border-color: #e74c3c;
}

.join3_form-input.join3_input-success {
    border-color: #2ecc71;
}

/* Animation for step transitions */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.join3_form-section {
    animation: fadeIn 0.5s ease-out;
}

/* Styles for the consent checkboxes */
.join3_checkbox-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.join3_checkbox-group input[type="checkbox"] {
    margin-right: 10px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

.join3_checkbox-label {
    font-size: 15px;
    color: #333;
    cursor: pointer;
}

/* Styles for the profile image upload */
.join3_profile-upload {
    text-align: center;
    margin-bottom: 25px;
}

.join3_profile-preview {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background-color: #e9ecef;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto 15px;
    overflow: hidden;
    position: relative;
    border: 3px solid #dee2e6;
    transition: all 0.3s ease;
}

.join3_profile-preview:hover {
    border-color: #ff6b01;
}

.join3_profile-preview img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.join3_profile-upload-icon {
    position: absolute;
    bottom: 0;
    right: 0;
    background-color: #ff6b01;
    color: white;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all 0.3s ease;
    top: 80px;
    left: 41px;
}

.join3_profile-upload-icon:hover {
    background-color: #e65c00;
    transform: scale(1.1);
}

.join3_profile-upload-text {
    font-size: 14px;
    color: #6c757d;
    margin-top: 10px;
}

.join3_profile-upload-input {
    display: none;
}
</style>
<script type="text/javascript">
$(function() {
	
  // Password validation
  $("#password").on("input", function() {
      validatePassword();
  });
  
  // Password confirmation validation
  $("#confirmPassword").on("input", function() {
      validatePasswordConfirmation();
  });
  
  // Email validation
  $("#email").on("input", function() {
      validateEmail();
  });
  
  // Form validation
  $(".join3_form-input").on("input", function() {
      validateForm();
  });
  
  // Profile image preview
  $("#profileImageInput").on("change", function() {
	  	
      const file = this.files[0];
      if(file.size > (1024 * 1024 * 10)){
    	  alert("파일첨부 사이즈는 10MB 이내로 가능합니다.");
				$(this).val(''); //업로드한 파일 제거
    	  $("#profileImagePreview").attr("src","");
    	  $("#profileImagePlaceholder").show();
    	  $("#profileImagePreview").hide();
    	  return;
      }
      if (file) {
          const reader = new FileReader();
          reader.onload = function(e) {
              $("#profileImagePreview").attr("src", e.target.result);
              $("#profileImagePlaceholder").hide();
              $("#profileImagePreview").show();
          };
          reader.readAsDataURL(file);
      }
  });
  
  // Profile image upload button click
  $(".join3_profile-upload-icon").on("click", function() {
      $("#profileImageInput").click();
  });
  
  // Check if all required fields are valid
  function validateForm() {
      var isValid = true;
      
      // Check all required fields
      $(".join3_form-input[required]").each(function() {
          if ($(this).val().trim() === "") {
              isValid = false;
              return false;
          }
      });
      
      // Check password match
      if ($("#password").val() !== $("#confirmPassword").val()) {
          isValid = false;
      }
      
      // Enable/disable next button
      $("#nextBtn").prop("disabled", !isValid);
  }
  
  // Password strength meter
  function validatePassword() {
      var password = $("#password").val();
      var strength = 0;
      
      // Clear validation messages
      $("#passwordValidation").removeClass("show");
      
      if (password.length === 0) {
          $(".join3_password-strength-meter").removeClass("weak medium strong").css("width", "0%");
          return;
      }
      
      // Check password length
      if (password.length < 8) {
          $("#passwordValidation").text("비밀번호는 8자 이상이어야 합니다.").addClass("show");
          $(".join3_password-strength-meter").removeClass("medium strong").addClass("weak");
          return;
      }
      
      // Check for letters, numbers, and special characters
      if (/[A-Za-z]/.test(password)) strength += 1;
      if (/[0-9]/.test(password)) strength += 1;
      if (/[^A-Za-z0-9]/.test(password)) strength += 1;
      
      if (strength === 1) {
          $(".join3_password-strength-meter").removeClass("medium strong").addClass("weak");
      } else if (strength === 2) {
          $(".join3_password-strength-meter").removeClass("weak strong").addClass("medium");
      } else {
          $(".join3_password-strength-meter").removeClass("weak medium").addClass("strong");
      }
      
      validatePasswordConfirmation();
  }
  
  // Password confirmation validation
  function validatePasswordConfirmation() {
      var password = $("#password").val();
      var confirmPassword = $("#confirmPassword").val();
      
      $("#confirmPasswordValidation").removeClass("show");
      
      if (confirmPassword.length > 0 && password !== confirmPassword) {
          $("#confirmPasswordValidation").text("비밀번호가 일치하지 않습니다.").addClass("show");
          return false;
      }
      
      return true;
  }
  
  // Email validation
  function validateEmail() {
      var email = $("#email").val();
      var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      
      $("#emailValidation").removeClass("show");
      
      if (email.length > 0 && !emailRegex.test(email)) {
          $("#emailValidation").text("유효한 이메일 주소를 입력해주세요.").addClass("show");
          return false;
      }
      
      return true;
  }
  
  $("#nextBtn").on("click", function() {
  		//폼 제출
      $("#join3Form").submit();
  		//Ajax로 처리하기
      //aJaxSubmit();
  });
  
  $("#backBtn").on("click", function() {
      history.back();
  });
  
});

function aJaxSubmit(){
/* form text요소는 web parameter, 파일은 multipart타입으로 전송하기 */
	
	//form객체 얻기
	let frmObj = $("#join3Form")[0]; //parameter전송방식 : 파일업로드x
	
	let formData = new FormData(frmObj); //param -> binary 전송방식으로 변경, FormData = Binary전송방식을 사용하는 Form객체 
	
	alert(formData);
	
 	$.ajax({
		url:"${pageContext.request.contextPath}/login/controller/joinComplete.jsp",
		type:"POST",
		contentType:false, /* parameter전송방식 -> binary전송방식으로 변경 */
		processData:false, /* 요청 URL에 QueryString연결이 되지 않는다 (HTML Form Control값 전송 => HTTP Protocol에 payload전달) */
		data:formData, /* Parameter 전송방식 form -> binary 전송방식 form 변환된 객체 => back-end에서 MultipartRequest객체를 사용하여 값들을 받을 수 있다. */
		dataType:"JSON",
		success:function(jsonObj){
			if(jsonObj){
				$("#imgName").val(jsonObj.fileName);
			} else {
				console.log("프로필 이미지가 업로드 되지 않았습니다.");
			}
		},
		error:function(xhr){
			console.log(xhr.status);
		}
		
	}); 
	
}



</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div class="join3_container">
    <h1 class="join3_title">회원가입</h1>

    <div class="join3_steps">
        <div class="join3_step completed">
            <div class="join3_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </div>
            <div class="join3_step-text">본인인증</div>
        </div>

        <div class="join3_step completed">
            <div class="join3_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="9 11 12 14 22 4"></polyline>
                  <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
                </svg>
            </div>
            <div class="join3_step-text">약관동의</div>
        </div>

        <div class="join3_step active">
            <div class="join3_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                  <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
            </div>
            <div class="join3_step-text">회원정보 입력</div>
        </div>

        <div class="join3_step">
            <div class="join3_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                  <polyline points="22 4 12 14.01 9 11.01"></polyline>
                </svg>
            </div>
            <div class="join3_step-text">가입완료</div>
        </div>
    </div>
<!-- -------------------------------------------------------------------------------------------------------------------------------------- -->
    <div class="join3_divider"></div>

    <form id="join3Form" class="join3_form-section" action="${pageContext.request.contextPath}/login/controller/joinComplete.jsp" method="post" enctype="multipart/form-data">
        <!-- 프로필 이미지 업로드 영역 추가 -->
        <div class="join3_profile-upload">
            <div class="join3_profile-preview">
                <svg id="profileImagePlaceholder" xmlns="http://www.w3.org/2000/svg" width="48" height="48"
                    viewBox="0 0 24 24" fill="none" stroke="#adb5bd"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
                <img id="profileImagePreview" style="display: none;" src="#" alt="프로필 미리보기">
                <div class="join3_profile-upload-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                      <polyline points="17 8 12 3 7 8"></polyline>
                      <line x1="12" y1="3" x2="12" y2="15"></line>
                    </svg>
                </div>
            </div>
            <p class="join3_profile-upload-text">프로필 이미지를 업로드해주세요</p>
            <input type="file" id="profileImageInput" name="profileImage" class="join3_profile-upload-input" accept="image/*">
        </div>

        <div class="join3_form-group">
            <label for="userId" class="join3_form-label">아이디</label>
            <div class="join3_input-group">
                <input type="text" id="userId" name="userId" class="join3_form-input" placeholder="아이디를 입력해주세요" required>
                <button type="button" class="join3_button" id="checkIdBtn">중복확인</button>
            </div>
            <div id="userIdValidation" class="join3_validation-message"></div>
            <div class="join3_help-text">영문, 숫자 조합 6-20자</div>
        </div>

        <div class="join3_form-group">
            <label for="password" class="join3_form-label">비밀번호</label>
            <input type="password" id="password" name="password" class="join3_form-input" placeholder="비밀번호를 입력해주세요" required>
            <div class="join3_password-strength">
                <div class="join3_password-strength-meter"></div>
            </div>
            <div id="passwordValidation" class="join3_validation-message"></div>
            <div class="join3_help-text">영문, 숫자, 특수문자 조합 8자 이상</div>
        </div>

        <div class="join3_form-group">
            <label for="confirmPassword" class="join3_form-label">비밀번호 확인</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="join3_form-input" placeholder="비밀번호를 다시 입력해주세요" required>
            <div id="confirmPasswordValidation" class="join3_validation-message"></div>
        </div>

        <div class="join3_form-group">
            <label for="nickName" class="join3_form-label">닉네임</label>
            <input type="text" id="nickName" name="nickName" class="join3_form-input" placeholder="닉네임을 입력해주세요" required>
		        <div class="join3_help-text">한글, 영문, 숫자 조합 2-20자</div>
        </div>
       <div id="nicknameValidation" class="join3_validation-message"></div>
        
        <script type="text/javascript">
        //닉네임중복 검사. 수정할 것ㅅ
        $("#checkNicknameBtn").on("click", function() {
            var nickname = $("#nickname").val().trim();
            
            if (nickname === "") {
                alert("닉네임을 입력해주세요.");
                return;
            }
            
            // 닉네임 형식 검증 (2-20자, 한글, 영문, 숫자 허용)
            var nicknameRegex = /^[가-힣a-zA-Z0-9]{2,20}$/;
            if (!nicknameRegex.test(nickname)) {
                $("#nicknameValidation").text("닉네임은 한글, 영문, 숫자 조합 2-20자여야 합니다.").addClass("show").removeClass("success");
                return;
            }
            
            // Ajax 중복확인 요청
            $.ajax({
                url: "${pageContext.request.contextPath}/login/controller/checkNickname.jsp",
                type: "POST",
                data: { nickname: nickname },
                dataType: "JSON",
                success: function(response) {
                    if (response.available) {
                        $("#nicknameValidation").text("사용 가능한 닉네임입니다.").addClass("show success").removeClass("join3_validation-message");
                        $("#nickname").addClass("join3_input-success").removeClass("join3_input-error");
                        isNicknameChecked = true;
                    } else {
                        $("#nicknameValidation").text("이미 사용중인 닉네임입니다.").addClass("show").removeClass("success");
                        $("#nickname").addClass("join3_input-error").removeClass("join3_input-success");
                        isNicknameChecked = false;
                    }
                    validateForm();
                },
                error: function(xhr) {
                    alert("중복확인 중 오류가 발생했습니다. 다시 시도해주세요.");
                    console.log("Error:", xhr.status);
                }
            });
        });
        
        </script>
        
       	<div class="join3_form-group">
	        <label for="birthday" class="join3_form-label">생년월일</label>
	        <input type="text" id="birthday" name="birthday" class="join3_form-input" placeholder="예: 20001225" maxlength="8" min="8">
	        <div id="birthdayValidation" class="join3_validation-message"></div>
	        <div class="join3_help-text">8자리 숫자로 입력해주세요 (연월일 순서)</div>
        </div>
        
        <div class="join3_form-group">
            <label for="userName" class="join3_form-label">이름</label>
            <input type="text" id="userName" name="userName" class="join3_form-input" placeholder="이름을 입력해주세요" required>
        </div>

        <div class="join3_form-group">
            <label for="email" class="join3_form-label">이메일</label>
            <input type="email" id="email" name="email" class="join3_form-input" placeholder="이메일을 입력해주세요" required>
            <div id="emailValidation" class="join3_validation-message"></div>
        </div>

        <!-- 이메일 수신여부 추가 -->
        <div class="join3_form-group">
            <div class="join3_checkbox-group">
                <input type="checkbox" id="emailConsent" name="emailConsent" value="Y">
                <label for="emailConsent" class="join3_checkbox-label">이메일 수신 동의 (할인 및 이벤트 정보를 받아보실 수 있습니다)</label>
            </div>
        </div>

        <div class="join3_form-group">
            <label for="phone" class="join3_form-label">전화번호</label>
            <input type="tel" id="phone" name="phone" class="join3_form-input" placeholder="전화번호를 입력해주세요" required>
        </div>

        <!-- 전화번호 수신여부 추가 -->
        <div class="join3_form-group">
            <div class="join3_checkbox-group">
                <input type="checkbox" id="smsConsent" name="smsConsent" value="Y"> <!-- null은 "N"로 받을거 -->
                <label for="smsConsent" class="join3_checkbox-label">SMS 수신 동의 (할인 및 이벤트 정보를 받아보실 수 있습니다)</label>
            </div>
        </div>

        <div class="join3_button-group">
            <button type="button" class="join3_button join3_btn-back" id="backBtn">이전</button>
            <button type="button" class="join3_button join3_btn-primary" id="nextBtn" disabled>다음</button>
        </div>
    </form>
</div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>