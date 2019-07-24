<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- header -->
<div id="header">
	<div id="header_box">
		<!-- header logo -->
		<div id="header_logo">
			<a href="../"><img alt="로고" src="../resources/images/logo.png"></a>
		</div>
		
		
		<div id="right_menu">
		<!-- header 메뉴 -->
		<div id="header_menu">
			<ul>
				<li><a href="../reserve/reserveInfo">진료예약/조회</a></li>
				<li><a href="../news/newsAll">건강뉴스</a></li>
				<li><a href="../notice/noticeList">병원안내</a></li>
				<li><a href="">고객의 소리</a></li>
				<li id="last_menu"><a href="">주말약국</a></li>			
			</ul>
		</div>
		
		<!-- login / join -->
		<div id="member">
			<ul>
				<c:choose>
					<c:when test="${not empty memberVO}">
						<li><a href="../member/memberLogout">로그아웃</a></li>
						<li style="padding: 0 10px;">│<li>
						<li><a href="../member/memberMyPage">마이페이지</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="../member/memberLogin">로그인</a></li>
						<li style="padding: 0 10px;">│<li>
						<li><a href="../member/memberAgree">회원가입</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</div>
	</div>
</div>

<!-- 서브메뉴 -->

<div id="sub_nav">

<c:choose>
	<c:when test="${not empty memberVO}">
		<div id="sub_nav_box" style="padding-left: 820px;">
	</c:when>
	<c:otherwise>
		<div id="sub_nav_box" style="padding-left: 845px;">
	</c:otherwise>
</c:choose>
		<ul id="ul_1">
			<li><a href="../reserve/reserveNomal">일반진료 예약</a></li>
			<li><a href="../reserve/reserveMedical">건강검진 예약</a></li>
		</ul>
		<ul id="ul_2">
			<li><a href="">질환 정보</a></li>
			<li><a href="">영양 정보</a></li>
			<li><a href="">운동 정보</a></li>
		</ul>
		<ul id="ul_3">
			<li><a href="../notice/noticeList">공지사항</a></li>
			<li><a href="">병원소개</a></li>
			<li><a href="">의료진 소개</a></li>
			<li><a href="">층별 안내</a></li>
			<li><a href="">오시는 길</a></li>
		</ul>
		<ul id="ul_4">
			<li><a href="">건의합니다</a></li>
			<li><a href="">칭찬합니다</a></li>
			<li><a href="">질문과답변</a></li>
		</ul>
	</div>
</div>
<!-- header 끝 -->