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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9963d068218228f27bdac8c9618c4a07"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9963d068218228f27bdac8c9618c4a07&libraries=clusterer"></script>
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
	///////////////////////////////////////
    $('#spon_btn').click(function(event){  //버튼을 클릭 했을시 popupOpen 함수 출력
    	var memberVO = '${memberVO}';
    	if(memberVO ==''){
   		alert('로그인 후 사용가능합니다');
   		location.href="./member/memberLogin";
    	}else{
        popupOpen();//Popup Open 함수
    	}
    });
	function popupOpen(){
		var url= "./pay/payPopup";    //팝업창 페이지 URL
		var winWidth = 1000;
	    var winHeight = 800;
	    var popupX = 400;
	  	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		 var popupY= 80;
	 	 //&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+popupX+", top="+popupY;    //팝업창 옵션(optoin)
	  	//window.open('', '', 'status=no, height=300, width=200, left='+ popupX + ', top='+ popupY);
	    window.open(url,"",popupOption, 'left='+ popupX + ', top='+ popupY);
	}
	//재혁 후원총금액
	$.ajax({
		url:"./pay/donationTotal",
		type: "GET",
		success:function(data){
			data = data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$('#donation').html(data+'<span>원</span>');
		}
	});
	//재혁 후원인 총 인원
	$.ajax({
		url:"./pay/donationPeopleTotal",
		type:"GET",
		success:function(data){
			$('#people').html(data+'<span>명</span>');
		}
	});
	//$('#sponsor').load('./pay/donationTotal');
	//$('#sponsor').load('./pay/donationPeopleTotal');
}); 
</script>
<body>
<!-- header -->
<div id="header">
	<div id="header_box">
		<!-- header logo -->
		<div id="header_logo">
			<a href="./"><img alt="로고" src="./resources/images/logo.png"></a>
		</div>
		<div id="right_menu">
		<!-- header 메뉴 -->
		<div id="header_menu">
			<ul>
				<li><a href="./reserve/reserveInfo">진료예약/조회</a></li>
				<li><a href="./news/newsAll">건강뉴스</a></li>
				<li><a href="./notice/noticeList">병원안내</a></li>
				<li><a href="./qna/complaint">고객의 소리</a></li>
				<li><a href="./community/communityList">커뮤니티</a></li>
				<li id="last_menu"><a href="./pharmacy/pharmacyInfo">약국</a></li>			
			</ul>
		</div>
		<!-- login / join -->
		<div id="member">
			<ul>
				<c:choose>
					<c:when test="${not empty memberVO}">
						<c:choose>	
							<c:when test="${memberVO.grade eq '2'}">
								<li><a href="./member/memberLogout">로그아웃</a></li>
								<li style="padding: 0 10px;">│<li>
								<li><a href="./admin/adminIndex" target="_blank">관리자페이지</a></li>
							</c:when>
							<c:otherwise>
							<!-- 민근 : 일반 로그아웃과 KAKAO 로그아웃의 구별 -->
							<!-- variety : member / kakao -->
							<li><a href="./member/${variety}Logout">로그아웃</a></li>
							<li style="padding: 0 10px;">│<li>
							<li><a href="./member/memberMyPage">마이페이지</a></li>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<li><a href="./member/memberLogin">로그인</a></li>
						<li style="padding: 0 10px;">│<li>
						<li><a href="./member/memberAgree">회원가입</a></li>
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
			<li><a href="./reserve/outgoingInfo">외래/접수안내</a></li>
			<li><a href="./reserve/reserveInfo">예약안내</a></li>
			<li><a href="./reserve/reserveNomal">일반진료 예약</a></li>
			<li><a href="./reserve/reserveMedical">건강검진 예약</a></li>
			<li><a href="./member/memberNomal">진료예약 조회</a></li>
		</ul>
		<ul id="ul_2">
			<li><a href="./news/disease">질환 정보</a></li>
			<li><a href="./news/nutrition">영양 정보</a></li>
			<li><a href="./news/exercise">운동 정보</a></li>
		</ul>
		<ul id="ul_3">
			<li><a href="./notice/noticeList">공지사항</a></li>
			<li><a href="./hospital/hospitalInfo">병원소개</a></li>
			<li><a href="./medical/medicalTeamList">의료진 소개</a></li>
			<li><a href="./hospital/floorInfo">층별 안내</a></li>
			<li><a href="./hospital/location">오시는 길</a></li>
		</ul>
		<ul id="ul_4">
			<li><a href="./qna/complaint">건의합니다</a></li>
			<li><a href="./qna/praise">칭찬합니다</a></li>
			<li><a href="./qna/qna">질문과답변</a></li>
		</ul>
	</div>
