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
 
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
}

body {
/*     background-color: #f5f5f5; */
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 20px;
}

.container {
    background-color: #e0e0e04f;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 600px;
    padding: 50px;
    margin: 50px auto;
}

h1 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 24px;
    color: #333;
}

.steps {
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
    position: relative;
}

.steps::before {
    content: '';
    position: absolute;
    top: 35px;
    left: 20%;
    right: 20%;
    height: 2px;
    background-color: #e0e0e0;
    z-index: 1;
}

.step {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 2;
    width: 25%;
}

.step-icon {
    width: 60px;
    height: 60px;
    background-color: white;
    border: 2px solid #e0e0e0;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.step.active .step-icon {
    border-color: #ff6b01;
    color: #ff6b01;
}

.step-text {
    font-size: 14px;
    color: #888;
    text-align: center;
}

.step.active .step-text {
    color: #ff6b01;
    font-weight: 500;
}

.divider {
    height: 1px;
    background-color: #e0e0e0;
    margin: 20px 0;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    color: #333;
    font-weight: 500;
}

input {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    transition: border-color 0.3s;
}

input:focus {
    outline: none;
    border-color: #ff6b01;
}

.input-group {
    display: flex;
    gap: 10px;
}

.input-group input {
    flex: 1;
}

button {
    background-color: #333;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 12px 15px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #555;
}

button.btn-primary {
    background-color: #ff6b01;
    width: 100%;
    font-weight: 500;
    font-size: 16px;
    padding: 15px;
}

button.btn-primary:hover {
    background-color: #e65c00;
}

.auth-methods {
    display: flex;
    justify-content: space-between;
    padding: 30px 0;
}

.auth-option {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
    border-right: 1px solid #eee;
}

.auth-option:last-child {
    border-right: none;
}

.auth-icon {
    width: 70px;
    height: 70px;
    margin-bottom: 15px;
}

.auth-button {
    display: block;
    width: 100%;
    text-align: center;
    padding: 10px;
    margin-top: 10px;
    background-color: #333;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-size: 14px;
}

.info-text {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 4px;
    font-size: 14px;
    color: #666;
    margin-bottom: 20px;
}

.error-message {
    color: #e74c3c;
    font-size: 12px;
    margin-top: 5px;
    display: none;
}

.success-message {
    color: #2ecc71;
    font-size: 14px;
    padding: 10px;
    background-color: rgba(46, 204, 113, 0.1);
    border-radius: 4px;
    margin-bottom: 15px;
    display: none;
}

.timer {
    font-size: 14px;
    color: #ff6b01;
    margin-left: 10px;
}
</style>
<script type="text/javascript">
$(function(){
	
	
});

