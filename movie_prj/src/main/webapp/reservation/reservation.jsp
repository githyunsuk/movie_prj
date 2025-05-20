<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
List<Map<String, String>> dateList = new ArrayList<>();
SimpleDateFormat monthSdf = new SimpleDateFormat("M월");
SimpleDateFormat daySdf = new SimpleDateFormat("d");
SimpleDateFormat weekSdf = new SimpleDateFormat("E");

Calendar cal = Calendar.getInstance();

for (int i = 0; i < 7; i++) {
	Map<String, String> dateMap = new HashMap<>();
	dateMap.put("month", monthSdf.format(cal.getTime()));
	dateMap.put("day", daySdf.format(cal.getTime()));
	dateMap.put("week", weekSdf.format(cal.getTime()));
	dateList.add(dateMap);
	cal.add(Calendar.DATE, 1);
}

request.setAttribute("dateList", dateList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />
<link rel="stylesheet"
	href="http://localhost/movie_prj/reservation/reservation.css/reservation.css">
<style>
</style>
<script type="text/javascript">
	$(function() {
		days = $(".day_list");

		$(".btn_prev").click(function() {
			var days = $(".day_list");
			var idx = getCurrentIdx(days)
			if (idx > 0) {
				updateActive(days, idx - 1);
			}
		});

		$(".btn_next").click(function() {
			var days = $(".day_list");
			var idx = getCurrentIdx(days);
			if (idx < days.length - 1)
				updateActive(days, idx + 1);
		});

		$(".day_list").click(function() {
			var days = $(".day_list");
			var idx = days.index(this);
			updateActive(days, idx);
		});

		//상영시간 버튼 클릭시 예매페이지로 이동
		$(".showtime").click(function() {
			location.href = "http://localhost/movie_prj/reservation/reservation_seat.jsp";
		});

		//관람등급 클릭시
		$(".grade").click(function() {
			$("#gradeModal").fadeIn();
		});

		// 닫기 버튼 클릭 시 모달 닫기
		$(".close").click(function() {
			$("#gradeModal").fadeOut();
		});

		// 모달 바깥 클릭 시 닫기
		$(window).click(function(e) {
			if ($(e.target).is("#gradeModal")) {
				$("#gradeModal").fadeOut();
			}
		});
	});

	function updateActive(days, idx) {
		days.removeClass("on");
		days.eq(idx).addClass("on");
	}

	function getCurrentIdx(days) {
		return days.index(days.filter(".on"));
	}
</script>
</head>
<body>
	<header>
		<c:import url="http://localhost/movie_prj/common/jsp/header.jsp" />
	</header>

	<main>
		<div id="container">
			<h1 style="font-size: 40px; font-weight: bold;">상영스케줄</h1>
			<section class="schedule">
				<div class="timetable">
					<div class="date">
						<div class="date_list">
							<div class="btn btn_prev"></div>
							<ul class="day">
								<c:forEach var="day" items="${dateList}" varStatus="i">
									<li>
										<div class="day_list ${i.index == 0 ? 'on' : ''}">
											<span>${day.month}<br> <em>${day.week}</em></span> <strong>${day.day}</strong>
										</div>
									</li>
								</c:forEach>
							</ul>
							<div class="btn btn_next"></div>
						</div>

						<ul class="desc">
							<li class="grade"><a href="#none">관람등급 안내</a></li>
						</ul>
					</div>

					<div class="timezone">
						<p>* 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.</p>
					</div>
					<br> <br>
					<!-- Movie items -->
					<div class="movie-item">
						<div class="movie-info">
							<div>
								<img src="http://localhost/movie_prj/common/img/icon_12.svg" />&nbsp
							</div>
							<div class="movie-name">세븐 베일즈</div>
							<div class="meta">
								<span class="status">상영중</span> | 드라마 / 110분 / 2025.05.14 개봉
							</div>
						</div>

						<div class="theater-block">
							<div class="theater-info">2D | 2관 6층 (Laser) | 총 123석</div>
							<div class="showtimes">
								<div class="showtime">
									20:50<br> <span>116석</span>
								</div>
								<div class="showtime">
									23:20<br> <span>122석</span>
								</div>
							</div>
						</div>

						<div class="theater-block">
							<div class="theater-info">2D | 5관 10층 (Laser) | 총 172석</div>
							<div class="showtimes">
								<div class="showtime">
									17:40<br> <span>168석</span>
								</div>
							</div>
						</div>
						<br> <br>
					</div>
					<br> <br>
					<div class="movie-item">
						<div class="movie-info">
							<div>
								<img src="http://localhost/movie_prj/common/img/icon_15.svg" />&nbsp
							</div>
							<div class="movie-name">미션 임파서블:파이널 레코닝</div>
							<div class="meta">
								<span class="status">상영중</span> | 드라마 / 110분 / 2025.05.14 개봉
							</div>
						</div>

						<div class="theater-block">
							<div class="theater-info">2D | 2관 6층 (Laser) | 총 123석</div>
							<div class="showtimes">
								<div class="showtime">
									20:50<br> <span>116석</span>
								</div>
								<div class="showtime">
									23:20<br> <span>122석</span>
								</div>
							</div>
						</div>

						<div class="theater-block">
							<div class="theater-info">2D | 5관 10층 (Laser) | 총 172석</div>
							<div class="showtimes">
								<div class="showtime">
									17:40<br> <span>168석</span>
								</div>
							</div>
						</div>
						<br> <br>
					</div>
					<br> <br>

					<p class="info_screen">[공지]입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후
						상영이 시작됩니다.</p>
				</div>
			</section>
			<br> <br>
			<div class="main-banner">
				<img src="http://localhost/movie_prj/common/img/banner/banner3.png"
					style="width: 100%;">
			</div>
			<br> <br>
		</div>

	</main>

	<footer>
		<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp" />
	</footer>
</body>
<!-- 관람등급 안내 모달창 -->
<div id="gradeModal" class="modal">
	<div class="modal-content">
		<div class="modal-header">
			CGV 관람 등급 안내 <span class="close">&times;</span>
		</div>
		<div class="modal-body">
			<table class="grade-table">
				<thead>
					<tr>
						<th>구분</th>
						<th>설명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="grade-label"><img
							src="http://localhost/movie_prj/common/img/icon_all.svg" />전체
							관람가</td>
						<td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>
					</tr>
					<tr>
						<td class="grade-label"><img
							src="http://localhost/movie_prj/common/img/icon_12.svg" />12세
							관람가</td>
						<td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
					</tr>
					<tr>
						<td class="grade-label"><img
							src="http://localhost/movie_prj/common/img/icon_15.svg" />15세
							관람가</td>
						<td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
					</tr>
					<tr>
						<td class="grade-label-19"><img
							src="http://localhost/movie_prj/common/img/icon_18.svg" />청소년관람불가</td>
						<td>만 19세 미만(영/유아 포함)은 보호자가 동반하여도 관람이 불가합니다.<br> (단,
							만19세가 되는 해의 1월 1일을 맞이한 사람은 예외)<br> <br> - 입장 시 신분증을 꼭
							지참하시기 바랍니다<br> - 신분증(사진/캡처 불가)<br> 주민등록증, 운전면허증, 여권,
							모바일신분증(PASS, 정부24 등)
						</td>
					</tr>
					<tr>
						<td class="grade-label"><img
							src="http://localhost/movie_prj/common/img/icon_none.svg" /></span>미정</td>
						<td>등급 미정 영화입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</html>