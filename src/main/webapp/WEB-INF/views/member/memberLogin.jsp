<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
		//reCaptcha
		$("#test_btn").click(function() {
            $.ajax({
                url: '/reCAptcha/VerifyRecaptcha',
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function(data) {
                    switch (data) {
                        case 0:
                            alert("자동 가입 방지 봇 통과");
                            break;

                        case 1:
                            alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                            break;

                        default:
                            alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                            break;
                    }
                }
            });
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
			<p id="main_title">로그인</p>
			<p id="sub_title">쌍용백병원 홈페이지 회원 서비스는<br>로그인 후 이용하실 수 있습니다.</p>
		</div>
		<div id="login_form">
			<form action="./memberLogin" method="post" id="form">
				<input type="text" name="id" id="id" placeholder="아이디">
				<input type="password" name="pw" id="pw" placeholder="비밀번호">
			</form>
			<button id="login">로그인</button>
				<!--여기에 div 추가 -->
				<!-- <button id="test_btn">테스트 버튼</button> -->
				<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
				<!-- 여기에 스크립트 추가 -->
				<ul>
				<li><a href="./memberIdFind">아이디</a></li>
				<li>/</li>
				<li><a href="./memberPwFind">비밀번호 찾기</a></li>
				<li style="margin: 0 5px;">│</li>
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