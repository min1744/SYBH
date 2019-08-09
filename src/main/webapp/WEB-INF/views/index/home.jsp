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
<link href="./resources/css/indexBootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
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
	
	
	//////////////////////////// 지도 API
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.556558, 126.919545), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var iwContent = '<div style="padding:5px;">쌍용백병원</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(37.556558, 126.919545), //인포윈도우 표시 위치입니다
	iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	//인포윈도우를 생성하고 지도에 표시합니다
	var infowindow = new kakao.maps.InfoWindow({
	map: map, // 인포윈도우가 표시될 지도
	position : iwPosition, 
	content : iwContent,
	removable : iwRemoveable
	});
	  
	//아래 코드는 인포윈도우를 지도에서 제거합니다
	//infowindow.close();
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
				<li id="last_menu"><a href="">주말약국</a></li>			
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
							<!-- 민근 : 일반로그아웃과 KAKAO로그아웃의 구별 -->
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
					<div id="sub_nav_box" style="padding-left: 657px;">
				</c:when>
				<c:otherwise>
				<div id="sub_nav_box" style="padding-left: 671px;">
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div id="sub_nav_box" style="padding-left: 696px;">
		</c:otherwise>
	</c:choose>
		<ul id="ul_1">
			<li><a href="./reserve/reserveNomal">일반진료 예약</a></li>
			<li><a href="./reserve/reserveMedical">건강검진 예약</a></li>
		</ul>
		<ul id="ul_2">
			<li><a href="./news/newsList">질환 정보</a></li>
			<li><a href="./news/newsList">영양 정보</a></li>
			<li><a href="./news/newsList">운동 정보</a></li>
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
			<li><a href="./qna/qnaList">질문과답변</a></li>
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
		
	</div> -->
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
				<a href="" class="first_a btn_a">외래안내</a>
				<a href="" class="btn_a">외래시간표</a>
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
				<a href="" class="first_a btn_a">건의합니다</a>
				<a href="" class="btn_a">칭찬합니다</a>
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
			<img alt="" src="./resources/images/news_1.jpg">
			<div class="news_contents">
				<p class="category">운동</p>
				<p><a href="./news/newsSelect?num=${vo.num}">${vo.title}</a></p>
				<p class="news_date">${vo.reg_date}</p>
			</div>
		</div>
		
		<div class="news_box">
			<img alt="" src="./resources/images/news_2.jpg">
			<div class="news_contents">
				<p class="category">운동</p>
				<p><a href="./news/newsSelect?num=${vo.num}">${vo.title}</a></p>
				<p class="news_date">${vo.reg_date}</p>
			</div>
		</div>
		
		<div class="news_box">
			<img alt="" src="./resources/images/news_3.jpg">
			<div class="news_contents">
				<p class="category">운동</p>
				<p><a href="./news/newsSelect?num=${vo.num}">${vo.title}</a></p>
				<p class="news_date">${vo.reg_date}</p>
			</div>
		</div>
		
		<div class="news_box last_box">
			<img alt="" src="./resources/images/news_4.jpg">
			<div class="news_contents">
				<p class="category">운동</p>
				<p><a href="./news/newsSelect?num=${vo.num}">${vo.title}</a></p>
				<p class="news_date">${vo.reg_date}</p>
			</div>
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
		
		<div id="map">
		
		
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
				<li><a href="">회원약관</a></li>
				<li>│</li>
				<li><a href="" data-toggle="modal" data-target="#popupPrivacyList">개인정보처리방침</a></li>
				<li>│</li>
				<li><a href="" data-toggle="modal" data-target="#patient">환자의 권리와 의무</a></li>
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
			<p>서울특별시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용백병원 / 대표전화 : 1599-3114 / 사업자등록번호 : 213-82-05096<br>
COPYRIGHT©1996-2019 BY SSANGYONG MEDICAL CENTER. ALL RIGHTS RESERVED.</p>
		</div>
		
	
	</div>
</div>


