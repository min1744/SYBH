<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/medicalTeam.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
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
				<li><a href="#">병원소개</a></li>
				<li><a href="#" style="color:#6bb5db;">의료진 소개</a></li>
				<li><a href="#">층별안내</a></li>
				<li><a href="#">오시는 길</a></li>
			</ul>
		</div>
		
		
		<div id="doctorList">
		
			<div id="doctor_search">
				<select id="select_box">
					<option>진료과목</option>
					<option>의료진 이름</option>
				</select>
				<input type="text" name="search" id="search" placeholder="검색어를 입력해주세요">
				<button id="search_btn">검색</button>
			</div>
			
			<div id="doctor_select">
				<h3>진료과목 선택</h3>
				<ul>
					<li><a href="./medicalTeamList?mid=1">이비인후과</a></li>
					<li><a href="./medicalTeamList?mid=2">외과</a></li>
					<li><a href="./medicalTeamList?mid=3">비뇨의학과</a></li>
					<li><a href="./medicalTeamList?mid=4">내과</a></li>
					<li><a href="./medicalTeamList?mid=5" id="last_li">신경외과</a></li>	
				</ul>
			</div>
			
			<div id="doctor_list">
				<c:forEach items="${list }" var="list" varStatus="i">
				<c:if test="${i.index eq 0 }">
				<h3>${list.med_office}</h3>
				</c:if>
				<hr>
				
				<!-- 의사 리스트 시작 -->
				<div class="list" id="list${i }">
					<div class="list_profile">
						<img alt="" src="../resources/images/01_${i.index+1}.jpg">
					</div>
					<div class="list_info">
						<h2 class="name">${list.name } 교수</h2>
						<p class="med_office">진료과</p><span>${list.med_office }</span><br>
						<p class="pro_field">전문분야</p><span>${list.pro_field }</span>
					</div>
					
					<div class="list_btn">
						<a href="">진료예약</a>
						<a href="" data-toggle="modal" data-target="#myModal_${i.index+1}">의료진소개</a>
						<a href="">진료일정표</a>
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
	        		<hr>
				
				<div class="modal_profile">
					<img alt="" src="../resources/images/01_${i.index+1 }.jpg">
				</div>
				
				<div class="modal_info">
					<h3 class="modal_pro_field_title">전문분야</h3>
					<p class="modal_pro_field">${list.pro_field }</p>
				</div>	
				
				<a href="../reserve/reserveNomal" id="reserve_btn">진료예약</a>
				
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