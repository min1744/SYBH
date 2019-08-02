<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	var email = '${email}';
	var authCode = '${authCode}';
	if(email != '' && authCode != ''){
		alert("이메일이 인증되었습니다.");
		location.href = "./memberLogin";
	}
});
</script>
</head>
<body>

</body>
</html>