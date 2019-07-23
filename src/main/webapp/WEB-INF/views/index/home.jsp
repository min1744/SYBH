<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>쌍용백병원 - 병원 진료 예약 서비스</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link href="./resources/css/home.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link type="text/css" rel="stylesheet" href="./resources/css/jquery.bxslider.css" />
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<script type="text/javascript">

$(function() {
	
	$('#header_menu li').mouseover(
	  function() {
		  $('#sub_nav').stop().slideDown(350);
		  
	  }
	);
	
	$('#sub_nav').mouseleave(
			 
		function() {
			 $(this).stop().slideUp(350);
		 }
	);
	
	$('.slide').bxSlider({
		auto: true, 
		speed: 500, 
		pause: 4000, 
		mode:'fade',
		pager:true,
	});
	
	
	/////////////////////플로팅코드
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
	
	
	//////////////////TOP버튼 효과
    
    $("#top").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
	
	
    $('#spon_btn').click(function(event){  //버튼을 클릭 했을시 popupOpen 함수 출력 
        popupOpen();	//Popup Open 함수
    });
  
	function popupOpen(){
		var url= "./donation/donationPopup";    //팝업창 페이지 URL
		var winWidth = 573;
	    var winHeight = 800;
	    var popupX = 700;
	    console.log(popupX);
	  	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		 var popupY= 80;
	 	 //&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+popupX+", top="+popupY;    //팝업창 옵션(optoin)

	  	//window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
	    
	    window.open(url,"",popupOption, 'left='+ popupX + ', top='+ popupY);
	    
	}
	
	

	
}); 

</script>
<body>
<!-- header -->
<div id="header">
	<div id="header_box">
		<!-- header logo -->
		<div id="header_logo">
			<a href=""><img alt="로고" src="./resources/images/logo.png"></a>
		</div>
		
		
		<div id="right_menu">
		<!-- header 메뉴 -->
		<div id="header_menu">
			<ul>
				<li><a href="">진료예약/조회</a></li>
				<li><a href="">건강뉴스</a></li>
				<li><a href="./notice/noticeList">병원안내</a></li>
				<li><a href="">고객의 소리</a></li>
				<li id="last_menu"><a href="">주말약국</a></li>			
			</ul>
		</div>
		
		<!-- login / join -->
		<div id="member">
			<ul>
				<li><a href="./member/memberLogin">로그인</a></li>
				<li style="padding: 0 10px;">│<li>
				<li><a href="./member/memberAgree">회원가입</a></li>
			</ul>
		</div>
		</div>
	</div>
</div>

<!-- 서브메뉴 -->

<div id="sub_nav">
	<div id="sub_nav_box">
		<ul id="ul_1">
			<li><a href="">일반진료 예약</a></li>
			<li><a href="">건강검진 예약</a></li>
		</ul>
		<ul id="ul_2">
			<li><a href="">질환 정보</a></li>
			<li><a href="">영양 정보</a></li>
			<li><a href="">운동 정보</a></li>
		</ul>
		<ul id="ul_3">
			<li><a href="./notice/noticeList">공지사항</a></li>
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


<div id="floatMenu">
	
	<div id="floating_img">
		<img src="./resources/images/nav_img.png">
	</div>
	
	<div id="sponsor">
		
		<p class="spon_title">모인금액</p>
		<p class="spon_num">1,000,000<span>원</span></p>
		<p class="spon_title">후원자</p>
		<p class="spon_num">140<span>명</span></p>
		<button id="spon_btn">후원하기</button>
		
	</div>
	
	<div id="top_btn">
	
		<a id="top" href="#">TOP<span>▲</span></a>
	
	</div>

</div>

