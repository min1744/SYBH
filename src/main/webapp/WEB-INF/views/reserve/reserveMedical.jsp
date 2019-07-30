<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveMedical.css" rel="stylesheet">
<script type="text/javascript">
	
	$(function() {
		$('#btn').click(function() {
			var result = confirm('[검진명]-[검진금액] 으로 예약하시겠습니까?');
			if(result) {
				
				location.href="./medicalConfirm";
				
			} else {
				
			}
		});
		
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
			<p>건강검진 예약</p>
		</div>

	<div id="board_box">
	
		
		<div id="board_nav">
		
			<ul>
				<li>진료 예약/조회</li>
				<li><a href="./reserveInfo">예약안내</a></li>
				<li><a href="./reserveNomal">일반진료 예약</a></li>
				<li><a href="#" style="color:#6BB5DB;">건강검진 예약</a></li>
				<li><a href="#">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="doctorList">
			
			<div id="office_select">
				<h3>검진 선택</h3>
				<ul>
					<li>
					<img alt="" src="../resources/images/stethoscope.png">
					<input type="radio" value="1" name="a" checked="checked" id="check1">
					<label for="check1">기본 종합검진(남)</label><br>
					<input type="radio" value="2"  name="a" id="check2">
					<label for="check2">기본 종합검진(여)</label>
					</li>
					<li>
					<img alt="" src="../resources/images/hug.png">
					<input type="radio" value="3"  name="a" id="check3">
					<label for="check3">쌍용 플래티넘(남)</label><br>
					<input type="radio" value="4"  name="a" id="check4">
					<label for="check4">쌍용 플래티넘(여)</label><br>
					<input type="radio" value="5"  name="a" id="check5">
					<label for="check5">러브 패키지(남)</label><br>
					<input type="radio" value="6"  name="a" id="check6">
					<label for="check6">러브 패키지(여)</label>
					</li>
					<li>
					<img alt="" src="../resources/images/heart.png">
					<input type="radio" value="7"  name="a" id="check7">
					<label for="check7">심장 정밀검진 1</label><br>
					<input type="radio" value="8"  name="a" id="check8">
					<label for="check8">심장 정밀검진 2</label><br>
					<input type="radio" value="9"  name="a" id="check9">
					<label for="check9">심장 정밀검진 3</label><br>
					</li>
					<li>
					<img alt="" src="../resources/images/microscope.png">
					<input type="radio" value="10"  name="a" id="check10">
					<label for="check10">소화기 정밀검진</label><br>
					<input type="radio" value="11"  name="a" id="check11">
					<label for="check11">폐 정밀검진</label><br>
					<input type="radio" value="12"  name="a" id="check12">
					<label for="check12">뇌 정밀검진</label><br>
					</li>
					<li id="last_li">
					<img alt="" src="../resources/images/hospital-bed.png">
					<input type="radio" value="13"  name="a" id="check13">
					<label for="check13">숙박 검진(남)</label><br>
					<input type="radio" value="14"  name="a" id="check14">
					<label for="check14">숙박 검진(여)</label>
					</li>
				</ul>
			</div>
			
		<div class="change_box">
			<c:import url="../common/reserve_medical.jsp" />
		</div>
			
			<div id="reserve_btn">
				<button id="btn">건강검진 예약</button>
			</div>
			
			
			
			
		</div>
		
	</div>
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>