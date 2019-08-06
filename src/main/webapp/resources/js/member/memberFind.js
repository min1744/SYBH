$(function() {
	var checkEmail = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@]).{14,32}$/;
	$('#submit').click(function() {
		var email = $('#email').val();
		var extension = email.substring(email.lastIndexOf('.')+1);
		if(checkEmail.test(email) && (extension == 'com' || extension == 'kr' || extension == 'net')){
			var site = null;
			var address = email.substring(email.indexOf("@")+1);
			var addressList = ['naver.com', 'gmail.com', 'hanmail.net',
							   'empal.com', 'hotmail.com', 'yahoo.co.kr',
							   'hanmir.com', 'hitel.net', 'kebi.com',
							   'netian.com', 'nate.com', 'dreamwiz.com',
							   'orgio.net', 'korea.com', 'wail.co.kr',
							   'lycos.co.kr', 'chol.com', 'intizen.com',
							   'freechal.com', 'teramail.com', 'metq.com'];
			//드림위즈는 2019년7월30일부로 서비스 종료
			//나머지 null값은 인증불가(?)
			var siteList = ['https://nid.naver.com/nidlogin.login?url=http%3A%2F%2Fmail.naver.com%2F', 'https://www.google.com/intl/ko/gmail/about/#', 'https://mail.daum.net/login?url=https%3A%2F%2Fmail.daum.net%2F',
							'http://home.mail.nate.com/login/login.html?s=mail&redirect=http%3A%2F%2Fmail3.nate.com%2F', 'http://www.hotmail.com/', 'https://overview.mail.yahoo.com/',
							null, null, null,
							'https://www.netian.com/usr/com/index.vw', 'http://home.mail.nate.com/login/login.html?s=mail&redirect=http%3A%2F%2Fmail3.nate.com%2F', null,
							null, 'http://www.korea.com', null,
							'http://www.lycos.co.kr/', 'http://www.chol.com', null,
							null, 'http://www.teramail.com', null];
			for(var i = 0; i < addressList.length; i++){
				if(address == addressList[i]){
					site = siteList[i];
					break;
				}
			}
			
			$.ajax({
				url:"./memberEmailCheck",
				type:"POST",
				data:{
					email:email
				},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						alert("이메일이 발송되었습니다.");
						if(site != null){
							window.open(site, 'newWindow');//브라우저 새 창 열기
						}
						$('#form').submit();
					} else{
						alert("존재하지 않는 이메일입니다.");
					}
				}
			});
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