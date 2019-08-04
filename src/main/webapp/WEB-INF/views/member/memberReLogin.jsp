<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberLogin.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//id - enter event
		$('#id').keypress(function(event) {
			if(event.which == 13){
				$('#login').click();
				return false;
			}
		});
		
		//pw - enter event
		$('#pw').keypress(function(event) {
			if(event.which == 13){
				$('#login').click();
				return false;
			}
		});
		
		//login form check
		$('#login').click(function() {
			var id = $('#id').val();
			var pw = $('#pw').val();
			if(id == ''){
				alert('아이디를 입력해주세요.');
			} else if(pw == ''){
				alert('비밀번호를 입력해주세요.')
			} else {
				$('#form').submit();
			}
		});
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
			<p id="main_title">회원정보 수정</p>
			<p id="sub_title">회원정보 수정은 아이디와 비밀번호를<br>확인 후 진행할 수 있습니다.</p>
		</div>
		<div id="login_form">
			<form action="./memberUpdate" method="post" id="form">
				<input type="text" name="id" id="id" placeholder="아이디">
				<input type="password" name="pw" id="pw" placeholder="비밀번호">
			</form>
			<button id="login" style="margin-bottom: 80px;">로그인</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>