<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="../resources/css/error.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
</head>
<script type="text/javascript">
	$(function() {
		$('#btn').click(function() {
			location.href="../";
		});
	});
</script>
<body>

<div id="wrap">

	<div id="error_box">
		
		<img alt="logo" src="../resources/images/logo.png">
		<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
		<p>찾고 계신 페이지가 존재하지 않거나 잘못된 링크를 사용하셨습니다.<br>
			다시 한번 확인해 주시고 이용하여 주시기 바랍니다.<br>
			감사합니다.</p>
			
		<button id="btn">메인페이지</button>
	
	</div>

</div>

</body>
</html>