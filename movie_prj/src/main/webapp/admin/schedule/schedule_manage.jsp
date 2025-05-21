<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="http://localhost/movie_prj/common/jsp/admin_header.jsp" />
<%
SimpleDateFormat sdf = new SimpleDateFormat("M/d E");
Calendar cal = Calendar.getInstance();

String[] tabs = new String[7];
for (int i = 0; i < 7; i++) {
	tabs[i] = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 1);
}

pageContext.setAttribute("tabs", tabs);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스케줄 관리</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp" />
<link rel="stylesheet"
	href="http://localhost/movie_prj/common/css/admin.css">
<link rel="stylesheet"
	href="http://localhost/movie_prj/admin/schedule/css/schedule.css" />
<style type="text/css">
</style>
<script>
	$(function() {
		$('#openModalBtn').click(function() {
			$('#modal').fadeIn();
		});

		$('.close').click(function() {
			$('#modal').fadeOut();
		});
		
		$('.tab').click(function(){
			var idx = $(".tab").index(this);
			$(".tab").removeClass("active");
			$(".tab").eq(idx).addClass("active");
		});
		
		$("#submit-btn").click(function(){
			
		})

	});
	
</script>
</head>
<body>
	<div class="content-container">
		<h2>상영스케줄 목록</h2>
		<div class="tabs">
			<c:forEach var="tab" items="${tabs}" varStatus="i">
				<div class="tab ${i.index==0 ? 'active' : '' }">${tab}</div>
			</c:forEach>
		</div>
		<br>
		<div class="filter">
			<label>상영관 : </label> <select>
				<option>IMAX 상영관</option>
				<option>2관</option>
				<option>3관</option>
			</select>
		</div>
		<br>
		<table>
			<thead>
				<tr>
					<th>영화제목</th>
					<th>시작 시간</th>
					<th>종료 시간</th>
					<th>상태</th>
					<th>예매내역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="#">썬더볼츠</a></td>
					<td>08:00</td>
					<td>10:00</td>
					<td>상영종료</td>
					<td><button class="btn-detail">자세히</button></td>
				</tr>
				
			</tbody>
		</table>
		<div style="text-align: center;">
			<button id="openModalBtn" class="submit-btn">상영 등록</button>
		</div>
	</div>
</body>

<div id="modal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<h2>상영 등록</h2>
		<div class="register-container">
			<form action="schedule_process.jsp" id="schedule-form" name="schedule-form" method="get">
				<div class="form-group form-inline">
					<label for="title">제목</label> <select id="title" name="">
						<option>썬더볼츠*</option>
						<option>영화 A</option>
						<option>영화 B</option>
					</select> <label for="theater">상영관</label> <select id="theater">
						<option>IMAX 상영관</option>
						<option>2관</option>
						<option>3관</option>
					</select>
				</div>
				<div class="form-group">
					<label for="date">날짜</label> <input type="date" id="date">
				</div>
				<div class="form-group">
					<label for="time">시작 시간</label> <input type="time" id="time">
				</div>
				<div style="text-align: center;">
					<button class="submit-btn" id="submit-btn">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</html>
