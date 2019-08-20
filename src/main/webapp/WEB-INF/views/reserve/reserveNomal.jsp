<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveNomal.css" rel="stylesheet">
<c:import url="../temp/boot.jsp" />
<link rel="stylesheet" href="../resources/css/bootstrap-material-datetimepicker.css" />
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<!--<link rel="stylesheet" href="../resources/css/material.min.css" /> -->

<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/material.min.js"></script>
<script type="text/javascript" src="../resources/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-material-datetimepicker.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

		
		
		/////////////////////캘린더
			
		
			var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	        var date = new Date();//today의 Date를 세어주는 역할
	        
	        
	      
	 
	        


	        
	        
	        ////////////////////// 캘린더 끝
	        
	        
	        $(function() {
	        	var date = new Date();
	        	var year = date.getFullYear();
		        var month = new String(date.getMonth()+1);
		        var day = new String(date.getDate());
		        
		        if(month.length == 1){ 
		      	  month = "0" + month; 
		      	} 
		      	if(day.length == 1){ 
		      	  day = "0" + day; 
		      	} 
		      	var today = year+"-"+month+"-"+day;
	        	
	        	
	        	$('#time_box').hide();
	        	$('#reserve_ok').hide();
	        	var medic = '${medic}';
	        	var name = '${medic.name}';
	        	var med_office ='${medic.med_office}';
	        	var docnum='${medic.num}';
	        	if(medic!=''){
	        		$('#reserve_ok').show();
	        		$('#doc').html(name);
	        		$('#off').html(med_office);
	        		$('#docnum').val(docnum+1);
	        	} 
	        	
	        	$('.select_btn').click(function() {
					$('#reserve_ok').show();
				});
	        	
	        
			/* 재혁 */
			$('.select_btn').click(function(){
				//$('#ti').text('');
				var index = $(this).attr('data-num');
				//의사 이름 불러오기
				name = $("#name"+index).attr('title');
				$('#doc').html(name);
				name = $('#doc').text();
				//진료과 불러오기
				med_office = $('#med'+index).attr('title');
				$('#off').html(med_office);
				med_office = $('#off').text();
				var docnum = $("#name"+index).attr('data-toggle');
				$('#docnum').val(docnum);
				$.ajax({
					url:"../schedule/getOneList",
					type:"POST",
					data:{
						num:docnum
					},success: function(data) {
						//var str = JSON.stringify(data);
						//var list = $.parseJSON(data);
						$.each(data,function(){
							if(this["ddate"] != null){						
							var str = this["ddate"].split(' ');//일정표를 파싱
							
							$('.doctor').each(function(){ //휴진날짜, 진료 날짜를 먼저 찾음(위치)
								var dta = $(this).attr('dt-data');
								
								if(dta == str[0]){ //진료날짜와 캘린더에서 일치하는 버튼 찾음
									$('.time').each(function(){
										var time = $(this).val();
										
										if(time == str[1].substring(0,5)){ //버튼 의 시간을 찾아서 hidden 클래스 추가
											$(this).hide();
											
										}
									});
								}
							});
							
							}
							
						});
						//console.log(data);
						
						
						
					}
				});//ajax
			});
			var date ='';
			$('#date').click(function(){
				//this.style.color="white";
				//this.style.backgroundColor="#153f91";
				$('#time_box').show();

			});
			var time ='';
			$('.time').click(function(){
				date = $('#date').val();
				time = $(this).val();
				if(date ==''){
					alert('날짜를 먼저 선택해 주세요');
					return false;
				}
				$('#ti').html(time);
			})
			var reserve = '';
			$('#reserve_ok').click(function() {
				date = $('#date').val();
        		if(date ==''){
        			alert('날짜를 선택해 주세요');
        			return false;
        		}
        		//alert(date);
        		if(date<today){
        			alert(today +' 이후로 선택 가능합니다.');
        			time ='';
        			return false;
        		}
        		time = $('#ti').text();
        		if(time ==''){
        			alert('시간을 선택해 주세요');
        			return false;
        		}
        		reserve = date+" "+time;
        		
				var result = confirm('[예약정보]\n환자명 : ${memberVO.name}\n병원/진료과 : '+name+'\n의료진 : '+med_office+'\n예약시간 : '+reserve+'\n예약하시겠습니까?');
				
				if(result) {
					var id = '${memberVO.id}';
					var num = $('#docnum').val();
					var status = 0;
					var doc = $('#doc').text();
					var off = $('#off').text();
					var contents = doc+"/"+off;
					var reserve_date = reserve;
					$.ajax({
						url: "../treatBreakDown/treatWrite",
						type: "POST",
						data: {
							id : id,
							num : num,
							status : status,
							contents : contents,
							reserve_date : reserve_date
						},
						success: function(data){
							if(data=='1'){
								console.log(data);
								alert('예약이 완료되었습니다.');
								location.href="../member/memberNomal";
							}
						}
					});//ajax
				} else {
					alert('예약이 취소되었습니다.');
				}
				
			});	
	        	
	        	
			});
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">일반 진료 예약</p>
			<p id="sub_title">빠르고 편리한 온라인 진료 예약이 가능합니다.</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./outgoingInfo">외래/접수안내</a></li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="./reserveNomal" style="color:#6BB5DB;">일반진료 예약</a></li>
				<li><a href="./reserveMedical">건강검진 예약</a></li>
				<li><a href="../member/memberNomal">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="doctorList">
			
			<div id="office_select">
				<h3>진료과목 선택</h3>
				<ul>
					<li><a href="./reserveNomal?mid=1">이비인후과</a></li>
					<li><a href="./reserveNomal?mid=2">외과</a></li>
					<li><a href="./reserveNomal?mid=3">비뇨의학과</a></li>
					<li><a href="./reserveNomal?mid=4">내과</a></li>
					<li><a href="./reserveNomal?mid=5" id="last_li">신경외과</a></li>	
				</ul>
			</div>
			
			<div id="doctor_list">
				<h3>의료진 선택</h3>
				
				<div id="doctor_select">
				
					<!-- 의사 리스트 시작 -->
					<c:choose>
					<c:when test="${medic eq null}">
					<c:forEach items="${list }" var="list" varStatus="i">
					<div class="list" id="list${i}">
						<div class="list_profile">
							<img alt="" src="../resources/file/${list.doctorImagesVO.fname}">
						</div>
						
						<div class="list_info">
							<h2 class="name" id="name${i.index}"  title="${list.name}" data-toggle="${list.num }">${list.name }</h2>
							<p class="med_office" id="med${i.index}" title="${list.med_office }">진료과</p><span>${list.med_office}</span><br>
							<p class="pro_field">전문분야</p><span>${list.pro_field }</span>
						</div>
						
						<div class="list_btn">
							<button class="select_btn" id="medic_select" data-num="${i.index }">선택</button>
							<button class="info_btn" data-toggle="modal" data-target="#myModal_${i.index+1}">의료진 소개</button>
						</div>
					</div>
					</c:forEach>
					</c:when>
					<c:otherwise>
					
						<div class="list" id="list">
							<div class="list_profile">
							<img alt="" src="../resources/file/${medic.doctorImagesVO.fname}">
						</div>
						
						<div class="list_info">
							<h2 class="name" id="name" title="${medic.name}" data-toggle="${medic.num}">${medic.name}</h2>
							<p class="med_office" id="med" title="${medic.med_office}">진료과</p><span>${medic.med_office}</span><br>
							<p class="pro_field">전문분야</p><span>${medic.pro_field}</span>
							</div>
						<div class="list_btn">
							<button class="info_btn" data-toggle="modal" data-target="#myModal_${medic.num }">의료진 소개</button>
						</div>
						</div>
					</c:otherwise>
					
					</c:choose>
					<!-- --------------------------- -->
				
				</div>
				
			</div>
			
		<div id="all_select_box">
			<div id="user_info">
				<h3>진료 환자 정보</h3>
				
				<div id="user_info_box">
					<p class="user_name">환자명 : </p><span>${memberVO.name}</span><br>
					<p id="user_office">병원/진료과 : </p><span id="off"></span><br>
					<p id="user_doctor">의료진 : </p><span id="doc"></span><br>
					<p id="user_date">진료날짜 : </p><span id="day"><input type="text" id="date" class="floating-label" placeholder="날짜를 선택하세요" style="border: inherit; background: inherit; width: 130px;"></span><br>
					<p>진료시간 : </p><span id="ti"></span><br>
					<input type="hidden" id="docnum">						
				</div>
				
			</div>

			<script type="text/javascript">
		$(document).ready(function()
		{
			
			$('#date').bootstrapMaterialDatePicker
			({
				time: false
			});
			
	
		});
		
		</script>
			<div id="select_time">
				
				<div id="time_box">
					
					<button value="09:00" class="time">09:00</button>
					<button value="10:00" class="time">10:00</button>
					<button value="11:00" class="time">11:00</button>
					<button value="12:00" class="time">12:00</button>
					<button value="13:00" class="time">13:00</button>
					<button value="14:00" class="time">14:00</button>
					<button value="15:00" class="time">15:00</button>
					<button value="16:00" class="time">16:00</button>				
				</div>
				
			</div>
			
			<!-- 예약확인 버튼 -->
			<button type="submit" id="reserve_ok" >예약하기</button>
		</div>	
			
		</div>
		
	</div>
