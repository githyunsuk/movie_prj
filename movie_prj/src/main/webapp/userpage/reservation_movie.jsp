<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<c:import url="http://localhost/movie_prj/common/jsp/external_file.jsp"/>
<style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 800px;
      margin: auto;
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .title {
      text-align: center;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .info {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
      font-size: 14px;
    }

    .screen {
      text-align: center;
      background: #333;
      color: white;
      padding: 8px;
      margin: 20px 0 10px;
    }

    .seats {
      display: grid;
      grid-template-columns: repeat(11, 1fr);
      gap: 5px;
      justify-content: center;
    }

    .row-label {
      grid-column: span 1;
      text-align: center;
      font-weight: bold;
      padding-top: 10px;
    }

    .seat {
      width: 30px;
      height: 30px;
      background: #ddd;
      border-radius: 4px;
      text-align: center;
      line-height: 30px;
      cursor: pointer;
    }

    .seat.selected {
      background: red;
      color: white;
    }

    .seat.booked {
      background: lightgray;
      cursor: not-allowed;
    }

    .seat.unavailable {
      background: #ccc;
      color: #999;
      cursor: not-allowed;
    }

    .legend {
      display: flex;
      gap: 20px;
      margin-top: 15px;
      font-size: 14px;
    }

    .legend div {
      display: flex;
      align-items: center;
    }

    .legend-box {
      width: 20px;
      height: 20px;
      margin-right: 5px;
    }

    .red { background: red; }
    .gray { background: lightgray; }
    .xmark { background: #ccc; color: white; text-align: center; font-size: 14px; }

    .footer {
      text-align: center;
      margin-top: 20px;
    }

    button {
      background: red;
      color: white;
      border: none;
      padding: 10px 20px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>

</head>

<body>
<header>
    <c:import url="http://localhost/movie_prj/common/jsp/header.jsp"/>
</header>

<main>
<div id="container">
<div class="title">인원/좌석 선택</div>

    <div class="info">
      <div>쌍용극장 강남 | 2관 6층</div>
      <div>2025.04.29 (화) 19:10 ~ 22:10</div>
    </div>

    <div class="screen">SCREEN</div>

    <div class="seats">
      <div class="row-label">A</div>
      <div class="seat unavailable">X</div>
      <div class="seat unavailable">X</div>
      <div class="seat">3</div>
      <div class="seat">4</div>
      <div></div><div></div><div></div>
      <div class="seat">1</div>
      <div class="seat unavailable">X</div>
      <div class="seat unavailable">X</div>

      <div class="row-label">B</div>
      <div class="seat">1</div>
      <div class="seat">2</div>
      <div class="seat">3</div>
      <div class="seat">4</div>
      <div></div><div></div><div></div>
      <div class="seat">1</div>
      <div class="seat">2</div>
      <div class="seat">3</div>

      <div class="row-label">C</div>
      <div class="seat selected">1</div>
      <div class="seat selected">2</div>
      <div class="seat selected">3</div>
      <div class="seat">4</div>
      <div></div><div></div><div></div>
      <div class="seat">1</div>
      <div class="seat">2</div>
      <div class="seat">3</div>
    </div>

    <div class="legend">
      <div><div class="legend-box red"></div>선택</div>
      <div><div class="legend-box gray"></div>예매 완료</div>
      <div><div class="legend-box xmark">X</div>선택불가</div>
</div>
</main>

<footer>
    <c:import url="http://localhost/movie_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
