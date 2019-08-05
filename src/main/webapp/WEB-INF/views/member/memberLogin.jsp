<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberLogin.css" rel="stylesheet">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://www.google.com/recaptcha/api.js"></script>
<script type="text/javascript">
	$(function() {
		//id - enter event
		$('#id').keypress(function(event) {
			if (event.which == 13) {
				$('#login').click();
				return false;
			}
		});

		//pw - enter event
		$('#pw').keypress(function(event) {
			if (event.which == 13) {
				$('#login').click();
				return false;
			}
		});

		//login form check
		$('#login').click(function() {
			var id = $('#id').val();
			var pw = $('#pw').val();
			if (id == '') {
				alert('아이디를 입력해주세요.');
			} else if (pw == '') {
				alert('비밀번호를 입력해주세요.')
			} else {
				/*$.ajax({
					url : './VerifyRecaptcha',
					type : 'POST',
					data : {
						recaptcha : $("#g-recaptcha-response").val()
					},
					success : function(data) {
						data = data.trim();
						if(data == '1'){
							$('#form').submit();
						} else if(data == '2') {
							alert("자동 가입 방지 봇을 확인 한 뒤 진행 해 주세요.");
						} else {
							alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
						}
					}
				});*/
				$('#form').submit();
			}
		});
		
		//kakaoLogin
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('2cd6749259ffdeeb04fac6151f7cd93d');
		
		$("#kakaoLogin").click(function() {
			Kakao.Auth.loginForm({
				//login이 성공했을 때
				success : function(authObj){
					location.href="./getInfo?access_token="+authObj.access_token;
				},
				//login 실패했을 때
				fail : function(errorObj){
					alert(authObj);
				}
			});
		});

		$("#logout").click(function() {
			//logout();
			location.href="./kakaoLogout";
		});
	    
	    //로그아웃
	    function logout() {
	    	var o = window.open("http://developers.kakao.com/logout");
	    	
		   /*  Kakao.Auth.logout(function() {
				alert('logout');
			}); */
		}
	    
	    //현재상태
	    function status() {
		    Kakao.Auth.getStatus(function(statusObj) {
				console.log(statusObj);
			});
		    
	    status();
		}
	  //]]>
	});
</script>
</head>
<body>
	<!-- header 추가 -->
	<c:import url="../common/header.jsp" />

	<div id="login_box">
		<div id="log">
			<div id="log_title">
				<img alt="" src="../resources/images/user.png">
				<p id="main_title">로그인</p>
				<p id="sub_title">
					쌍용백병원 홈페이지 회원 서비스는<br>로그인 후 이용하실 수 있습니다.
				</p>
			</div>
			<div id="login_form">
				<form action="./memberLogin" method="post" id="form">
					<input type="text" name="id" id="id" placeholder="아이디">
					<input type="password" name="pw" id="pw" placeholder="비밀번호">
					<div id="remember_box">
						<input type="checkbox" name="remember" id="remember"
						style="display: inline-block;">
						<label for="remember">아이디 저장</label>
					</div>
				</form>
				<button id="login">로그인</button>
				<div class="g-recaptcha" data-sitekey="6LeDI7EUAAAAAGkmcXlqsEb9zLw7i7ShMS0eAI8B"></div>
				<ul>
					<li><a href="./memberIdFind">아이디</a></li>
					<li>/</li>
					<li><a href="./memberPwFind">비밀번호 찾기</a></li>
					<li style="margin: 0 5px;">│</li>
					<li><a href="./memberAgree">회원가입</a></li>
				</ul>
				<button id="naver">네이버 아이디로 로그인</button>
				<img id="kakaoLogin" src="../resources/images/kakao_account_login_btn_medium_narrow.png">
			</div>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
</body>
</html>