<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/location.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">찾아오시는 길</p>
			<p id="sub_title">쌍용백병원으로 찾아오시는 길입니다.</p>
		</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="./hospitalInfo">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="./floorInfo">층별안내</a></li>
				<li><a href="#" style="color:#6BB5DB;">오시는 길</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
			<!-- 지도 API -->
			<div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">
			    </div>
			    <!-- 지도타입 컨트롤 div 입니다 -->
			    <div class="custom_typecontrol radius_border">
			        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
			        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
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
					
					var imageSrc = '../resources/images/marker.png', // 마커이미지의 주소입니다    
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
			<div id="location_info">
				<ul>
					<li class="before">
						<span class="span_1">주소</span><span class="span_2">서울특별시 마포구 월드컵북로 21 풍성빌딩 </span>
					</li>
					<hr>
					<li class="before">
						<span class="span_1">대표전화</span><span class="span_2">02)346-8546~8</span>
					</li>
					
				</ul>
			</div>
		
		
			
			<!-- 대중교통 -->
			
			
		
		</div>
		
	</div>
	
</div>




<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>