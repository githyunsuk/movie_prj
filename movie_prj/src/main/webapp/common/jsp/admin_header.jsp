<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="sidebar">
	<!-- 사이드바 -->
    <!-- 로고 영역 -->
    <div class="logo-container">
        <div class="logo-img">
            <img src="http://localhost/movie_prj/common/img/logo.png" alt="메인 로고" />
        </div>
        <div class="logo-text">관리자 페이지</div>
    </div>
    
    <!-- 프로필 영역 -->
    <div class="profile-container">
        <div class="profile-img">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
        </div>
        <div class="profile-info">
            <span class="profile-title">관리자</span>
            <span class="profile-name">[운영자 이름]</span>
        </div>
    </div>
    
    <!-- 메뉴 영역 -->
    <div class="menu-category">
        <div class="menu-title">관리자 관리</div>
        <div class="menu-item"><span>▶</span>관리자 목록</div>
    </div>
    <div class="menu-category">
        <div class="menu-title">회원 관리</div>
        <div class="menu-item"><span>▶</span>회원 목록</div>
    </div>
    <div class="menu-category">
        <div class="menu-title">상영관 관리</div>
        <div class="menu-item"><a href="http://localhost/movie_prj/admin/theater/theater_manage.jsp"><span>▶</span>상영관 목록</a></div>
    </div>
    <div class="menu-category">
        <div class="menu-title">영화관리</div>
        <div class="menu-item"><span>▶</span>영화 리스트</div>
        <div class="menu-item"><span>▶</span>영화 등록</div>
        <div class="menu-item"><span>▶</span>영화 리뷰 관리</div>
    </div>
    <div class="menu-category">
        <div class="menu-title">상영관리</div>
        <div class="menu-item"><a href="http://localhost/movie_prj/admin/schedule/schedule_manage.jsp"><span>▶</span>상영스케줄 목록</a></div>
    </div>
    <div class="menu-category">
        <div class="menu-title">문의관리</div>
        <div class="menu-item"><span>▶</span>공지사항</div>
        <div class="menu-item"><span>▶</span>1:1문의</div>
    </div>
</div>
 	<!-- 상단 버튼 영역  -->
<div class="header-container">
    <div class="header-buttons">
        <a href="#" class="header-button">
            <img src="http://localhost/movie_prj/common/img/home_icon.png" alt="홈 아이콘" class="button-icon">
            메인으로
        </a>
        <a href="#" class="header-button">
            <img src="http://localhost/movie_prj/common/img/signOut_icon.png" alt="로그아웃 아이콘" class="button-icon">
            로그아웃
        </a>
    </div>
</div>