</div>
<!-- header 끝 -->
<!-- 플로팅 -->
<div id="floatMenu">
	<!-- <div id="floating_img">
		<img src="./resources/images/nav_img.png">
	</div>
	<div id="sponsor">
		<p class="spon_title">모인금액</p>
		<p class="spon_num" id="donation"></p>
		<p class="spon_title">후원자</p>
		<p class="spon_num" id="people"></p>
		<button id="spon_btn">후원하기</button>
	</div>
	<div id="top_btn">
		<a id="top" href="#">TOP<span>▲</span></a>
	</div>
	<div id="chat">
		<img src="./resources/images/chat.png">
		
	<!--1대1 대화  -->
	<script type="text/javascript">
	
		tocplusTop=550;
		tocplusLeft=50;
		tocplusMinimizedImage='http://kr02.tocplus007.com/img/minimized_ko.gif'; //최소화 아이콘
		tocplusAwayImage="";//'상담원부재중그림';
		tocplusHAlign='right';
		tocplusWidth=180;
		tocplusHeight=220;
		tocplusUserName='${memberVO.name}';
		tocplusFrameColor='#153f91';
		tocplusFloatingWindow=true;
		var tocplusHost = (("https:" == document.location.protocol) ? "https://" : "http://");
		document.write(unescape("%"+"3Cscript src='" + tocplusHost + "kr03.tocplus007.com/chatLoader.do?userId=hospital' type='text/javascript'"+"%"+"3E"+"%"+"3C/script"+"%"+"3E"));
	</script>
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
				<p>대표전화 <span>1588-5700</span></p>
				<p>암환자 상담 <span>02-2072-0707</span></p>
				</div>
				<div class="list_btn">
				<a href="./reserve/outgoingInfo#change_2" class="first_a btn_a">외래안내</a>
				<a href="./reserve/outgoingInfo#change_1" class="btn_a">진료접수안내</a>
				</div>
			</div>
			
			<div id="reserve">
				<h2>진료예약</h2>
				<div class="list_title">
				<p>진료예약은 인터넷을 통해 하실 수 있습니다.</p>
				<p>인터넷예약은 24시간 이용하실 수 있습니다.</p>
				</div>
				<div class="list_btn">
				<a href="./reserve/reserveInfo" class="first_a btn_b">진료예약안내</a>
				<a href="./reserve/reserveNomal" class="btn_b">진료예약하기</a>
				</div>
			</div>
			<div id="search">
				<h2>의료진검색</h2>
				<div class="doctor_search">
				<p>쌍용백병원의 의료진은</p>
				<p>환자를 위해 항상 노력하고 있습니다.</p>
				</div>
				<div id="search_box">
				<form action="./medical/medicalTeamSearch">
					<input type="text" name="name" placeholder="의료진 검색하기"><button>검색</button>
				</form>
				</div>
			</div>
			<div id="notice">
				<h2>병원소식/공지</h2>
				<h3><a href="./notice/noticeList">더보기 +</a></h3>
				<div id="notice_box">
					<table>
					<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td class="num">${vo.num}</td>
							<td><a href="./notice/noticeSelect?num=${vo.num}">${vo.title}</a></td>
							<td class="sysdate">${vo.reg_date}</td>
						</tr>
					</c:forEach>	
					</tbody>
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
				<a href="./qna/complaint" class="first_a btn_a">건의합니다</a>
				<a href="./qna/praise" class="btn_a">칭찬합니다</a>
				</div>
			</div>
			
		</div>
	</div>

