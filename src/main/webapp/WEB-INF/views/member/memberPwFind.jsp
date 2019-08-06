<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberFind.css" rel="stylesheet">
<script type="text/javascript" src="../resources/js/member/memberFind.js"></script>
</head>
<body>
<!-- header 추가 -->
<c:import url="../common/header.jsp" />
<div id="board">
		<!-- <div id="board_title">
			<p>로그인</p>
		</div> -->
</div>
<div id="find_box">
	<div id="find">
		<div id="find_title">
			<img alt="" src="../resources/images/user.png">
			<p id="main_title">비밀번호 찾기</p>
			<p id="sub_title">비밀번호를 잊으셨습니까?</p>
		</div>
		<div id="find_form">
			<form action="./memberPwFind" method="post" id="form">
				<input type="email" name="email" id="email" placeholder="이메일을 입력하세요">
			</form>
			<button id="submit">인증메일 보내기</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>