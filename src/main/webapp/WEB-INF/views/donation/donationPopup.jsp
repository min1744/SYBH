<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용백병원::후원하기</title>
<link href="../resources/css/donation.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		//////////////재혁 후원
		 $("#check_modules").click(function () {
				var IMP = window.IMP; 
				IMP.init('imp95286508');
				
				IMP.request_pay({
				pg: 'inicis',  //결제 방법 카카오페이 계좌입금 등 
				pay_method: 'card', //결제 수단
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: '쌍용UNICEF', //주문 창에서 보일 이름
				amount: 1000,  //가격
				//구매자 정보
				buyer_email: 'cjh3576@naver.com', //세션에서 이메일 받기
				buyer_name: '최재혁',
				buyer_tel: '010-9964-4774',
				buyer_addr: '주소',
				m_redirect_url: '성공시 url'
				}, function (rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						purchase();
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += rsp.error_msg;
					}
					alert(msg);
				});
			});
		
		
		/////////////결제 끝
	});
</script>
</head>
<body>

<div id="wrap">
	<div id="popup_box">
		
		<div id="donation_box">
			<div id="nav_img">
				<img src="../resources/images/nav_img.png">
			</div>
			
			<div id="donation_title">
				<h3>쌍용백병원 후원하기</h3>
				<p>
				쌍용백병원이 국민 보건 향상에 기여 할 수 있도록<br>
				사랑과 격려의 마음으로 후원금 마련에 동참해 주시기 바랍니다. 
				</p>
				
				<div id="donation_member">
					<table>
						<tr>
							<th>후원자ID</th>
							<td>admin</td>
							<th>후원자 이름</th>
							<td>admin</td>
						</tr>
						<tr>
							<th>후원자연락처</th>
							<td>010-1111-2222</td>
							<th>후원날짜</th>
							<td>2019-07-23</td>
						</tr>
					</table>
				</div>
				
				<div id="donation_price">
					<span>후원금액</span>
					<span><input type="text"></span>
					<span>원</span>
				</div>
				
				<div id="donation_agree">
					<h4>후원 이용 약관</h4>
					<div id="agree_box">
						<p>
						1. [개인정보 수집 목적] 쌍용백병원 발전후원회(이하 후원회)는 기부자의 인적사항 등 개인정보를 다음의 목적을 위해 수집하고 있습니다.<br>
<br>가. 기부금영수증 발급<br>
나. 기부자 예우프로그램 시행<br>
다. 기부자와의 커뮤니케이션 <br>
<br>
2. [개인정보 수집 항목] 후원회에서 기부자의 동의를 거쳐 수집하는 개인정보는 성명, 주민등록번호, 생일, 연락처, 이메일, 주소 등 입니다.<br>
<br>
3. [회원가입] 기부자는 인적사항 등 개인정보를 입력하여 후원회 회원으로 신규가입할 수 있으며, 기존 회원의 경우 기존 개인정보 확인 및 수정이 가능합니다.<br>
<br>
4. [기부약정] 기부자는 후원목적(기금, 지원단위, 기부동기 등)과 납입정보(납입방식, 약정금액 등) 작성 및 확인을 통하여 기부약정이 가능하며, 이는 약정서작성과 동일한 기부약정효력을 가집니다.<br>
<br>
5. [개인정보 및 기부약정정보 관리] 후원회는 기부자의 동의를 거쳐 수집하는 개인정보 및 기부약정정보를 보관하며, 기부자에게 사전에 밝힌 목적 이외 다른 목적으로 사용하지 않고 외부로 유출하지 않습니다. <br>다만, 기부자가 해당정보에 대한 삭제를 요청하는 경우에는 추후 조회나 이용이 불가능한 상태로 처리됩니다. 또한 이 방침 및 약관에 규정되어 있지 아니한 사항은 서울대학교병원 홈페이지의 회원약관 및 개인정보처리방침에 준합니다.<br>
6. [개인정보 수집 동의 거부] 기부자는 후원회의 개인정보 수집 동의에 거부할 수 있으며 동의 거부시에는 회원가입, 기부약정, 기부금영수증 발급 등 일부 서비스가 제한됩니다.
<br>
7. [개인정보 침해사항의 신고] 후원회 홈페이지 이용 중 개인정보 유출 가능성 등이 발견되는 경우에는 사무국으로 알려주시기 바랍니다.
<br>
후원회 사무국<br>
E-mail : snuhfund@snuh.org<br>
Tel : 02-2072-1004<br>
Fax : 02-2072-4041
						</p>
					</div>
					<div id="agree_check">
					<input type="checkbox" class="check">위 이용약관에 동의합니다.
				</div>
				</div>
				
				<a href="" id="donation_btn">후원하기</a>
				
			</div>
			
		</div>
		
		<div id="comment_box">
			<p>후원자<span>145</span>명</p>
			<table>
				<tr>
					<td class="comment_num">145</td>
					<th>adm*** 님이 1,456,789원 후원하셨습니다.</th>
					<td class="comment_date">2019-07-23</td>
				</tr>
				<tr>
					<td class="comment_num">144</td>
					<th>adm*** 님이 1,456,789원 후원하셨습니다.</th>
					<td class="comment_date">2019-07-23</td>
				</tr>
				<tr>
					<td class="comment_num">143</td>
					<th>adm*** 님이 1,456,789원 후원하셨습니다.</th>
					<td class="comment_date">2019-07-23</td>
				</tr>
				<tr>
					<td class="comment_num">142</td>
					<th>adm*** 님이 1,456,789원 후원하셨습니다.</th>
					<td class="comment_date">2019-07-23</td>
				</tr>
				<tr>
					<td class="comment_num">141</td>
					<th>adm*** 님이 1,456,789원 후원하셨습니다.</th>
					<td class="comment_date">2019-07-23</td>
				</tr>
			
			</table>
		</div>
	
	</div>
</div>
</body>
</html>