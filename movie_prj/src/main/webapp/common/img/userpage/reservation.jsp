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
	href="http://localhost/movie_prj/common/css/schedule.css"> 
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />
<style>
#container {
	min-height: 650px;
	margin-top: 30px;
	margin-left: 20px
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<header>
		<c:import url="http://localhost/movie_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<section class="schedule">

				<div class="timetable">
					<div class="date">
						<div class="date_list">
							<div class="btn btn_prev"></div>
							<ul class="day">
								<li><a href="#none">
										<div class="day_list on">
											<span>11월<br> <em>수</em></span> <strong>19</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>목</em></span> <strong>20</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>금</em></span> <strong>21</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>토</em></span> <strong>22</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>일</em></span> <strong>23</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>월</em></span> <strong>24</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>화</em></span> <strong>25</strong>
										</div>
								</a></li>
								<li><a href="#none">
										<div class="day_list">
											<span>11월<br> <em>수</em></span> <strong>26</strong>
										</div>
								</a></li>
							</ul>
							<div class="btn btn_next"></div>
						</div>

						<div class="grade_popup">
							<div class="grade_tit">
								<h5>
									CGV 관람 등급 안내 <a href="#none" class="grade_close">닫기</a>
								</h5>
							</div>
							<div class="grade_txt">
								<table class="grade_table">
									<thead>
										<tr>
											<th>구분</th>
											<th>성명</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th><img src="../img/sub/theater/icon_all.svg" alt="">전체
												관람가</th>
											<td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>
										</tr>
										<tr>
											<th><img src="../img/sub/theater/icon_12.svg" alt="">12세
												관람가</th>
											<td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
										</tr>
										<tr>
											<th><img src="../img/sub/theater/icon_15.svg" alt="">15세
												관람가</th>
											<td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
										</tr>
										<tr>
											<th><img src="../img/sub/theater/icon_18.svg" alt="">청소년관람불가</th>
											<td>만 18세 미만의 고객님은 보호자를 동반하셔도 관람하실 수 없습니다.<br> -
												입장시 신분증을 꼭 지참하시기 바랍니다.<br> - 만 18세 이상이더라도 고등학교 재학중인 경우
												관람이 불가합니다. <br>
											</td>
										</tr>
										<tr>
											<th><img src="../img/sub/theater/icon_none.svg" alt="">미정</th>
											<td>등급 미정 영화입니다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<ul class="desc">
							<li class="price"><a href="">관람가격 안내</a></li>
							<li class="grade"><a href="#none">관람등급 안내</a></li>
						</ul>
					</div>


					<div class="infowrapbox">
						<div class="wrapboxinf">
							<ul class="info">
								<li>
									<div class="info_movie">
										<div class="movienamewrap">
											<img src="../img/age_12.png" alt="" class="movieAge">
											<div class="movieName">
												<a href="#none">프레디의 피자가게</a> <span class="onair">상영중</span>
												<span class="movieDesc">호러, 스릴러/ 109분/ 2023.11.15 개봉</span>
											</div>
										</div>

										<div class="type_hall">
											<ul class="info_hall">
												<li>2D</li>
												<li>3관 8층</li>
												<li>총 172석</li>
											</ul>
											<ul class="info_time">
												<li><a href="#none"> <em>11:30</em> <span
														class="seat">172석</span>
												</a></li>
											</ul>
											<ul class="info_hall">
												<li>2D</li>
												<li>5관 10층 (Laser)</li>
												<li>총 124석</li>
											</ul>
											<ul class="info_time">
												<li><a href="#none"> <em>16:50</em> <span
														class="seat">124석</span>
												</a></li>
											</ul>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<p class="info_screen">ㆍ입장 지연에 따른 관람 불편을 최소화하기 위해 영화는 10분 후 상영이
						시작됩니다.</p>
				</div>


			</section>
		</div>
	</main>
	<footer>
		<c:import url="http://localhost/movie_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>