<div id="contents">

		<!-- 메인 슬라이드 -->
		<div id="contents_slide">
		
			<div class="slide">
			  <div><img alt="" src="./resources/images/slide_1.jpg"></div>
			  <div><img alt="" src="./resources/images/slide_2.jpg"></div>
			  <div><img alt="" src="./resources/images/slide_3.jpg"></div>
			</div>
			
		</div>
		
	<div id="contents_box">
		<div id="contents_list">
	
			<div id="info">
				<h2>진료안내</h2>
				<div class="list_title">
				<p>대표전화 1588-5700</p>
				<p>암환자 상담 02-2072-0707</p>
				</div>
				<div class="list_btn">
				<a href="" class="first_a">외래안내</a>
				<a href="">외래시간표</a>
				</div>
			</div>
			
			<div id="reserve">
				<h2>진료예약</h2>
				<div class="list_title">
				<p>진료예약은 인터넷을 통해 하실 수 있습니다.</p>
				<p>인터넷예약은 24시간 이용하실 수 있습니다.</p>
				</div>
				<div class="list_btn">
				<a href="" class="first_a">진료예약안내</a>
				<a href="">진료예약하기</a>
				</div>
			</div>
			
			<div id="search">
				<h2>의료진검색</h2>
				<div class="doctor_search">
				<p>쌍용백병원의 의료진은</p>
				<p>환자를 위해 항상 노력하고 있습니다.</p>
				</div>
				<div id="search_box">
					<input type="text" placeholder="의료진 검색하기"><button>검색</button>
				</div>
			</div>
			
			<div id="notice">
				<h2>병원소식/공지</h2>
				<h3><a href="./notice/noticeList">더보기 +</a></h3>
				<div id="notice_box">
					<table>
						<tr>
							<td class="num">100</td>
							<td><a href="">공지병원정보시스템이 업그레이드 되었습니다</a></td>
							<td class="sysdate">2019-07-23</td>
						</tr>
						<tr>
							<td class="num">99</td>
							<td><a href="">공지2019년 06월 01일(토) 서버점검 안내</a></td>
							<td class="sysdate">2019-07-23</td>
						</tr>
						<tr>
							<td class="num">98</td>
							<td><a href="">공지2019년 05월 26일(일) 서버점검 안내</a></td>
							<td class="sysdate">2019-07-23</td>
						</tr>
						<tr>
							<td class="num">97</td>
							<td><a href="">공지제6회 강북삼성병원 소화기 심포지엄</a></td>
							<td class="sysdate">2019-07-23</td>
						</tr>
						<tr>
							<td class="num">96</td>
							<td><a href="">공지2019년 4월 9일 서버점검 안내</a></td>
							<td class="sysdate">2019-07-23</td>
						</tr>
						
					</table>
				</div>
			</div>
			
			<div id="client">
				<h2>고객의 소리</h2>
				<div class="list_title">
				<p>병원을 이용하시면서 감사 또는 </p>
				<p>건의하고자 하는 사항을 등록하실 수 있습니다.</p>
				</div>
				<div class="list_btn">
				<a href="" class="first_a">건의합니다</a>
				<a href="">칭찬합니다</a>
				</div>
			</div>
			
		</div>
	</div>

</div>
<div id="contents_2">
	<div id="health_box">
	
		<div id="health_title">
			<h3>건강뉴스</h3>
		</div>
		
		<div class="news_box">
			<img alt="" src="">
			<p>카테고리</p>
			<p>글제목 글제목 글제목</p>
			<p>2019-07-23</p>
		</div>
		
		
	</div>
</div>

<!-- footer -->

<div id="footer">
	<div id="footer_box">
		<div id="footer_logo">
			<img alt="하단로고" src="./resources/images/logo2.png">
		</div>
	
		<div id="footer_nav">
			<ul>
				<li><a href="">병원소개</a></li>
				<li>│</li>
				<li><a href="">회원약관</a></li>
				<li>│</li>
				<li><a href="">개인정보처리방침</a></li>
				<li>│</li>
				<li><a href="">환자의 권리와 의무</a></li>
				<li>│</li>
				<li><a href="">비급여진료안내</a></li>			
			</ul>
		</div>
		
		<div id="footer_sns">
			<a href=""><img alt="" src="./resources/images/t.png"></a>
			<a href=""><img alt="" src="./resources/images/i.png"></a>
			<a href=""><img alt="" src="./resources/images/f.png"></a>
		</div>
		
		
		<div id="company_info">
			<p>서울특별시 강남구 일원로 81 (06351) 삼성서울병원 / 대표전화 : 1599-3114 / 사업자등록번호 : 213-82-05096 권오정<br>
COPYRIGHT©1996-2015 BY SAMSUNG MEDICAL CENTER. ALL RIGHTS RESERVED.</p>
		</div>
		
	
	</div>
</div>

<!-- footer 끝 -->
</body>
</html>
