<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="Main template page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://localhost/movie_prj/common/css/reset.css">
<link rel="stylesheet"
	href="http://localhost/movie_prj/common/css/reservation.css">
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />

<style>
</style>

<script type="text/javascript">
	let days;

	$(function() {
		days = $(".day_list");

		$(".btn_prev").on("click", function() {
			let idx = getCurrentIndex();
			if (idx > 0)
				updateActive(idx - 1);
		});

		$(".btn_next").on("click", function() {
			let idx = getCurrentIndex();
			if (idx < days.length - 1)
				updateActive(idx + 1);
		});

		$(".day_list").on("click", function() {
			const idx = days.index(this);
			updateActive(idx);
		});
	});

	function updateActive(index) {
		days.removeClass("on");
		days.eq(index).addClass("on");
	}

	function getCurrentIndex() {
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
								<li>
									<div class="day_list on">
										<span>5월<br> <em>목</em></span> <strong>15</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>금</em></span> <strong>16</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>토</em></span> <strong>17</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>일</em></span> <strong>18</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>월</em></span> <strong>19</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>화</em></span> <strong>20</strong>
									</div>
								</li>
								<li>
									<div class="day_list">
										<span>5월<br> <em>수</em></span> <strong>21</strong>
									</div>
								</li>
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
							<div class="rating">15</div>
							<div class="status">상영중</div>
							<div class="meta">세븐 베일즈 | 드라마 / 110분 / 2025.05.14 개봉</div>
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
							<div class="rating">15</div>
							<div class="status">상영중</div>
							<div class="meta">세븐 베일즈 | 드라마 / 110분 / 2025.05.14 개봉</div>
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
				<img
					src="http://localhost/movie_prj/common/img/reservationBanner2.png"
					style="width: 100%;">
			</div>
			<br> <br>
		</div>

	</main>

	<footer>
		<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>
