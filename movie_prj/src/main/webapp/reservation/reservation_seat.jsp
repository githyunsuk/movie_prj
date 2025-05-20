<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영화관 좌석 예매</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />
<link rel="stylesheet"
	href="http://localhost/movie_prj/reservation/reservation.css/reservation_seat.css">
<style>
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="/main.js"></script>
<script type="text/javascript">
	IMP.init("imp03140165"); //결제관련코드

	var maxCnt = $('.num-btn.selected').text();

	$(function() {

		$('.seat').click(function() {
			if (!$(this).hasClass('occupied')) {
				$(this).toggleClass('selected');
			}
		});

		$('.num-btn').click(function() {
			$('.num-btn.selected').removeClass('selected');
			$(this).addClass('selected');
			maxCnt = $(this).text();
			alert(maxCnt);
		});

		$('.nav-left').click(function() {
			location.href = "http://localhost/movie_prj/reservation/reservation.jsp";
		});

		$('.nav-right').click(function() {
			const selectedSeats = [];

			$('.row').each(function(rowIdx) {
				$(this).find('.seat.selected').each(function() {
					const seatIdx = $(this).index() - 1;
					selectedSeats.push({
						row : rowIdx,
						seat : seatIdx
					});
				});
			});

			if (selectedSeats.length > 0) {
				IMP.request_pay({
					pg : "kakaopay",
					pay_method : "card",
					amount : "500000000",
					name : "람보르기니",
					merchant_uid : "merchant_" + new Date().getTime()
				}, function(response) {
					if (response.success) {
						alert("결제 성공!");
					} else {
						alert("결제 실패: " + response.error_msg);
						location.href = "http://localhost/movie_prj/reservation/reservation_complete.jsp";
					}
				});
			} else {
				alert("좌석을 선택해주세요.");
			}
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
			<div class="seat-reservation-container">
				<div class="seat-header">인원/좌석</div>
				<div class="info-bar">
					<div class="flex-space-between">
						<div class="flex-1"><br>
							<div class="flex-gap-center"><br>
								
									<div class="label-small">일반</div>
									<div>
										<c:forEach var="i" begin="0" end="6">
											<c:choose>
												<c:when test="${i == 0}">
													<button class="num-btn selected">${i}</button>
												</c:when>
												<c:otherwise>
													<button class="num-btn">${i}</button>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								
								<div class="note-red-small">* 최대 6명 선택 가능</div>
							</div>
						</div>
						<div class="divider-vertical"></div>
						<div class="flex-1 flex-col-center pl-120">
							<div style="margin-bottom: 5px;">
								<span>연플릭스 <c:out value="${movieInfo.theater}" default="" /></span>
								&nbsp;|&nbsp; <span>IMAX관</span> &nbsp;|&nbsp; <span>남은좌석
									<span style="color: red;"><c:out
											value="${movieInfo.remainSeats}" default="136" /></span>/140
								</span>
							</div>
							<div class="schedule-time">
								<c:out value="${movieInfo.date}" default="2025.05.17 (토)" />
								&nbsp; <span><c:out value="${movieInfo.time}"
										default="09:20 ~ 12:19" /></span>
							</div>
						</div>
					</div>
				</div>

				<div class="screen-container">
					<div class="screen">SCREEN</div><br><br>
					<div class="seat-layout">
						<c:forEach var="i" begin="1" end="10">
							<c:set var="rowLetter"
								value="${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', i - 1, i)}" />
							<div class="row">
								<span class="row-label">${rowLetter} </span>
								<c:forEach var="j" begin="1" end="14">
									<c:choose>
										<c:when test="${i == 5 && j >= 7 && j <= 10}">
											<div class="seat occupied" data-row="${rowLetter}"
												data-col="${j}">${j}</div>
										</c:when>
										<c:otherwise>
											<div class="seat" data-row="${rowLetter}" data-col="${j}">${j}</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
					<br>
					<div class="legend-container">
						<div class="legend-item">
							<div class="seat selected"></div>
							선택됨
						</div>
						<div class="legend-item">
							<div class="seat"></div>
							일반
						</div>
						<div class="legend-item">
							<div class="seat occupied"></div>
							예매됨
						</div>
					</div>
				</div>

				<div class="reservation-nav">
					<div class="nav-left">
						<span class="back-arrow">&#8592;</span> 뒤로
					</div>
					<div class="nav-center">
						<div class="movie-poster"></div>
						<div class="movie-info">
							<div class="movie-title">미션 임파서블:파이널 레코닝</div>
							<div>액션</div>
							<div>169분</div>
							<div>15세 이용가</div>
							<div>좌석: K10</div>
							<div>가격: 14000원</div>
						</div>
					</div>
					<div class="nav-right">
						<span class="checkmark">&#10003;</span> 결제하기
					</div>
				</div>
			</div>
			<br><br>
			<div class="main-banner">
				<img
					src="http://localhost/movie_prj/common/img/banner/banner1.png"
					style="width: 100%;">
			</div><br><br>
		</div>

	</main>
	<footer>
		<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp" />
	</footer>
</body>


</html>
