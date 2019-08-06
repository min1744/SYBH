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
<script type="text/javascript" src="../resources/js/member/memberLogin.js"></script>
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
						<input type="checkbox" name="remember" id="remember" style="display: inline-block;">
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
				<img id="kakaoLogin" src="../resources/images/kakao_account_login_btn_medium_narrow.png">
			</div>
		</div>
	</div>
	<!-- footer 추가 -->
	<c:import url="../common/footer.jsp" />
</body>
</html>