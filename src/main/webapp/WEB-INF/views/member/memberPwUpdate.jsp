<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberPwUpdate.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/member/memberPwUpdate.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
<div id="login_box">
	<div id="log">
		<div id="log_title">
			<img alt="" src="../resources/images/user.png">
			<p id="main_title">비밀번호 변경</p>
			<p id="sub_title">비밀번호를 변경해주시기 바랍니다.</p>
		</div>
		<div id="login_form">
			<form action="./memberSetPwUpdate" method="post" id="form">
				<input type="hidden" name="email" id="email" value="${email}">
				<input type="password" name="currPw" id="currPw" placeholder="현재 비밀번호">
				<input type="password" name="newPw" id="newPw" placeholder="새로운 비밀번호">
				<input type="password" name="newPw2" id="newPw2" placeholder="새로운 비밀번호 확인">
			</form>
			<button id="update" style="margin-bottom: 60px;">수정하기</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>