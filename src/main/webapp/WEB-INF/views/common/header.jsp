<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<a id="top_btn" href="#">
	<img src="../resources/images/top.png">
</a>

<script>

$(function() {
	$(window).scroll(function() {
	    if ($(this).scrollTop() > 400) {
	        $('#top_btn').fadeIn();
	    } else {
	        $('#top_btn').fadeOut();
	    }
	});
	
	$("#top_btn").click(function() {
	    $('html, body').animate({
	        scrollTop : 0
	    }, 400);
	    return false;
	});
});


</script>

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
				<li><a href="../qna/complaint">고객의 소리</a></li>
				<li><a href="../community/communityList">커뮤니티</a></li>
				<li id="last_menu"><a href="../pharmacy/pharmacyInfo">약국</a></li>			
			</ul>
		</div>
		
		<!-- login / join -->
		<div id="member">
			<ul>
				<c:choose>
					<c:when test="${not empty memberVO.id}">
						<c:choose>	
							<c:when test="${memberVO.grade eq '2'}">
								<li><a href="../member/memberLogout">로그아웃</a></li>
								<li style="padding: 0 10px;">│<li>
								<li><a href="../admin/adminIndex" target="_blank">관리자페이지</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="../member/memberLogout">로그아웃</a></li>
							<li style="padding: 0 10px;">│<li>
							<li><a href="../member/memberMyPage">마이페이지</a></li>
							</c:otherwise>
						</c:choose>
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
		<c:when test="${not empty memberVO.id}">
			<c:choose>
				<c:when test="${memberVO.grade eq '2'}">
					<div id="sub_nav_box" style="padding-left: 688px;">
				</c:when>
				<c:otherwise>
				<div id="sub_nav_box" style="padding-left: 702px;">
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div id="sub_nav_box" style="padding-left: 726px;">
		</c:otherwise>
	</c:choose>
		<ul id="ul_1">
			<li><a href="../reserve/reserveNomal">일반진료 예약</a></li>
			<li><a href="../reserve/reserveMedical">건강검진 예약</a></li>
		</ul>
		<ul id="ul_2">
			<li><a href="../news/disease">질환 정보</a></li>
			<li><a href="../news/nutrition">영양 정보</a></li>
			<li><a href="../news/exercise">운동 정보</a></li>
		</ul>
		<ul id="ul_3">
			<li><a href="../notice/noticeList">공지사항</a></li>
			<li><a href="../hospital/hospitalInfo">병원소개</a></li>
			<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
			<li><a href="../hospital/floorInfo">층별 안내</a></li>
			<li><a href="../hospital/location">오시는 길</a></li>
		</ul>
		<ul id="ul_4">
			<li><a href="../qna/complaint">건의합니다</a></li>
			<li><a href="../qna/praise">칭찬합니다</a></li>
			<li><a href="../qna/qna">질문과답변</a></li>
		</ul>
	</div>
</div>
<!-- header 끝 -->