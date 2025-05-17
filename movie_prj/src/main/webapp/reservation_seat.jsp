<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 좌석 예매</title>
<c:import url="http://localhost/movie_prj/common/external_file.jsp" />
<style>
#container {
	min-height: 650px;
	margin-top: 30px;
	margin-left: 20px
}

/* 좌석 예매 시스템 스타일 */
.seat-reservation-container {
	max-width: 950px;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.seat-header {
	background-color: #333;
	color: white;
	padding: 15px;
	text-align: center;
}

.screen-container {
	background-color: #f5f5f0;
	padding: 20px;
	text-align: center;
}

.screen {
	background-color: #e0e0d6;
	padding: 10px;
	width: 70%;
	margin: 0 auto 30px;
	text-align: center;
	color: #333;
	font-weight: bold;
}

.seat-layout {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 0 auto;
	width: 70%;
}

.row {
	display: flex;
	margin-bottom: 5px;
	justify-content: center;
}

.seat {
	width: 25px;
	height: 25px;
	margin: 3px;
	border: 1px solid #ccc;
	background-color: #666666;
	cursor: pointer;
}

.seat.selected {
	background-color: #D20000;
}

.seat.occupied {
	background-color: #BBBBBB;
}

.reservation-nav {
	display: flex;
	background-color: #000;
	color: white;
	height: 80px;
}

.nav-left {
	width: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #333;
	cursor: pointer;
}

.nav-center {
	width: 60%;
	display: flex;
	padding: 10px;
}

.movie-poster {
	width: 60px;
	height: 60px;
	background-color: #444;
	margin-right: 10px;
}

.movie-info {
	color: white;
	font-size: 12px;
}

.movie-title {
	font-weight: bold;
	margin-bottom: 5px;
}

.nav-right {
	width: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #b32525;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

.back-arrow {
	font-size: 24px;
	font-weight: bold;
	margin-right: 5px;
}

.checkmark {
	font-size: 24px;
	margin-right: 5px;
}

.seat {
	width: 25px;
	height: 25px;
	margin: 3px;
	border: 1px solid #ccc;
	cursor: pointer;
	font-size: 10px;
	display: flex;
	justify-content: center; /* 가로 중앙 */
	align-items: center; /* 세로 중앙 */
	color: white;
}
</style>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="/main.js"></script>
<script type="text/javascript">
	IMP.init("imp03140165");

	$(function() {
		$('.seat').click(function() {
			if (!$(this).hasClass('occupied')) {
				$(this).toggleClass('selected');
			}

		});

		$('.nav-left').click(function() {
			location.href = "http://localhost/movie_prj/reservation.jsp";
		});

		$('.nav-right').click(function() {
		    const selectedSeats = [];

		    $('.row').each(function(rowIdx) {
		        $(this).find('.seat.selected').each(function() {
		            const seatIdx = $(this).index() - 1; // 맨 앞 span 때문에 -1 보정
		            selectedSeats.push({
		                row: rowIdx,
		                seat: seatIdx
		            });
		        });
		    });

		    if (selectedSeats.length > 0) {
		        IMP.request_pay({
		            pg: "kakaopay",
		            pay_method: "card",
		            amount: "500000000",
		            name: "람보르기니",
		            merchant_uid: "merchant_" + new Date().getTime()
		        }, function(response) {
		            if (response.success) {
		                alert("결제 성공!");
		            } else {
		                alert("결제 실패: " + response.error_msg);
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
		<c:import url="http://localhost/movie_prj/common/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div class="seat-reservation-container">
				<div class="seat-header">인원/좌석</div>
				<div
					style="background-color: #f3f0eb; padding: 15px; border-bottom: 1px solid #ccc; font-size: 14px;">
					<!-- 전체를 감싸는 flex 컨테이너 -->
					<div
						style="display: flex; justify-content: space-between; gap: 20px;">

						<!-- 인원 선택 -->
						<div style="flex: 1;">
							<div style="display: flex; gap: 20px; align-items: center;">
								<div>
									<div style="margin-bottom: 5px;">일반</div>
									<div>
										<c:forEach var="i" begin="0" end="6">
											<button
												style="margin-right: 3px; width: 28px; height: 28px; background-color: #eee; border: 1px solid #aaa;">${i}</button>
										</c:forEach>
									</div>
								</div>
								<div style="color: red; font-size: 12px;">* 최대 6명 선택 가능</div>
							</div>
						</div>

						<div style="width: 1px; background-color: #ccc;"></div>

						<!-- 영화 정보 -->
						<div
							style="flex: 1; display: flex; flex-direction: column; justify-content: center; padding-left: 120px;">
							<div style="font-weight: bold; margin-bottom: 5px;">
								<span>연플릭스 <c:out value="${movieInfo.theater}"
										default="" /></span> &nbsp;|&nbsp; <span>IMAX관</span>
								&nbsp;|&nbsp; <span>남은좌석 <span style="color: red;"><c:out
											value="${movieInfo.remainSeats}" default="136" /></span>/140
								</span>
							</div>
							<div style="font-size: 18px;">
								<c:out value="${movieInfo.date}" default="2025.05.17 (토)" />
								&nbsp; <span><c:out value="${movieInfo.time}"
										default="09:20 ~ 12:19" /></span>
							</div>
						</div>
					</div>
				</div>


				<div class="screen-container">
					<div class="screen">SCREEN</div>

					<div class="seat-layout">
						<c:forEach var="i" begin="1" end="10">
							<c:set var="rowLetter"
								value="${fn:substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ', i - 1, i)}" />
							<div class="row">
								<span
									style="width: 20px; display: inline-block; margin-top: 5px;">
									${rowLetter} </span>
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
					<div
						style="display: flex; justify-content: center; gap: 20px; margin-top: 10px;">
						<div style="display: flex; align-items: center; gap: 5px;">
							<div class="seat"></div>
							<span>선택 가능</span>
						</div>
						<div style="display: flex; align-items: center; gap: 5px;">
							<div class="seat selected"></div>
							<span>선택 됨</span>
						</div>
						<div style="display: flex; align-items: center; gap: 5px;">
							<div class="seat occupied"></div>
							<span>선택 불가</span>
						</div>

					</div>
					<br> <br>

					<div class="reservation-nav">
						<div class="nav-left">
							<div class="back-arrow">←</div>
							<div>영화선택</div>
						</div>
						<div class="nav-center">
							<div class="movie-poster">
								<c:if test="${not empty movieInfo.poster}">
									<img src="<c:out value='${movieInfo.poster}'/>" alt="영화 포스터"
										width="60" height="60">
								</c:if>
								<c:if test="${empty movieInfo.poster}">
									<div style="width: 60px; height: 60px; background-color: #444;"></div>
								</c:if>
							</div>
							<div class="movie-info">
								<div class="movie-title">
									<c:out value="${movieInfo.title}" default="공조2-인터내셔널" />
								</div>
								<div>
									극장:
									<c:out value="${movieInfo.theater}" default="CGV 강남" />
								</div>
								<div>
									일시:
									<c:out value="${movieInfo.date}" default="20220915" />
								</div>
							</div>
						</div>
						<div class="nav-right">
							<div class="checkmark">✓</div>
							<div id="payment">결제하기</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</main>
	<footer>
		<c:import url="http://localhost/movie_prj/common/footer.jsp" />
	</footer>
</body>
</html>