</div>
<div id="contents_2">
	<div id="health_box">
	
		<div id="health_title">
			<h3>건강뉴스</h3>
			<p class="sub_h3">질병, 영양, 운동, 생활 속 관리 등 건강에 대한 모든 것</p>
		</div>
		<div class="news_box">

				<c:forEach items="${ilist}" var="newsVO">
					<span class="news_contents"> <img
						src="./resources/file/${newsVO.newsImagesVO.oname}">
						<p class="category">
							<c:choose>
								<c:when test="${newsVO.menu eq 'disease'}">질병</c:when>
								<c:when test="${nesVO.menu eq 'nutrition'}">영양</c:when>
								<c:otherwise>운동</c:otherwise>
							</c:choose>
						</p>
						<p>
							<a href="./news/${newsVO.menu}Select?num=${newsVO.num}">${newsVO.title}</a>
						</p>
						<p class="news_date">${newsVO.reg_date}</p>
					</span>
				</c:forEach>

			</div>
	</div>
	
</div>
	<!-- 오시는 길 -->
<div id="contents_3">
	<div id="location_box">
	
		<div id="location_title">
			<h3>오시는길</h3>
			<p class="sub_h3">쌍용백병원으로 오시는 길을 알려드립니다.</p>
		</div>
		
		<!-- 지도 API -->
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">
			    </div>
			    <!-- 지도타입 컨트롤 div 입니다 -->
			    <div class="custom_typecontrol radius_border">
			        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
			        <span id="btnSkyview" class="sky_btn" onclick="setMapType('skyview')">스카이뷰</span>
			    </div>
			    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
			    <div class="custom_zoomcontrol radius_border"> 
			        <span onclick="zoomIn()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
			        <span onclick="zoomOut()"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
			    </div>
			    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9963d068218228f27bdac8c9618c4a07"></script>
			<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(37.556558, 126.919545), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					var imageSrc = './resources/images/marker.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(170, 64), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(110, 64)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				      
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					    markerPosition = new kakao.maps.LatLng(37.556558, 126.919545); // 마커가 표시될 위치입니다
					    
					 // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        position: markerPosition, 
					        image: markerImage // 마커이미지 설정 
					    });
					    
					    marker.setMap(map);  
					    
					// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
					function setMapType(maptype) { 
					    var roadmapControl = document.getElementById('btnRoadmap');
					    var skyviewControl = document.getElementById('btnSkyview'); 
					    if (maptype === 'roadmap') {
					        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
					        roadmapControl.className = 'selected_btn';
					        skyviewControl.className = 'btn';
					    } else {
					        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
					        skyviewControl.className = 'selected_btn';
					        roadmapControl.className = 'btn';
					    }
					}
					
					// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
					function zoomIn() {
					    map.setLevel(map.getLevel() - 1);
					}
					
					// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
					function zoomOut() {
					    map.setLevel(map.getLevel() + 1);
					}
					
			</script>
			</div>
		
		<script type="text/javascript">
		
		
		</script>
	
	
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
				<li><a href="./hospital/hospitalInfo">병원소개</a></li>
				<li>│</li>
				<li><a href="./hospital/web">웹이용약관</a></li>
				<li>│</li>
				<li><a href="./hospital/privacyList">개인정보처리방침</a></li>
				<li>│</li>
				<li><a href="./hospital/patientRight">환자권리장전</a></li>
				<li>│</li>
				<li><a href="./hospital/nonSalary">비급여진료안내</a></li>			
			</ul>
		</div>
			
		
		<div id="footer_sns">
			<a href="https://twitter.com/myKBSMC" target="_blank"><img alt="" src="./resources/images/t.png"></a>
			<a href="http://www.mykbsmc.com/" target="_blank"><img alt="" src="./resources/images/b.png"></a>
			<a href="https://www.facebook.com/myKBSMC" target="_blank"><img alt="" src="./resources/images/f.png"></a>
		</div>
		
		
		<div id="company_info">
			<p>서울특별시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용백병원 / 대표전화 : 1599-3114 / 사업자등록번호 : 213-82-05096<br>
			COPYRIGHT©1996-2019 BY SSANGYONG MEDICAL CENTER. ALL RIGHTS RESERVED.</p>
		</div>
		
	
	</div>
</div>


	        	 
	        	 

<!-- footer 끝 -->


<div id="footer_fix">
	
	<div id="fix_box">
		<img src="./resources/images/nav_img.png">
		<span class="spon_title" id="s_title">쌍용백병원 후원하기</span>
		
		<ul>
			<li class="spon_title">모인금액</li>
			<li class="spon_num" id="donation"></li>
			<li class="spon_title">후원자</li>
			<li class="spon_num" id="people"></li>
		
		</ul>
		
			<button id="spon_btn">후원하기</button>
		
	</div>
	
	
</div>
</body>
</html>
