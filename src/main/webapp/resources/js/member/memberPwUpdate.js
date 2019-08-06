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