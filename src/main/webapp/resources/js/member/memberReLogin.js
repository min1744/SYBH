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