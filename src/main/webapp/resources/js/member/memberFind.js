$(function() {
	var checkEmail = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@]).{14,32}$/;
	$('#submit').click(function() {
		var email = $('#email').val();
		var extension = email.substring(email.lastIndexOf('.')+1);
		if(checkEmail.test(email) && (extension == 'com' || extension == 'kr' || extension == 'net')){
			alert("이메일이 발송되었습니다.");
			$('#form').submit();
		} else {
			alert("올바른 형식의 이메일이 아닙니다.");
		}
	});
	
	$('#email').keypress(function(event) {
		if(event.which == 13){
			$('#submit').click();
			return false;
		}
	});
});