<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberPwUpdate.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/member/memberReLogin.js"></script>
<script type="text/javascript">
$(function() {
	$('#update').click(function() {
		var newPw = $('#newPw').val();
		var newPw2 = $('#newPw2').val();
		console.log(newPw);
		console.log(newPw2);
		if(newPw == newPw2){
			var currPw = $('#currPw').val();
			var email = $('#email').val();
			$.ajax({
				url:"./memberPwCheck",
				type:"POST",
				data:{
					pw:currPw,
					email:email
				},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						alert("비밀번호가 변경되었습니다.");
						$("#form").submit();
					} else{
						alert("'현재 비밀번호'가 일치하지 않습니다.");
					}
				}
			});
		} else {
			alert("'새로운 비밀번호'가 일치하지 않습니다.");
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