<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/location.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).show(); //Fade in the active content
		return false;
	});
});
</script>
</head>
<body>
	<c:forEach items="${list}" var="map">
		<input type="hidden" class="location" name="${map.dutyName}" value="${map.wgs84Lat}" title="${map.wgs84Lon}">
		<input type="hidden" class="info" title="${map.dutyAddr}" name="${map.dutyTel}" value="${map.dutyName}">
	</c:forEach>
	<!-- header 추가 -->
	<c:import url="../common/header.jsp" />
	<div id="board">
		<div id="board_title">
			<p id="title">약국</p>
			<p id="sub_title">전국에 위치한 약국과 정보들을 알려드립니다.</p>
		</div>
		<div id="board_box">
			<div id="board_nav">
				<ul>
					<li>약국</li>
					<li><a href="./pharmacyInfo">약국 정보</a></li>
				</ul>
			</div>
			<div id="boardList">
				<!-- 지도 API -->
				<div class="map_wrap">
					<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					<!-- 지도타입 컨트롤 div 입니다 -->
					<div class="custom_typecontrol radius_border">
						<span id="btnRoadmap" class="selected_btn"
							onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
							class="btn" onclick="setMapType('skyview')">스카이뷰</span>
					</div>
					<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					<div class="custom_zoomcontrol radius_border">
						<span onclick="zoomIn()">
							<img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대">
						</span>
						<span onclick="zoomOut()">
							<img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소">
						</span>
					</div>
				</div>
				<div id="location_info">
					<ul>
						<li class="before">
							<span class="span_1">기관명</span>
							<span class="span_2" id="dutyName">쌍용백병원</span>
						</li>
						<hr>
						<li class="before">
							<span class="span_1">주소</span>
							<span class="span_2" id="dutyAddr">서울특별시 마포구 월드컵북로 21 풍성빌딩</span>
						</li>
						<hr>
						<li class="before">
							<span class="span_1">대표전화</span>
							<span class="span_2" id="dutyTel">02)346-8546~8</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9963d068218228f27bdac8c9618c4a07"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.556558, 126.919545), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [];
	var markers = [];
	
	//약국 정보
	$('.location').each(function() {
		var dutyName = $(this).prop("name");
		var wgs84Lat = $(this).val();
		var wgs84Lon = $(this).prop("title");
		positions.push({
	       	title : dutyName,
	       	latlng : new kakao.maps.LatLng(wgs84Lat, wgs84Lon)
	   	 });
	});
	
	//쌍용백병원 정보
	positions.push({
		title: "쌍용백병원", 
		latlng: new kakao.maps.LatLng(37.556558, 126.919545)
	});
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	    markers.push(marker);
	}
	
	for (var i = 0; i < positions.length; i ++) {
		kakao.maps.event.addListener(markers[i], 'click', function() {
	    	console.log(markers[i]);
	    	/*$('.info').each(function() {
	    		for (var j = 0; j < positions.length; j ++) {
	    			console.log(positions[j]);
		    		console.log($(this).val());
		    		console.log($(this).prop("title"));
		    		console.log($(this).prop("name"));
	    			var pharmacy1 = positions[j].title;
		    		var pharmacy2 = $(this).val();
		    		if(pharmacy1 == pharmacy2){
		    			$('#dutyName').html($(this).val());
						$('#dutyAddr').html($(this).prop("title"));
						$('#dutyTel').html($(this).prop("name"));
						break;
		    		}
	    		}
		    });*/
		});
	}
	</script>
</body>
</html>