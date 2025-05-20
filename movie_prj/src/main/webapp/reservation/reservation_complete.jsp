<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />
<link rel="stylesheet" href="http://localhost/movie_prj/reservation/reservation.css/reservation_complete.css"/>
<script type="text/javascript">
	$(document).ready(function() {
		$('#showModalBtn').click(function() {
			$('#bookingModal').fadeIn();
		});

		$('#closeModalBtn').click(function() {
			$('#bookingModal').fadeOut();
		});

		// 배경 클릭 시 모달 닫기
		$('#bookingModal').click(function(e) {
			if (e.target === this) {
				$(this).fadeOut();
			}
		});

		$('.close-btn').click(function() {
			$('#bookingModal').fadeOut();
		});
		
		$("#toMyPage").click(function() {
			location.href = "";
		});
	});
</script>
</head>
<body>
	<header>
		<c:import url="http://localhost/movie_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div class="booking-header">예매 완료</div>
			<div class="booking-complete-box">
				<br>
				<h1>예매가 완료되었습니다.</h1>

				<div class="booking-info">
					<img src="resources/images/sundebolt_poster.jpg" alt="썬더볼츠 포스터"
						class="poster">

					<div class="details">
						<p>
							<span>예매번호</span>0199-0501-5636-180
						</p>
						<p>
							<span>영화</span>썬더볼츠
						</p>
						<p>
							<span>극장</span>CGV 천호 / 5관
						</p>
						<p>
							<span>일시</span>2025년 5월 1일(목) 23:00 ~ 25:17
						</p>
						<p>
							<span>인원</span>일반 1명
						</p>
						<p>
							<span>좌석</span>J10
						</p>
						<p>
							<span>결제금액</span>14,000 원
						</p>
						<p>
							<span>결제수단</span>신용카드 14,000 원
						</p>

						<br>
						<div class="btn-box">
							<button class="red-btn" id="showModalBtn">예매정보 출력</button>
							<button class="gray-btn" id="toMyPage">예매확인/취소</button>
						</div>
					</div>
				</div>

				<div class="notice">
					<strong>예매 유의사항</strong>
					<ul>
						<li>CJ ONE 포인트는 상영일 익일 적립됩니다. (영화관람권, 비회원 예매 제외)</li>
						<li>영화 상영 스케줄은 영화관 사정에 의해 변경될 수 있습니다.</li>
						<li>비회원 예매하신 경우는 예매내역이 이메일로 발송되지 않습니다.</li>
					</ul>
				</div>
			</div>
		</div>


	</main>
	<footer>
		<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp" />
	</footer>
	<c:import url="http://localhost/movie_prj/reservation/booking_modal.jsp"/>
	
</body>
</html>