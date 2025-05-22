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

button:disabled {
    background-color: #cccccc;
    cursor: not-allowed;
}

button.btn-primary:disabled {
    background-color: #ffb27f;
}

/* Special classes for agree terms page */
.terms_agree_all-agree {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 4px;
    margin-bottom: 20px;
    font-weight: 500;
    display: flex;
    align-items: center;
}

.terms_agree_all-agree input[type="checkbox"] {
    width: auto;
    margin-right: 10px;
}

.terms_agree_checkbox-group {
    margin-bottom: 25px;
    background-color: #fafafa;
    border-radius: 6px;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
}

.terms_agree_terms-title {
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 10px;
    color: #333;
}

.terms_agree_required {
    color: #ff6b01;
    font-size: 14px;
}

.terms_agree_terms-container {
    background-color: white;
    border: 1px solid #eee;
    border-radius: 4px;
    padding: 15px;
    height: 150px;
    overflow-y: auto;
    margin-bottom: 10px;
    font-size: 14px;
    color: #555;
}

.terms_agree_checkbox-label {
    display: flex;
    align-items: center;
    margin-top: 10px;
}

.terms_agree_checkbox-label input[type="checkbox"] {
    width: auto;
    margin-right: 10px;
}

.terms_agree_button-group {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    margin-top: 30px;
}

.terms_agree_btn-back {
    background-color: #e0e0e0;
    color: #333;
    flex: 1;
}

.terms_agree_btn-back:hover {
    background-color: #d0d0d0;
}

button.btn-primary {
    flex: 3;
}

input[type="checkbox"] {
    appearance: none;
    -webkit-appearance: none;
    width: 20px;
    height: 20px;
    border: 2px solid #ddd;
    border-radius: 4px;
    margin-right: 10px;
    position: relative;
    vertical-align: middle;
    cursor: pointer;
}

input[type="checkbox"]:checked {
    background-color: #ff6b01;
    border-color: #ff6b01;
}

input[type="checkbox"]:checked::after {
    content: '✓';
    position: absolute;
    color: white;
    font-size: 14px;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* Style for label next to checkboxes */
input[type="checkbox"] + label {
    display: inline;
    vertical-align: middle;
    cursor: pointer;
}
</style>
<script type="text/javascript">
$(function(){
	// 전체 동의 체크박스 기능
	$("#agreeAll").on("change", function(){
	    $(".terms_agree_term-checkbox").prop("checked", $(this).prop("checked"));
	    validateTerms();
	});
	
	// 개별 체크박스 변경 시 전체 동의 상태 확인
	$(".terms_agree_term-checkbox").on("change", function(){
	    var allChecked = true;
	    $(".terms_agree_term-checkbox").each(function(){
	        if(!$(this).prop("checked")){
	            allChecked = false;
	            return false;
	        }
	    });
	    $("#agreeAll").prop("checked", allChecked);
	    validateTerms();
	});
	
	// 필수 약관 확인
	function validateTerms(){
	    var requiredChecked = true;
	    $(".terms_agree_term-checkbox.required").each(function(){
	        if(!$(this).prop("checked")){
	            requiredChecked = false;
	            return false;
	        }
	    });
	    $("#nextBtn").prop("disabled", !requiredChecked);
	}
	
	// 다음 버튼 클릭
	$("#nextBtn").on("click", function(){
	    location.href = "${pageContext.request.contextPath}/login/join3registerForm.jsp";
	});
	
	// 이전 버튼 클릭
	$("#backBtn").on("click", function(){
	    history.back();
	});	

});

</script>
</head>
<body>
<header>
<c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>
<main>
<div class="container">
    <h1 style="font-size: 30px; margin-bottom: 30px;">회원가입</h1>

	<div class="steps">
		<div class="step">
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

		<div class="step active">
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

    <div class="terms_agree_all-agree">
        <input type="checkbox" id="agreeAll">
        <label for="agreeAll">모든 약관에 동의합니다.</label>
    </div>

    <div class="terms_agree_checkbox-group">
        <div class="terms_agree_terms-title">서비스 이용약관 <span class="terms_agree_required">(필수)</span></div>
        <div class="terms_agree_terms-container">
            <p>제1조 (목적)</p>
            <p>본 약관은 회사가 제공하는 서비스의 이용과 관련하여 회사와 회원 간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
            <br>
            <p>제2조 (정의)</p>
            <p>1. "서비스"라 함은 회사가 제공하는 모든 서비스를 의미합니다.</p>
            <p>2. "회원"이라 함은 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 개인을 말합니다.</p>
            <br>
            <p>제3조 (약관의 효력 및 변경)</p>
            <p>1. 본 약관은 서비스를 이용하고자 하는 모든 회원에게 적용됩니다.</p>
            <p>2. 회사는 필요한 경우 약관을 변경할 수 있으며, 변경된 약관은 웹사이트에 공지함으로써 효력이 발생합니다.</p>
        </div>
        <div class="terms_agree_checkbox-label">
            <input type="checkbox" id="termsAgree1" class="terms_agree_term-checkbox required">
            <label for="termsAgree1">서비스 이용약관에 동의합니다.</label>
        </div>
    </div>

    <div class="terms_agree_checkbox-group">
        <div class="terms_agree_terms-title">개인정보 처리방침 <span class="terms_agree_required">(필수)</span></div>
        <div class="terms_agree_terms-container">
            <p>제1조 (개인정보의 수집 항목 및 이용 목적)</p>
            <p>회사는 회원가입, 서비스 제공, 고객 상담 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
            <p>- 수집항목: 이름, 이메일 주소, 비밀번호, 닉네임, 전화번호, 생년월일</p>
            <p>- 이용목적: 회원관리, 서비스 제공, 마케팅 활용</p>
            <br>
            <p>제2조 (개인정보의 보유 및 이용기간)</p>
            <p>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</p>
        </div>
        <div class="terms_agree_checkbox-label">
            <input type="checkbox" id="termsAgree2" class="terms_agree_term-checkbox required">
            <label for="termsAgree2">개인정보 처리방침에 동의합니다.</label>
        </div>
    </div>

    <div class="terms_agree_checkbox-group">
        <div class="terms_agree_terms-title">마케팅 정보 수신 동의 <span style="color: #888; font-size: 14px;">(선택)</span></div>
        <div class="terms_agree_terms-container">
            <p>회사는 회원님에게 유익한 이벤트, 프로모션, 새로운 서비스 안내 등의 마케팅 정보를 이메일, SMS 등의 방법으로 전달합니다.</p>
            <p>마케팅 정보 수신 동의를 거부하시더라도 기본 서비스를 이용하실 수 있습니다.</p>
        </div>
        <div class="terms_agree_checkbox-label">
            <input type="checkbox" id="termsAgree3" class="terms_agree_term-checkbox">
            <label for="termsAgree3">마케팅 정보 수신에 동의합니다.</label>
        </div>
    </div>

    <div class="terms_agree_button-group">
        <button class="terms_agree_btn-back" id="backBtn">이전</button>
        <button class="btn-primary" id="nextBtn" disabled>다음</button>
    </div>
</div>
</main>
<footer>
<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>