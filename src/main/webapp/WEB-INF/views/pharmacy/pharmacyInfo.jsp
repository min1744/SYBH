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
		<input type="hidden" class="location" value="${map.wgs84Lat}" title="${map.wgs84Lon}" name="${map.dutyName}">
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
					<div id="map"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
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
							<span class="span_1">주소</span>
							<span class="span_2">서울특별시 마포구 월드컵북로 21 풍성빌딩 </span>
						</li>
						<hr>
						<li class="before">
							<span class="span_1">대표전화</span>
							<span class="span_2">02)346-8546~8</span>
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
			center : new kakao.maps.LatLng(37.556558, 126.919545), // 지도의 중심좌표
			level : 7
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [];
		
		$('.location').each(function() {
			var dutyName = $(this).prop("name");
			var wgs84Lat = $(this).val();
			var wgs84Lon = $(this).prop("title");
			positions.push({
		        title: dutyName, 
		        latlng: new kakao.maps.LatLng(wgs84Lat, wgs84Lon)
		    });
		});
		
		for (var i = 0; i < positions.length; i ++) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커이미지의 주소입니다
			imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
			imageOption = {
				offset : new kakao.maps.Point(110, 64)
			}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커가 표시될 위치입니다

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,// 마커를 표시할 지도
				position : positions[i].latlng,// 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage// 마커 이미지 
			});
		}
		
		//marker.setMap(map);

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
</body>
</html>