</div>

<!-- 모달창 -->
	<!-- 나중에 foreach로 id 뒤 숫자 varstatus 값으로 구분 -->
	<!--한명 선택했을 때 모달창  -->
	<c:choose>
		<c:when test="${medic ne null }">
		 <div class="modal fade" id="myModal_${medic.num}" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">의료진 소개</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="modal_title_box">
		        	<p class="modal_med_office_title" id="med" id="med" title="${medic.med_office }">${medic.med_office}</p>
		        	<h2 class="modal_med_office" id="name" title="${medic.name}" data-toggle="${medic.num }">${medic.name } 교수</h2>
		        </div>
	        		<hr>
				
				<div class="modal_profile">
					<img alt="" src="../resources/file/${medic.doctorImagesVO.fname}">
				</div>
				
				<div class="modal_info">
					<h3 class="modal_pro_field_title">전문분야</h3>
					<p class="modal_pro_field">${medic.pro_field }</p>
				</div>	
				
				
				<div class="modal_career">
					
					<div class="career">
						<h3>경력</h3>
						<ul>
							<c:forTokens items="${medic.career }" delims="," var="item">
								<li>· ${item }</li>
							</c:forTokens>
						</ul>
					</div>
					
					<div class="major_act">
						<h3>주요활동</h3>
						<ul>
							<c:forTokens items="${medic.major_act}" delims="," var="item2">
								<li>· ${item2}</li>
							</c:forTokens>
						</ul>
					</div>
				
				</div>          
	          
	          
	        </div>
	      </div>
    	</div>
 	 </div>
		</c:when>
	</c:choose>
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
					<img alt="" src="../resources/file/${list.doctorImagesVO.fname}">
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
	      </div>
    	</div>
 	 </div>
 	 </c:forEach>
 	 <script type="text/javascript">
 	 	$(function(){
 	 		$('.reserve_btn').click(function(){
 	 			var index = $(this).attr('data-num');
				//의사 이름 불러오기
				name = $("#name"+index).attr('title');
				
				$('#doc').html(name);
				//진료과 불러오기
				med_office = $('#med'+index).attr('title');
				
				$('#off').html(med_office);
				$('#reserve_ok').show();
 	 		});
 	 	});
 	 </script>
 	 <!-- ---------- -->

<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>
							
							
							
							
						
						
						
						
						