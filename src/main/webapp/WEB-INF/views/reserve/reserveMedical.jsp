﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveMedical.css" rel="stylesheet">
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	
	$(function() {
		$('#btn').click(function() {
			var check =  $("input[name='a']:checked").attr('title');
			var price = $('#price').attr('title');
			price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			var result = confirm('['+check+']-['+price+'원] 으로 예약하시겠습니까?');
			price = $('#price').attr('title');
			
			
			if(result) {
				
				//location.href="./medicalConfirm?check="+check+"&price="+price;
				post({'check':check,'price':price});
			} else {
				
			}
		});
		//post방식으로 넘기기
		function post(params){
			var form = document.createElement("form");
			form.setAttribute("method","POST");
			form.setAttribute("action","./medicalConfirm");
			for(var key in params){
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type","hidden");
				hiddenField.setAttribute("name",key);
				hiddenField.setAttribute("value",params[key]);
				form.appendChild(hiddenField);
			}
			document.body.appendChild(form);
			form.submit();
		}
		//////////// radio 체크시 하단 내용 변경 코드
		for(var i = 1; i < 15; i++) {
			
			eval("var div"+i+"=document.getElementById('select_info_"+i+"')");
			
			if(i > 1) {
				eval("$(div"+i+").css('display', 'none')");
			}
			
			$('#check'+i).click(function() {
				$('.change_box').html(eval("$(div"+$(this).val()+").css('display', 'block')"));
				
			});
			
		}

	});

		
</script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />


<div id="board">
		<div id="board_title">
			<p id="title">건강검진 예약</p>
			<p id="sub_title">빠르고 편리한 온라인 건강검진 예약이 가능합니다.</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./outgoingInfo">외래/접수안내</a></li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="./reserveNomal">일반진료 예약</a></li>
				<li><a href="./reserveMedical" style="color:#6BB5DB;">건강검진 예약</a></li>
				<li><a href="../member/memberNomal">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="doctorList">
			
			<div id="office_select">
				<h3>검진 선택</h3>
				<ul>
					<li>
					<img alt="" src="../resources/images/stethoscope.png">
					<input type="radio" value="1" name="a" checked="checked" id="check1" title="기본 건강검진(남)">
					<label for="check1">기본 종합검진(남)</label><br>
					<input type="radio" value="2"  name="a" id="check2" title="기본 종합검진(여)">
					<label for="check2">기본 종합검진(여)</label>
					</li>
					<li>
					<img alt="" src="../resources/images/hug.png">
					<input type="radio" value="3"  name="a" id="check3" title="쌍용 플래티넘(남)">
					<label for="check3">쌍용 플래티넘(남)</label><br>
					<input type="radio" value="4"  name="a" id="check4" title="쌍용 플래티넘(여)">
					<label for="check4">쌍용 플래티넘(여)</label><br>
					<input type="radio" value="5"  name="a" id="check5" title="러브 패키지(남)">
					<label for="check5">러브 패키지(남)</label><br>
					<input type="radio" value="6"  name="a" id="check6" title="러브 패키지(여)">
					<label for="check6">러브 패키지(여)</label>
					</li>
					<li>
					<img alt="" src="../resources/images/heart.png">
					<input type="radio" value="7"  name="a" id="check7" title="심장 정밀검진 1">
					<label for="check7">심장 정밀검진 1</label><br>
					<input type="radio" value="8"  name="a" id="check8" title="심장 정밀검진 2">
					<label for="check8">심장 정밀검진 2</label><br>
					<input type="radio" value="9"  name="a" id="check9" title="심장 정밀검진 3">
					<label for="check9">심장 정밀검진 3</label><br>
					</li>
					<li>
					<img alt="" src="../resources/images/microscope.png">
					<input type="radio" value="10"  name="a" id="check10" title="소화기 정밀검진">
					<label for="check10">소화기 정밀검진</label><br>
					<input type="radio" value="11"  name="a" id="check11" title="폐 정밀검진">
					<label for="check11">폐 정밀검진</label><br>
					<input type="radio" value="12"  name="a" id="check12" title="뇌 정밀검진">
					<label for="check12">뇌 정밀검진</label><br>
					</li>
					<li id="last_li">
					<img alt="" src="../resources/images/hospital-bed.png">
					<input type="radio" value="13"  name="a" id="check13" title="숙박 검진(남)">
					<label for="check13">숙박 검진(남)</label><br>
					<input type="radio" value="14"  name="a" id="check14" title="숙박 검진(여)">
					<label for="check14">숙박 검진(여)</label>
					</li>
				</ul>
			</div>
			
		<div class="change_box">
			<c:import url="../common/reserve_medical.jsp" />
		</div>
			
			<div id="reserve_btn">
				<button id="btn">다음단계</button>
			</div>
			
			
			
		</div>
		
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>