</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div class="container">
	<!-- 본인인증 시작 -->
	<h1 style="font-size: 30px; margin-bottom: 30px;">회원가입</h1>

	<div class="steps">
		<div class="step active">
			<div class="step-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
              </svg>
			</div>
			<div class="step-text">본인인증</div>
		</div>

		<div class="step">
			<div class="step-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="9 11 12 14 22 4"></polyline>
                  <path
						d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
              </svg>
			</div>
			<div class="step-text">약관동의</div>
		</div>

		<div class="step">
			<div class="step-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path
						d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                  <path
						d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
              </svg>
			</div>
			<div class="step-text">회원정보 입력</div>
		</div>

		<div class="step">
			<div class="step-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                  <polyline points="22 4 12 14.01 9 11.01"></polyline>
              </svg>
			</div>
			<div class="step-text">가입완료</div>
		</div>
	</div>

	<div class="divider"></div>

	<div class="info-text">안전한 회원가입을 위한 본인인증 단계입니다.</div>

	<div id="email-auth-form">
		<div class="form-group">
			<label for="email">이메일 주소</label><br>
			<div class="input-group">
				<input type="email" id="email" placeholder="example@domain.com"
					required>
				<button id="send-verification" type="button">인증번호 전송</button>
			</div>
			<div class="error-message" id="email-error">올바른 이메일 주소를
				입력해주세요.</div>
		</div>

		<div class="form-group" id="verification-form"
			style="display: none;">
			<div class="success-message" id="email-sent-success">입력하신
				이메일로 인증번호가 발송되었습니다.</div>

			<label for="verification-code">인증번호 <span class="timer" id="verification-timer">05:00</span></label><br>
			<div class="input-group">
				<input type="text" id="verification-code" placeholder="인증번호 6자리 입력" maxlength="6">
				<button id="verify-code" type="button">확인</button>
			</div>
			<div class="error-message" id="verification-error">인증번호가 일치하지
				않습니다.</div>
		</div>

		<div class="form-group" id="verification-success"
			style="display: none;">
			<div class="success-message" style="display: block;">이메일 인증이
				완료되었습니다.</div>
		</div>
	</div>

	<div class="divider"></div>

	<button class="btn-primary" id="next-step" disabled>다음</button>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const emailInput = document.getElementById('email');
    const sendVerificationBtn = document.getElementById('send-verification');
    const verificationForm = document.getElementById('verification-form');
    const verificationCode = document.getElementById('verification-code');
    const verifyCodeBtn = document.getElementById('verify-code');
    const emailError = document.getElementById('email-error');
    const verificationError = document.getElementById('verification-error');
    const emailSentSuccess = document.getElementById('email-sent-success');
    const verificationSuccess = document.getElementById('verification-success');
    const verificationTimer = document.getElementById('verification-timer');
    const nextStepBtn = document.getElementById('next-step');
    
    let timerInterval;
    let generatedCode = '';
    
    function validateEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }
    
    function startTimer(duration, display) {
        let timer = duration;
        let minutes, seconds;
        
        clearInterval(timerInterval);
        
        timerInterval = setInterval(function() {
            minutes = parseInt(timer / 60, 10);
            seconds = parseInt(timer % 60, 10);
            
            minutes = minutes < 10 ? "0" + minutes : minutes;
            seconds = seconds < 10 ? "0" + seconds : seconds;
            
            display.textContent = minutes + ":" + seconds;
            
            if (--timer < 0) {
                clearInterval(timerInterval);
                display.textContent = "00:00";
                verificationError.style.display = 'block';
                verificationError.textContent = "인증 시간이 만료되었습니다. 다시 시도해주세요.";
                generatedCode = '';
            }
        }, 1000);
    }
    
    function generateVerificationCode() {
        // Generate a 6-digit random code
        return Math.floor(100000 + Math.random() * 900000).toString();
    }
    
    sendVerificationBtn.addEventListener('click', function() {
        const email = emailInput.value.trim();
        
        if (!validateEmail(email)) {
            emailError.style.display = 'block';
            return;
        }
        
        emailError.style.display = 'none';
        generatedCode = generateVerificationCode();
        
        // In a real application, you would send the code via email
        console.log('Verification code:', generatedCode);
//----------------- 세션에도 추가. 인증번호 재 전송시에는 기존세션 인증번호 삭제 후에 다시 생성 ---------------------------------------------------------------------
        
        
        // Show verification form
        verificationForm.style.display = 'block';
        emailSentSuccess.style.display = 'block';
        
        // Start the timer
        startTimer(300, verificationTimer); // 5 minutes
        
        // Disable the send button temporarily
        sendVerificationBtn.disabled = true;
        setTimeout(() => {
            sendVerificationBtn.disabled = false;
        }, 30000); // Enable after 30 seconds
    });
    
    verifyCodeBtn.addEventListener('click', function() {
        const code = verificationCode.value.trim();
        
        if (code === generatedCode && code !== '') {
            verificationError.style.display = 'none';
            verificationForm.style.display = 'none';
            verificationSuccess.style.display = 'block';
            clearInterval(timerInterval);
            
            // Enable next step button
            nextStepBtn.disabled = false;
        } else {
            verificationError.style.display = 'block';
        }
    });
    
    emailInput.addEventListener('input', function() {
        emailError.style.display = 'none';
    });
    
    nextStepBtn.addEventListener('click', function() {
        // In a real application, you would proceed to the next step
        alert('인증이 완료되었습니다. 다음 단계로 진행합니다.');
        
        // Update step indicators
        document.querySelector('.step.active').classList.remove('active');
        document.querySelectorAll('.step')[1].classList.add('active');
        
        location.href="${pageContext.request.contextPath}/login/join2AgreeToTerms.jsp";
    });
});
</script>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>