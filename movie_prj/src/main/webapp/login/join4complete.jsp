<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 가입완료</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style type="text/css">
#container{ min-height: 650px; margin-top: 30px; margin-left: 20px}

/* Modern and consistent styling for join4 page */
.join4_container {
    background-color: #f8f9fa;
    border-radius: 12px;
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
    width: 100%;
    max-width: 600px;
    padding: 40px 50px;
    margin: 50px auto;
    transition: all 0.3s ease;
}

.join4_container:hover {
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

.join4_title {
    text-align: center;
    margin-bottom: 35px;
    font-size: 32px;
    color: #333;
    font-weight: 600;
}

.join4_steps {
    display: flex;
    justify-content: space-between;
    margin-bottom: 40px;
    position: relative;
}

.join4_steps::before {
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

.join4_step {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index: 2;
    width: 25%;
}

.join4_step-icon {
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

.join4_step.active .join4_step-icon {
    border-color: #ff6b01;
    color: #ff6b01;
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(255, 107, 1, 0.2);
}

.join4_step.completed .join4_step-icon {
    background-color: #ff6b01;
    border-color: #ff6b01;
    color: white;
}

.join4_step-text {
    font-size: 15px;
    color: #888;
    text-align: center;
    font-weight: 500;
    transition: all 0.3s ease;
}

.join4_step.active .join4_step-text {
    color: #ff6b01;
    font-weight: 600;
}

.join4_step.completed .join4_step-text {
    color: #ff6b01;
    font-weight: 500;
}

.join4_divider {
    height: 1px;
    background-color: #e9ecef;
    margin: 30px 0;
    border-radius: 1px;
}

/* Success section styling */
.join4_success-section {
    text-align: center;
    padding: 20px 0 40px;
    animation: fadeIn 0.8s ease-out;
}

.join4_success-icon {
    width: 120px;
    height: 120px;
    background-color: #ebfbf2;
    border-radius: 50%;
    margin: 0 auto 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #2ecc71;
    animation: scaleIn 0.5s ease-out 0.3s both;
}

.join4_success-title {
    font-size: 28px;
    color: #333;
    margin-bottom: 15px;
    font-weight: 600;
}

.join4_success-message {
    font-size: 16px;
    color: #6c757d;
    margin-bottom: 40px;
    line-height: 1.6;
}

.join4_user-info {
    background-color: white;
    border-radius: 10px;
    padding: 25px;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.05);
    margin-bottom: 40px;
    text-align: left;
    position: relative;
    overflow: hidden;
}

.join4_user-info::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 5px;
    height: 100%;
    background-color: #ff6b01;
    border-radius: 5px 0 0 5px;
}

.join4_info-row {
    display: flex;
    margin-bottom: 15px;
}

.join4_info-row:last-child {
    margin-bottom: 0;
}

.join4_info-label {
    width: 100px;
    color: #6c757d;
    font-size: 15px;
    font-weight: 500;
}

.join4_info-value {
    flex: 1;
    color: #333;
    font-size: 15px;
    font-weight: 500;
}

.join4_button {
    background-color: #ff6b01;
    color: white;
    border: none;
    border-radius: 6px;
    padding: 16px 30px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    min-width: 200px;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 12px rgba(255, 107, 1, 0.2);
}

.join4_button:hover {
    background-color: #e65c00;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(255, 107, 1, 0.25);
}

/* Animation for welcome section */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes scaleIn {
    from {
        transform: scale(0.8);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}

.join4_benefit-section {
    margin-top: 50px;
    border-top: 1px solid #e9ecef;
    padding-top: 40px;
}

.join4_benefit-title {
    text-align: center;
    font-size: 22px;
    color: #333;
    margin-bottom: 30px;
    font-weight: 600;
}

.join4_benefits {
    display: flex;
    justify-content: space-around;
    gap: 25px;
    margin-bottom: 40px;
}

.join4_benefit-item {
    flex: 1;
    background-color: white;
    border-radius: 10px;
    padding: 25px 20px;
    text-align: center;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.05);
    transition: all 0.3s ease;
}

.join4_benefit-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.join4_benefit-icon {
    width: 60px;
    height: 60px;
    background-color: #fff5ee;
    border-radius: 50%;
    margin: 0 auto 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #ff6b01;
}

.join4_benefit-name {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
    font-weight: 600;
}

.join4_benefit-desc {
    font-size: 14px;
    color: #6c757d;
    line-height: 1.5;
}

/* Confetti animation for celebration effect */
.join4_confetti {
    position: absolute;
    width: 10px;
    height: 20px;
    background-color: #ff6b01;
    opacity: 0;
    animation: confetti 3s ease-in-out infinite;
    z-index: 100;
}

.join4_confetti:nth-child(1) {
    left: 10%;
    top: -100px;
    background-color: #ff6b01;
    animation-delay: 0.1s;
}

.join4_confetti:nth-child(2) {
    left: 20%;
    top: -100px;
    background-color: #2ecc71;
    animation-delay: 0.3s;
}

.join4_confetti:nth-child(3) {
    left: 30%;
    top: -100px;
    background-color: #3498db;
    animation-delay: 0.5s;
}

.join4_confetti:nth-child(4) {
    left: 40%;
    top: -100px;
    background-color: #f1c40f;
    animation-delay: 0.7s;
}

.join4_confetti:nth-child(5) {
    left: 50%;
    top: -100px;
    background-color: #9b59b6;
    animation-delay: 0.9s;
}

.join4_confetti:nth-child(6) {
    left: 60%;
    top: -100px;
    background-color: #e74c3c;
    animation-delay: 1.1s;
}

.join4_confetti:nth-child(7) {
    left: 70%;
    top: -100px;
    background-color: #1abc9c;
    animation-delay: 1.3s;
}

.join4_confetti:nth-child(8) {
    left: 80%;
    top: -100px;
    background-color: #f39c12;
    animation-delay: 1.5s;
}

.join4_confetti:nth-child(9) {
    left: 90%;
    top: -100px;
    background-color: #e67e22;
    animation-delay: 1.7s;
}

@keyframes confetti {
    0% {
        transform: rotateZ(15deg) rotateY(0deg) translate(0, 0);
        opacity: 1;
    }
    25% {
        transform: rotateZ(5deg) rotateY(360deg) translate(-20px, 25vh);
    }
    50% {
        transform: rotateZ(15deg) rotateY(720deg) translate(10px, 50vh);
    }
    75% {
        transform: rotateZ(5deg) rotateY(1080deg) translate(-20px, 75vh);
    }
    100% {
        transform: rotateZ(15deg) rotateY(1440deg) translate(0, 100vh);
        opacity: 0;
    }
}
</style>
<script type="text/javascript">
$(function() {
    // Create confetti effect
    createConfetti();
    
    // Home button click
    $("#homeBtn").on("click", function() {
        window.location.href = "${pageContext.request.contextPath}/index.jsp";
    });
    
    // Login button click
    $("#loginBtn").on("click", function() {
        location.href = "${pageContext.request.contextPath}/login/loginFrm.jsp";
    });
    
    // Function to create confetti effect
    function createConfetti() {
        var container = $(".join4_success-section");
        
        for (var i = 0; i < 50; i++) {
            var confetti = $("<div>").addClass("join4_confetti");
            confetti.css({
                "left": Math.random() * 100 + "%",
                "top": -Math.random() * 100 + "px",
                "width": Math.random() * 8 + 5 + "px",
                "height": Math.random() * 16 + 8 + "px",
                "background-color": getRandomColor(),
                "animation-delay": Math.random() * 3 + "s",
                "animation-duration": Math.random() * 2 + 3 + "s"
            });
            container.append(confetti);
        }
    }
    
    // Function to get random color for confetti
    function getRandomColor() {
        var colors = [
            "#ff6b01", "#2ecc71", "#3498db", "#f1c40f", 
            "#9b59b6", "#e74c3c", "#1abc9c", "#f39c12"
        ];
        return colors[Math.floor(Math.random() * colors.length)];
    }
});
</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div class="join4_container">
    <h1 class="join4_title">회원가입</h1>

    <div class="join4_steps">
        <div class="join4_step completed">
            <div class="join4_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </div>
            <div class="join4_step-text">본인인증</div>
        </div>

        <div class="join4_step completed">
            <div class="join4_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="9 11 12 14 22 4"></polyline>
                  <path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
                </svg>
            </div>
            <div class="join4_step-text">약관동의</div>
        </div>

        <div class="join4_step completed">
            <div class="join4_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                  <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                </svg>
            </div>
            <div class="join4_step-text">회원정보 입력</div>
        </div>

        <div class="join4_step active">
            <div class="join4_step-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                  <polyline points="22 4 12 14.01 9 11.01"></polyline>
                </svg>
            </div>
            <div class="join4_step-text">가입완료</div>
        </div>
    </div>

    <div class="join4_divider"></div>

    <div class="join4_success-section">
        <div class="join4_success-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60"
                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
              <polyline points="22 4 12 14.01 9 11.01"></polyline>
            </svg>
            
        <!-- flash attribute 전략   -->
        <c:set var="memberVO" value="${sessionScope.memberVO }" /> 
        </div>
        <h2 class="join4_success-title">회원가입을 완료했습니다!</h2>
        <p class="join4_success-message">
            환영합니다!<strong style="color: #FF6B01"> <c:out value="${memberVO.userName }" /></strong>님의 회원가입이 성공적으로 완료되었습니다.<br>
            영화예매 서비스의 다양한 혜택을 지금 바로 이용해보세요.
        </p>

        <div class="join4_user-info">
            <div class="join4_info-row">
                <div class="join4_info-label">아이디</div>
                <div class="join4_info-value"><c:out value="${memberVO.memberId }"/> </div>
            </div>
            <div class="join4_info-row">
                <div class="join4_info-label">닉네임</div>
                <div class="join4_info-value"><c:out value="${memberVO.nickName }"/> </div>
            </div>
            <div class="join4_info-row">
                <div class="join4_info-label">이메일</div>
                <div class="join4_info-value"><c:out value="${memberVO.email }"/> </div>
            </div>
            <div class="join4_info-row">
                <div class="join4_info-label">전화번호</div>
                <div class="join4_info-value"><c:out value="${memberVO.tel }"/> </div>
            </div>
        </div>
        <c:remove var="memberVO" scope="session"/>

        <button type="button" class="join4_button" id="loginBtn">로그인 하기</button>

        <div class="join4_benefit-section">
            <h3 class="join4_benefit-title">회원 혜택 안내</h3>
            <div class="join4_benefits">
                <div class="join4_benefit-item">
                    <div class="join4_benefit-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                          <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path>
                          <circle cx="12" cy="10" r="3"></circle>
                        </svg>
                    </div>
                    <div class="join4_benefit-name">간편 예매</div>
                    <div class="join4_benefit-desc">회원 로그인 후 정보 입력 없이 빠르게 예매 가능</div>
                </div>
                <div class="join4_benefit-item">
                    <div class="join4_benefit-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                          <path d="M12 2v6.5l5-3"></path>
                          <path d="M12 14v8"></path>
                          <path d="M12 9c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2"></path>
                          <path d="M12 22c5.5 0 10-4.5 10-10S17.5 2 12 2 2 6.5 2 12s4.5 10 10 10z"></path>
                        </svg>
                    </div>
                    <div class="join4_benefit-name">포인트 적립</div>
                    <div class="join4_benefit-desc">영화 예매 시 결제 금액의 5% 포인트 적립</div>
                </div>
                <div class="join4_benefit-item">
                    <div class="join4_benefit-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                          <path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3H14Z"></path>
                          <path d="M7 22V11H1v11"></path>
                        </svg>
                    </div>
                    <div class="join4_benefit-name">특별 이벤트</div>
                    <div class="join4_benefit-desc">회원 전용 할인 및 이벤트 참여 기회 제공</div>
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