<!-- 모달창 -->
	<!-- 나중에 foreach로 id 뒤 숫자 varstatus 값으로 구분 -->
	  <div class="modal fade" id="popupPrivacyList" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">개인정보처리방침</h4>
	        </div>
	        <div class="modal-body">
	        	 <h3>개인정보처리방침</h3>
	        	 <p>
	        	 쌍용백병원(이하 “병원”이라 함)은 개인정보보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보처리방침을 수립·공개합니다. 
	        	 개인정보처리방침의 순서는 다음과 같습니다.
	        	 </p>
	        	 
	        	 <div class="box-privacy">
					<ol>
						<li>01. 개인정보 처리 목적</li>
						<li>02. 개인정보 처리 및 보유기간</li>
						<li>03. 개인정보의 제3자 제공에 관한 사항</li>
						<li>04. 개인정보처리의 위탁에 관한 사항</li>
						<li>05. 정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항</li>
						<li>06. 처리하는 개인정보의 항목</li>
						<li>07. 개인정보 파기에 관한 사항</li>
					</ol>
					<ol class="pd-l40">
						<li>08. 개인정보 보호책임자에 관한 사항</li>
						<li>09. 개인정보처리방침의 변경에 대한 사항</li>
						<li>10. 개인정보의 안전성 확보조치에 관한 사항</li>
						<li>11. 개인정보 자동 수집 장치의 설치, 운영 및 거부에 관한 사항</li>
						<li>12. 개인정보 보호를 위한 기술적, 관리적 대책</li>
						<li>13. 정보주체의 권익침해 구제방법</li>
						<li>14. 영상정보처리기기 운영·관리에 관한 사항</li>
					</ol>
				</div>
	        	 
	        	<div class="privacy_contents">
	        		<h4>01. 개인정보 처리 목적</h4>
	        		<p>
	        		병원의 각종 서비스를 이용하는데 있어 인터넷 진료예약, 상담 등 각종 서비스의 원활한 제공과 예약확인, 상담 답변 등 각종 정보 제공을 위한 온라인 및 오프라인에서의 공지, 통계분석자료로 활용을 위해 최소한의 정보를 필수 사항으로 수집합니다.<br>
					이용자가 제공한 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며 수집 정보의 범위나 사용 목적, 용도가 변경될 시에는 사전 동의를 구할 것입니다.
					</p>
					
					
					<h4>02. 개인정보 처리 및 보유기간</h4>
	        		<p>
	        		병원은 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 귀하의 개인정보를 지체없이 파기합니다.<br>
					① 홈페이지 회원가입 정보의 경우: 회원을 탈퇴하거나 회원에서 제명된 때<br>
					② 진료목적을 위해 수집한 경우: 의료법 시행규칙 제15조 진료에 관한 기록의 보존에 명시된 기간에 준하여 보존합니다. 다만, 수집 목적 또는 제공받은 목적이 달성된 경우에도 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 귀하의 개인정보를 보유할 수 있습니다.
					</p>
					
					<h4>03. 개인정보의 제3자 제공에 관한 사항</h4>
	        		<p>
	        		① 병원은 고객의 개인정보를 서비스이용약관 및 개인정보처리방침의 『개인정보 처리목적』에서 고지한 범위 또는 서비스이용약관에 명시한 범위 내에서 사용하며, 법령에 특별한 규정이 있거나 범죄 수사를 위해 수사기관의 요구가 있는 경우에는 예외로 합니다. 병원이 회원님의 개인정보를 공유하는 경우는 뉴스레터를 포함한 정보 제공 및 공지안내, 게시물 알림 메일 발송 등의 경우 또는 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공되는 경우가 있습니다.
					<br>② 병원이 법률에 근거하여 제3자에게 제공하는 개인정보는 다음과 같습니다.
					</p>
					
					<h4>04. 개인정보처리의 위탁에 관한 사항</h4>
	        		<p>
	        		병원은 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁 계약 체결 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
					</p>
					
					
					<h4>05. 정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항</h4>
	        		<p>
	        		① 병원은 고객이 개인정보에 대한 열람, 정정 및 삭제를 요구하는 경우에는 고객의 요구에 성실하게 응대하고, 지체없이 처리합니다.
					<br><span>[개인정보의 열람]</span>
					<br>고객은 서면, 전자우편, 모사전송(fax) 등을 통하거나 병원을 방문하여 개인정보의 열람을요구할 수 있으며, 신속하게 이에 대하여 응대합니다.
					<br><span>[개인정보의 정정·삭제]</span>
					<br>병원은 고객이 개인정보에 대한 정정·삭제를 요구하는 경우, 개인정보에 오류가 있다고 판명되는 등 정정·삭제를 할 필요가 있다고 인정되는 경우에는 지체없이 정정·삭제를 합니다. 병원은 정정·삭제의 사실 확인에 필요한 증빙자료를 요청할 수 있습니다.
					<br>② 고객이 본인의 개인정보에 대한 열람, 정정 및 삭제를 요구하는 경우, 고객의 신분을 나타내는 신분증명서를 제시 받아 본인 여부를 확인합니다.
					<br>③ 고객의 대리인이 열람, 정정 및 삭제를 요구하는 경우에는 고객의 위임장 및 동의서와 대리인의 신분증명서 등을 확인하여 정당한 대리인인지 여부를 확인합니다.
					<br>④ 병원은 개인정보의 전부 또는 일부에 대하여 열람, 정정 및 삭제를 거절할 정당한 이유가 있는 경우에는 고객에게 이를 통지하고 그 이유를 설명합니다.
					⑤ 만14세 미만 아동(이하 “아동”이라 함)의 회원가입은 개인정보 수집·이용에 대하여 반드시 법정대리인의 동의를 구하고 있습니다. 병원은 법정대리인의 동의를 받기 위하여 아동으로부터 법정대리인의 성명과 연락처 등 최소한의 정보를 수집하고 있으며, 개인정보처리방침에서 규정하고 있는 방법에 따라 법정대리인의 동의를 받고 있습니다. 아동의 법정대리인은 아동의 개인정보에 대한 열람, 정정 및 삭제를 요청할 수 있습니다. 아동의 개인정보를 열람·정정, 삭제하고자 할 경우에는 회원정보수정을 클릭하여 법정대리인 확인 절차를 거치신 후 아동의 개인정보를 법정대리인이 직접 열람·정정, 삭제하실 수 있습니다.
					</p>
					
					
	        	</div> 
	        	 
	        	 
	        </div>
	      </div>
    	</div>
 	 </div>
 	 <!-- ---------- -->

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
