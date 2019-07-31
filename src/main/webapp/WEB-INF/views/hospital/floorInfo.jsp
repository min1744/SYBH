<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/floorlInfo.css" rel="stylesheet">
<script type="text/javascript">

	$(function() {
		
		// Add active class to the current button (highlight it)
		var header = document.getElementById("floor_info");
		var btns = header.getElementsByClassName("btn");
		for (var i = 0; i < btns.length; i++) {
		  btns[i].addEventListener("click", function() {
		  var current = document.getElementsByClassName("active");
		  current[0].className = current[0].className.replace(" active", "");
		  this.className += " active";
		  });
		}
		
		
		////////////버튼 클릭시 하단 내용 변경 코드
		var change_1 = document.getElementById('change_1');
		var change_2 = document.getElementById('change_2');
		
		$(change_2).css('display', 'none');
		
		$('#btn1').click(function() {
			
			$(change_2).css('display', 'none');
			$(change_1).css('display', 'block');
			
		});
		
		$('#btn2').click(function() {
			
			$(change_1).css('display', 'none');
			$(change_2).css('display', 'block');
		});
		
		
		
	});

</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />

<div id="board">
		<div id="board_title">
			<p id="title">층별/편의시설 안내</p>
			<p id="sub_title">쌍용백병원의 층별 및 편의시설을 안내합니다.</p>
		</div>
	
	
	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="./hospitalInfo">병원소개</a></li>
				<li><a href="../medical/medicalTeamList">의료진 소개</a></li>
				<li><a href="#" style="color:#6BB5DB;">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
				
			
			</ul>
		
		</div>
		
		
		<div id="boardList">
		
			<div id="floor_info">
				<button id="btn1" class="btn active">층별안내</button>
				<button id="btn2" class="btn">편의시설안내</button>


			<div class="change_box">
				<!-- 층별안내 -->
				<div id="change_1">
				<h3>본관</h3>
				
				<table>
					<tr>
						<th>12층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>내과계중환자실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>11층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>간호·간병통합서비스병동</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>10층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>간호·간병통합서비스병동</li>
								<li>뇌졸중집중치료실</li>
								<li>수면다원검사실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>9층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>석고실</li>
								<li>간호·간병통합서비스병동</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>8층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>호스피스완화의료센터</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>7층</th>
						<td>
							<ul>
								<li>병동</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>6층</th>
						<td>
							<ul>
								<li>병동</li>
                                <li>간호·간병통합서비스병동</li>
								<li>외과계중환자실</li>
								<li>투석실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>5층</th>
						<td>
							<ul>
								<li>병동</li>
								<li>국제진료센터</li>
								<li>근전도실</li>
								<li>뇌파실</li>
								<li>당뇨병·내분비 센터</li>
								<li>당뇨병교육실</li>
								<li>분만실</li>
								<li class="bd-none">신생아집중치료지역센터</li>
								<li>신생아실</li>
								<li>아기희망클리닉</li>
								<li>옥외휴게실</li>
								<li>인당암센터</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>3층</th>
						<td>
							<ul>
								<li>가정의학과</li>
								<li>뇌혈류검사실</li>
								<li>비전21심장혈관센터</li>
								<li>산부인과</li>
								<li>성형외과</li>
								<li>신경과</li>
								<li class="bd-none">신경외과</li>
								<li>심장검사실</li>
								<li>외과</li>
								<li>정형외과</li>
								<li>치과</li>
								<li>평형기능검사실</li>
								<li>흉부외과</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>2층</th>
						<td>
							<ul>
								<li>검사예약창구</li>
								<li>내과</li>
								<li>뇌기능검사실</li>
								<li>발달증진클리닉</li>
								<li>비뇨의학과</li>
								<li>소화기내시경실</li>
								<li class="bd-none">안과</li>
								<li>음성언어치료실</li>
								<li>이비인후과</li>
								<li>장기이식센터</li>
								<li>재활심리실</li>
								<li>재활의학과</li>
								<li class="bd-none">정신건강의학과</li>
								<li>주사실</li>
								<li>천식·알레르기 검사실</li>
								<li>호흡기 검사실</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>1층</th>
						<td>
							<ul>
								<li>가정간호사실</li>
								<li>고객상담실</li>
								<li>서류·영상발급센터</li>
								<li>소아청소년과 (수유실·놀이방)</li>
								<li>안내</li>
								<li>약국</li>
								<li class="bd-none">원무부(입·퇴원)</li>
								<li>접수·수납</li>
								<li>응급원무부</li>
								<li>응급의료센터</li>
								<li>진료협력센터</li>
								<li>처음오신분 창구</li>
								<li class="bd-none">제과점</li>
								<li>커피전문점</li>
								<li>편의점</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>B1층</th>
						<td>
							<ul>
								<li>건강증진센터</li>
								<li>마취통증의학과</li>
								<li>방재실</li>
								<li>병리과</li>
								<li>심장혈관촬영실</li>
								<li>임상연구윤리센터</li>
								<li class="bd-none">약국</li>
								<li>영상의학과 (CT실, 초음파실)</li>
								<li>일반검진센터</li>
								<li>중앙수술실</li>
								<li>중앙회복실</li>
								<li>진단검사의학과</li>
								<li class="bd-none">채혈실(헌혈실)</li>
								<li>통원수술센터</li>
								<li>대외협력실</li>
                                <li>대강당</li>
							</ul>
						</td>
					</tr>
					<tr>
						<th>B2층</th>
						<td>
							<ul>
								<li>교직원식당</li>
								<li>영양부</li>
								<li>용역사무실</li>
								<li>일반음식점</li>
								<li>재활센터·물리치료실</li>
								<li>통증클리닉</li>
							</ul>
							<p class="comment_info">
							P1, P2 주차장에 주차하신 분은 병원 지하 2층에서 내시리면 됩니다.<br>
							장례식장은 P2주차장과 연결되어 있습니다.
							</p>
						</td>
					</tr>
					<tr>
						<th>B3층</th>
						<td>
							<ul>
								<li>간호부</li>
								<li>간호학생세미나실</li>
								<li>감염관리실</li>
								<li>멀티미디어실</li>
								<li>보건관리실</li>
								<li>사회사업실</li>
								<li class="bd-none">생명사랑팀</li>
								<li>스포츠건강의학센터</li>
								<li>MRI실</li>
								<li>의료정보실</li>
								<li>의무기록실</li>
								<li>임상시험약품관리실</li>
								<li class="bd-none">임상심리학실</li>
								<li>자원봉사자실</li>
								<li>중앙공급실</li>
								<li>QI실</li>
								<li>통신실</li>
							</ul>
							<p class="comment_info">
							P3 주차장에 주차 하신 분은 병원 지하 3층에서 내리시면 됩니다.
							</p>
						</td>
					</tr>
					<tr>
						<th>B4층</th>
						<td>
							<ul>
								<li>노발리스 방사선수술센터</li>
								<li>방사선종양학과</li>
								<li>시설부 (영선실, 의공실, 기계실, 전기실)</li>
								<li>PET-CT</li>
								<li class="bd-none">핵의학센터</li>
							</ul>
							<p class="comment_info">
							P4, P5 주차장에 주차 하신 분은 병원 지하 4층에서 내리시면 됩니다.
							</p>
						</td>
					</tr>
					</table>
				</div>
				
				
				<!-- 편의시설 안내 -->
				<div id="change_2">
					<h3>편의시설 안내</h3>
					
					
					<div class="amenities">
						<div class="amen_img">
							<img alt="우리은행" src="../resources/images/convenient01.jpg">
						</div>
						
						<div class="amen_info">
							<h4>금융기관 (우리은행)</h4>
							<hr>
							<p>우리은행에서 출장소를 개설하여 일반 공과금 접수업무를 실시하고 있습니다.<br>
							현금지급기를 설치하여 24시간 편리하게 이용 하실 수 있습니다.</p>
							<ul>
								<li class="before">
								<span class="span_1">영업시간</span><span class="span_2">오후 3시~5시</span>
								</li>
								<li class="before">
								<span class="span_1">위치</span><span class="span_2">쌍용백병원 1층</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					
					<div class="amenities1">
						<div class="amen_img">
							<img alt="커피숍" src="../resources/images/convenient02.jpg">
						</div>
						
						<div class="amen_info">
							<h4>커피숍</h4>
							<hr>
							<p>각종 커피와 음료를 이용하실 수 있습니다.</p>
							<ul>
								<li class="before">
								<span class="span_1">위치</span><span class="span_2">쌍용백병원 1층</span>
								</li>
							</ul>
						</div>
					</div>
					
					<div class="amenities1">
						<div class="amen_img">
							<img alt="편의점" src="../resources/images/emart24.jpg">
						</div>
						
						<div class="amen_info">
							<h4>편의점</h4>
							<hr>
							<p>입원환자 및 외래객들을 위해 필요한 기본 생활용품 및 식음료, 기타 잡화등을 판매하고 있습니다.</p>
							<ul>
								<li class="before">
								<span class="span_1">영업시간</span><span class="span_2">연중무휴</span>
								</li>
								<li class="before">
								<span class="span_1">위치</span><span class="span_2">쌍용백병원 1층</span>
								</li>
								<li class="before">
								<span class="span_1">문의</span><span class="span_2">031-910-7895</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					<div class="amenities1">
						<div class="amen_img">
							<img alt="제과점" src="../resources/images/convenient04.jpg">
						</div>
						
						<div class="amen_info">
							<h4>제과점</h4>
							<hr>
							<p>브레댄코(bread&co)의 갓 구운 빵과 케잌, 선물용 제과상품을 구매하실 수 있습니다.</p>
							<ul>
								<li class="before">
								<span class="span_1">영업시간</span><span class="span_2">오전 8:00~오후 9:00</span>
								</li>
								<li class="before">
								<span class="span_1">위치</span><span class="span_2">쌍용백병원 1층</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					
					
					<div class="amenities1">
						<div class="amen_img">
							<img alt="식당" src="../resources/images/food.jpg">
						</div>
						
						<div class="amen_info">
							<h4>식당</h4>
							<hr>
							<p>메뉴 : 돈까스, 우동류, 식사류, 덮밥, 죽류</p>
							<ul>
								<li class="before">
								<span class="span_1">영업시간</span><span class="span_2">오전 8시~오후 8시 / 토요일 오전 8시~오후 7시 (3~4시 브레이크 타임)</span>
								</li>
								<li class="before">
								<span class="span_1">위치</span><span class="span_2">쌍용백병원 지하2층</span>
								</li>
							</ul>
						</div>
					</div>
					
					
					<div class="amenities1">
						<div class="amen_img">
							<img alt="장례식장" src="../resources/images/convenient05.jpg">
						</div>
						
						<div class="amen_info">
							<h4>장례식장</h4>
							<hr>
							<p>쌍용백병원 장례식장은 올바른 장례문화를 선도하기 위해 항상 노력하고 있습니다. 
							유가족과 슬픔을 같이하는 마음으로 편안한 만남의 장소를 제공하기 위해 정성을 다하겠습니다.</p>
							<ul>
								<li class="before">
								<span class="span_1">문의전화</span><span class="span_2">031-902-4444</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			
			</div>
		
		
		</div>
		
	</div>
	
</div>



<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>