<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/medicalTeam.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<script type="text/javascript">

function formatDate(date) { 
       var mymonth = date.getMonth()+1; 
       var myweekday = date.getDate(); 
       return (mymonth + "/" + myweekday); 
} 

function printWeek() { 
       var now = new Date(); 
       var nowDayOfWeek = now.getDay(); 
       var nowDay = now.getDate(); 
       var nowMonth = now.getMonth(); 
       var nowYear = now.getYear(); 
       nowYear += (nowYear < 2000) ? 1900 : 0; 
       var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
       console.log(nowDay - nowDayOfWeek);
       
       var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek)); 
       document.write("이번주는 :  " + formatDate(weekStartDate) + " - " + formatDate(weekEndDate)); 
} 
</script> 

</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">의료진</p>
			<p id="sub_title">쌍용백병원의 분야별 최고의 의료진을 소개합니다.</p>
		</div>
	
	<div id="board_box">
	
		<div id="board_nav">
			<ul>
				<li>병원안내</li>
				<li><a href="../notice/noticeList">공지사항</a></li>
				<li><a href="../hospital/hospitalInfo">병원소개</a></li>
				<li><a href="./medicalTeamList" style="color:#6bb5db;">의료진 소개</a></li>
				<li><a href="../hospital/floorInfo">층별안내</a></li>
				<li><a href="../hospital/location">오시는 길</a></li>
			</ul>
		</div>
		
		
		<div id="doctorList">
			<form action="./medicalTeamSearch">
				<div id="doctor_search">
					<select id="select_box">
						<option class="k" value="1">의료진 이름</option>
					</select>
					<input type="text" name="name" id="search" placeholder="검색어를 입력해주세요">
					<button id="search_btn">검색</button>
				</div>
			</form>
			<div id="doctor_select">
				<h3>진료과목 선택</h3>
				<ul>
					<c:choose>
								<c:when test="${mid eq '1'}">
									<li><a href="./medicalTeamList?mid=1" class="mid" style="color: white;">이비인후과</a></li>
									<li><a href="./medicalTeamList?mid=2">외과</a></li>
									<li><a href="./medicalTeamList?mid=3">비뇨의학과</a></li>
									<li><a href="./medicalTeamList?mid=4">내과</a></li>
									<li><a href="./medicalTeamList?mid=5" id="last_li">신경외과</a></li>	
								</c:when>
								<c:when test="${mid eq '2'}">
									<li><a href="./medicalTeamList?mid=1">이비인후과</a></li>
									<li><a href="./medicalTeamList?mid=2" class="mid" style="color: white;">외과</a></li>
									<li><a href="./medicalTeamList?mid=3">비뇨의학과</a></li>
									<li><a href="./medicalTeamList?mid=4">내과</a></li>
									<li><a href="./medicalTeamList?mid=5" id="last_li">신경외과</a></li>
								</c:when>
								<c:when test="${mid eq '3'}">
									<li><a href="./medicalTeamList?mid=1">이비인후과</a></li>
									<li><a href="./medicalTeamList?mid=2">외과</a></li>
									<li><a href="./medicalTeamList?mid=3" class="mid" style="color: white;">비뇨의학과</a></li>
									<li><a href="./medicalTeamList?mid=4">내과</a></li>
									<li><a href="./medicalTeamList?mid=5" id="last_li">신경외과</a></li>
								</c:when>
								<c:when test="${mid eq '4'}">
									<li><a href="./medicalTeamList?mid=1">이비인후과</a></li>
									<li><a href="./medicalTeamList?mid=2">외과</a></li>
									<li><a href="./medicalTeamList?mid=3">비뇨의학과</a></li>
									<li><a href="./medicalTeamList?mid=4" class="mid" style="color: white;">내과</a></li>
									<li><a href="./medicalTeamList?mid=5" id="last_li">신경외과</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="./medicalTeamList?mid=1">이비인후과</a></li>
									<li><a href="./medicalTeamList?mid=2">외과</a></li>
									<li><a href="./medicalTeamList?mid=3">비뇨의학과</a></li>
									<li><a href="./medicalTeamList?mid=4">내과</a></li>
									<li><a href="./medicalTeamList?mid=5" id="last_li" class="mid" style="color: white;">신경외과</a></li>
								</c:otherwise>
							</c:choose>
				</ul>
			</div>
			
			<div id="doctor_list">
				<c:forEach items="${list }" var="list" varStatus="i">
				<c:if test="${i.index eq 0 }">
				<h3>${list.med_office}</h3>
				</c:if>
				<hr class="hr1">
				
				<!-- 의사 리스트 시작 -->
				<div class="list" id="list${i }">
					<div class="list_profile">
							<img alt="" src="../resources/file/${list.doctorImagesVO.oname}">
					</div>
					<div class="list_info">
						<h2 class="name">${list.name } 교수</h2>
						<p class="med_office">진료과</p><span>${list.med_office }</span><br>
						<p class="pro_field">전문분야</p><span>${list.pro_field }</span>
					</div>
					
					<div class="list_btn">
						<a href="../reserve/reserveNomal?name=${list.name}">진료예약</a>
						<a href="" data-toggle="modal" data-target="#myModal_${i.index+1}">의료진소개</a>
					</div>
				</div>
				</c:forEach>
				<!-- --------------------------- -->
				
			
			
			</div>
			
			
	<!-- 모달창 -->
	<!-- 나중에 foreach로 id 뒤 숫자 varstatus 값으로 구분 -->
	<c:forEach items="${list}" var="list" varStatus="i">
	  <div class="modal fade" id="myModal_${i.index+1}" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">의료진 소개</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="modal_title_box">
		        	<p class="modal_med_office_title">${list.med_office}</p>
		        	<h2 class="modal_med_office">${list.name } 교수</h2>
		        </div>
				<!-- 진료과목 -->
				<div class="modal_info">
					<h3 class="modal_pro_field_title">전문분야</h3>
					<p class="modal_pro_field">${list.pro_field }</p>
				</div>	
	        		<hr>
				<!-- 교수 프로필 -->
				<div class="modal_profile">
					<img alt="" src="../resources/file/${list.doctorImagesVO.oname}">
				</div>
				
				<!-- 경력/활동 -->
				<div class="modal_career">
					
					<div class="career">
						<h3>경력</h3>
						<ul>
							<c:forTokens items="${list.career }" delims="," var="item">
								<li>· ${item }</li>
							</c:forTokens>
						</ul>
					</div>
					
					<div class="major_act">
						<h3>주요활동</h3>
						<ul>
							<c:forTokens items="${list.major_act}" delims="," var="item2">
								<li>· ${item2}</li>
							</c:forTokens>
						</ul>
					</div>
				</div>   
				
	        </div>
	        
				<!-- 진료예약 버튼 -->
				<div id="btn_box">
				<a href="../reserve/reserveNomal?name=${list.name}" id="reserve_btn">진료예약</a>
				</div>       
	      </div>
    	</div>
 	 </div>
 	 </c:forEach>
 	 <!-- ---------- -->
 	 
			
			
		</div>
		
	</div>
	
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>