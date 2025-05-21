<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"/>


<c:import url="http://localhost/movie_prj/common/external_file.jsp"/>
<style>
 #container{ min-height: 650px; margin-top: 30px; margin-left: 20px}

.modal-title{
	font-size: 20px;
	color:white;

}

.modal-header{

	background-color: #333;
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

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
예매취소
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title" id="exampleModalLabel">예매 취소 완료</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 class="text-center">예매 취소가 완료되었습니다.</h5>
        <hr>
        <strong>환불 안내</strong><br>
        <ul>
          <li><strong>신용카드</strong>: 결제 후 3일 이내 취소 시 승인 취소되며, 3일 이후 매입 취소시 영업일 기준 5~9일 소요됩니다.</li>
          <li><strong>체크카드</strong>: 결제 후 3일 이내 취소 시 카드사에서 즉시 환급되며, 3일 이후 매입 취소시 카드사에 따라 3~10일 소요됩니다.</li>
          <li><strong>휴대폰 결제</strong>: 결제 월과 기준 동일(1일~말일)취소만 가능하며, 취소 관련 문의는 GVC 고객센터(1544-1122)를 통해 확인</li>
        </ul>
        <p>* 휴대폰 결제가 확인되지 않을때(페이지에서 취소창 오류 발생) 직접 통신사 확인 필요</p>
        <p>* 카드사 정책에 따라 실제 환불일은 상이할 수 있으며, 일부 카드사의 경우 환불 금액이 카드 승인 취소와 별도 청구될 수 있음</p>
        <ul>
          <li><strong>PAYCO</strong>: PAYCO 포인트 결제 시 취소 후 환급 처리되며, PAYCO 포인트 + 카드 결제인 경우 각각에 따라 취소되어 환급 처리됨</li>
          <li><strong>토스</strong>: 토스 결제는 카드사 정책에 따라 승인취소 처리되며, 카드사 승인취소일 기준 영업일 기준 3~10일 소요</li>
          <li><strong>네이버페이</strong>: 카드결제 시 카드사 정책에 따라 승인취소 처리되며, 네이버페이 포인트 결제 시 포인트 환급</li>
        </ul>
        <p>* 예매 수단 및 결제 수단에 따라 3~10일 소요될 수 있음</p>
        <strong>패키지 예매 건</strong>
        <ul>
          <li>2인 PKG / 1인 PKG는 예매 전체 취소만 가능</li>
          <li>부분 취소 불가하며, 취소 후 새로운 티켓으로 발급 필요</li>
        </ul>
        <strong>현장 예매</strong><br>
        - 극장 매표소 운영 시간 내 가능<br><br>

        <strong>환불 수단 및 처리 기간 (예시)</strong>
        <ul>
          <li>신용카드 : 5~9일 이내 승인취소</li>
          <li>체크카드 : 3~10일 이내 환급</li>
          <li>휴대폰 결제 : 해당 월 내 취소만 가능</li>
          <li>PAYCO : 포인트 즉시 환급 또는 카드사 취소</li>
          <li>네이버페이 : 포인트 환급 또는 카드사 취소</li>
          <li>무통장입금 : 환불 요청 후 입력한 계좌로 7~10일 이내 환급</li>
        </ul>
        <p>* 은행 영업일 기준이며, 주말 및 공휴일 제외</p>
      </div>
      <div class="modal-footer">
        <a href="http://localhost/movie_prj/MyPage/MainPage.jsp" type="button" class="btn btn-danger">확인</a>
      </div>
    </div>
  </div>
</div>
</div>

</main>
<footer>
<c:import url="http://localhost/movie_prj/common/footer.jsp"/>
</footer>
</body>
</html>