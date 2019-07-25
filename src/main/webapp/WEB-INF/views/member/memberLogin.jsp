<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberLogin.css" rel="stylesheet">
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
<div id="board">
		<!-- <div id="board_title">
			<p>로그인</p>
		</div> -->
</div>
<div id="login_box">
	<div id="log">
		<div id="log_title">
			<img alt="" src="../resources/images/user.png">
			<p id="main_title">로그인</p>
			<p id="sub_title">쌍용백병원 홈페이지 회원 서비스는<br>로그인 후 이용하실 수 있습니다.</p>
		</div>
		<div id="login_form">
			<form action="./memberLogin" method="post">
				<input type="text" name="id" id="id" placeholder="아이디">
				<input type="password" name="pw" id="pw" placeholder="비밀번호">
				<button id="login">로그인</button>
			</form>
			<ul>
				<li><a href="./memberFind">아이디/비밀번호 찾기</a></li>
				<li style="margin: 0 10px;">│</li>
				<li><a href="./memberAgree">회원가입</a></li>
			</ul>
			<button id="naver">네이버 아이디로 로그인</button>
			<button id="kakao">카카오 아이디로 로그인</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>