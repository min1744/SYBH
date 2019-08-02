<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/reserveConfirm.css" rel="stylesheet">
<!--추가  -->
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
   $(function() {
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 
	
	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
	var today = year+"-"+month+"-"+day;
	
	
	   
	   
	   	var name = '${memberVO.name}';
		var phone = '${memberVO.phone}';
		var email = '${memberVO.email}';
		var opt = 'card';
		var category = 0;
		var check_date ='';
		$('#pay').click(function() {
			var c = $('#check').prop("checked");
			var pay = $('#date').val();
			check_date = $('#date').val();
			
			if(pay ==''){
				alert('날짜를 선택해주세요');
				$('#date').focus();
				return false;
			}
			if(today>check_date){
				alert(today+' 이후로 선택 가능합니다');
				return false;
			}
			else if(!c){
				alert('약관 동의를 해주세요');
				return false;
			}else{
				var result = confirm('예약하시겠습니까?');
				if(result) {
					var amount = '${param.price}';
					var id = '${memberVO.id}';
					var IMP = window.IMP;
					IMP.init('imp95286508');

					IMP.request_pay({
						pg : 'kakaopay', //결제 방법 카카오페이 계좌입금 등 
						pay_method : 'card', //결제 수단
						merchant_uid : 'merchant_' + new Date().getTime(),
						name : '쌍용백병원 건강검진', //주문 창에서 보일 이름
						amount : amount, //가격
						//구매자 정보
						buyer_email : email, //세션에서 이메일 받기
						buyer_name : name,
						buyer_tel : phone,
						//buyer_addr: '주소',
						m_redirect_url : '성공시 url'
					}, function(rsp) {
						console.log(rsp);
						if (rsp.success) {
							var msg = '예약이 완료 되었습니다.';
							//msg += '고유ID : ' + rsp.imp_uid;
							//msg += '상점 거래ID : ' + rsp.merchant_uid;
							//msg += '결제 금액 : ' + rsp.paid_amount;
							//msg += '카드 승인번호 : ' + rsp.apply_num;
							purchase();
						} else {
							var msg = '예약에 실패하였습니다.';
							//msg += rsp.error_msg;
						}
						alert(msg);
					});
					
				} else {
					alert('예약이 취소 되었습니다');
				}
			}//else
		}); //pay 클릭시
		
		
		//결제 테이블 등록
		function purchase(){
			var amount = '${param.price}';
			$.ajax({
				url : "../pay/donationWrite",
				type : "POST",
				data : {
					id : '${memberVO.id}',
					price : amount,
					opt : opt,
					category : category
				},
				success : function(data) {
					//성공시 진료예약 테이블 등록
				check();
					
				}
			}); //ajax
		} //결제 테이블 등록 끝
		
   		
		//진료내역 테이블 등록
   		function check(){
			var id = '${memberVO.id}';
			var contents = '${param.check}';
			
			$.ajax({
				url : "../checkup/checkUpWrite",
				type : "POST",
				data : {
					id : id,
					contents : contents,
					check_date : check_date
				},
				success:function(data){
					if(data=='1'){
						location.href='../member/memberMedical';
					}
				}
			});
		}
		
   		
   		//진료내역 테이블 등록 끝
   		
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
				<li><a href="../member/memberNomal">진료 예약 조회</a></li>
			</ul>
		
		</div>
		
		
		<div id="confirmList">
		
			<div id="confirm_title">
				<span>[선택하신 검진프로그램]</span><span id="title">${param.check }</span>
				<p class="sub_title"><img src="../resources/images/info.png">건강검진은 본인만 예약이 가능하며, 대리 예약은 불가능합니다.</p>				
			</div>
			
			<div id="user_info">
				<h3>예약 정보</h3>
				<table>
				
					<tr>
						<th>예약자 성함</th>
						<td class="td_border" colspan="2">${memberVO.name }</td>
					</tr>
					<tr>
						<th>예약자 연락처</th>
						<td class="td_border" colspan="2">${memberVO.phone }</td>
					</tr>
					<tr>
						<th>예약자 이메일</th>
						<td class="td_border" colspan="2">${memberVO.email }</td>
					</tr>
					<tr>
						<th>희망 예약일</th>
						<td class="td_border">
			<!-- 달력 시작  -->
				<div id="cal_box">
					<div class="col-md-6">
						<div class="form-control-wrapper">
							<input type="text" id="date" class="form-control floating-label" placeholder="날짜를 선택하세요">
						</div>
					</div>
				</div>
			<!-- 달력 끝 -->
			
			<!--  -->
			<script type="text/javascript">
		$(document).ready(function()
		{
			$('#date').bootstrapMaterialDatePicker
			({
				time: false
			});

			$('#time').bootstrapMaterialDatePicker
			({
				date: false,
				shortTime: true,
				format: 'HH:mm'
			});

			$('#date-format').bootstrapMaterialDatePicker
			({
				format: 'dddd DD MMMM YYYY - HH:mm'
			});
			$('#date-fr').bootstrapMaterialDatePicker
			({
				format: 'DD/MM/YYYY HH:mm',
				lang: 'fr',
				weekStart: 1, 
				cancelText : 'ANNULER'
			});

			$('#date-end').bootstrapMaterialDatePicker
			({
				weekStart: 0, format: 'DD/MM/YYYY HH:mm'
			});
			$('#date-start').bootstrapMaterialDatePicker
			({
				weekStart: 0, format: 'DD/MM/YYYY HH:mm'
			}).on('change', function(e, date)
			{
				$('#date-end').bootstrapMaterialDatePicker('setMinDate', date);
			});

			$('#min-date').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm', minDate : new Date() });

			$.material.init()
		});
		
		</script>
			
			<!--  -->
						</td>
						<td class="select_date" id="select_date"><span></span></td>
					</tr>
					<tr>
						<th>선택된 검진</th>
						<td class="td_border" colspan="2">${param.check } 
						<span class="price">(
						<fmt:formatNumber value="${param.price }" pattern="#,###" />&nbsp;원
						)</span></td>
					</tr>
					<tr>
						<th>최종 검진 비용</th>
						<td style="font-size: 1.2em; font-weight: 700; color:  #153F91;" class="td_border" colspan="2">
						<fmt:formatNumber value="${param.price }" pattern="#,###" />원
						</td>
					</tr>
				
				</table>
			</div>
			
			
			<div id="agree_box">
			
				<h3>개인정보 수집 및 이용 안내</h3>
				<table>
					<thead>
						<tr>
							<th>수집/이용 목적</th>
							<th>수집 항목</th>
							<th>보유 및 이용 기간</th>
						</tr>
						<tr>
							<td class="td_border_2">건강검진에 대한 본인 확인 및 예약을 위하여 수집, 이용됩니다.</td>
							<td class="td_border_2">이름, 연락처, 이메일</td>
							<td class="td_border_2">3년</td>
						</tr>
					</thead>
				</table>
				
				<p id="left"><img src="../resources/images/info.png">위의 개인정보 수집 이용에 대한 동의를 거부할 수 있습니다. 이 경우 해당 선택서비스 제공은 제한됩니다.<p>
					<p id="right"><input type="checkbox" id="check">
					<label for="check">위의 개인정보 수집, 이용에 동의합니다.</label></p>
			</div>
			
			
			<div id="page_btn">
				<a href="./reserveMedical" id="prev">이전</a>
				<button id="pay">예약하기</button><!-- 결제창 -->
			</div>
			
		
		</div>
		
	</div>
	
</div>


<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>