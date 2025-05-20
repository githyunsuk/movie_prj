<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost/movie_prj/reservation/reservation.css/booking_modal.css"/>
<style type="text/css">
</style>
</head>
<body>
	<div class="booking-modal" id="bookingModal">
		<div class="booking-modal-content">
			<div class="modal-header">
				예매정보 확인 <span class="close-button" id="closeModalBtn">✕</span>
			</div>

			<div class="modal-content">
				<div class="warning">
					<p class="warning-text">본 화면으로는 입장이 불가합니다.</p>
					<p class="instruction">
						극장 매표소 또는 티켓판매기에서 아래의 예매번호로<br>영화 티켓을 발급 받으신 후 입장하시기 바랍니다.
					</p>
				</div>

				<div class="booking-number">
					<span style="color: #999;">0001</span> 0505-6228-290
				</div>

				<div class="booking-details">
					<strong>영화명</strong> A MINECRAFT MOVIE 마인크래프트 무비(더빙)
				</div>
				<br>
				<div class="booking-details">
					<strong>관람일</strong> 2025.05.06 (화요일) · 12:00 ~ 13:51<br>
				</div>
				<br>
				<div class="booking-details">
					<strong>상영관</strong> CGV 강변 · 6관 (Laser)<br>
				</div>
				<br>
				<div class="booking-details">
					<strong>관람인원</strong> 일반 1 명<br>
				</div>
				<br>
				<div class="booking-details">
					<strong>좌석</strong> I06<br>
				</div>
				<br>
				<div class="note">
					입장 지연에 따른 관람 불편을 최소화하기 위해 본<br>영화는 10분 후 상영이 시작됩니다.
				</div>

				<div class="modal-footer">
					<button id="closeModalBtn" class="close-btn">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>