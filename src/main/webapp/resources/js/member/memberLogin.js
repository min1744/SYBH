	$(function() {
		//id - enter event
		$('#id').keypress(function(event) {
			if (event.which == 13) {
				$('#login').click();
				return false;
			}
		});

		//pw - enter event
		$('#pw').keypress(function(event) {
			if (event.which == 13) {
				$('#login').click();
				return false;
			}
		});

		//login form check
		$('#login').click(function() {
			var id = $('#id').val();
			var pw = $('#pw').val();
			if (id == '') {
				alert('아이디를 입력해주세요.');
			} else if (pw == '') {
				alert('비밀번호를 입력해주세요.')
			} else {
				/*$.ajax({
					url : './VerifyRecaptcha',
					type : 'POST',
					data : {
						recaptcha : $("#g-recaptcha-response").val()
					},
					success : function(data) {
						data = data.trim();
						if(data == '1'){*/
							//차단된 아이디인지 확인
							$.ajax({
								url : './checkUnserviceability',
								type : 'POST',
								data : {
									id : id
								},
								success : function(data) {
									data = data.trim();
									if(data == '0'){
										$('#form').submit();
									} else {
										alert("접근이 차단되었습니다. 대표전화로 문의해주시기 바랍니다.");
										alert(data);
									}
								}
							});
						/*} else if(data == '2') {
							alert("자동 가입 방지 봇을 확인 한 뒤 진행 해 주세요.");
						} else {
							alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
						}
					}
				});*/
			}
		});
		
		//kakaoLogin
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('2cd6749259ffdeeb04fac6151f7cd93d');
		
		$("#kakaoLogin").click(function() {
			Kakao.Auth.loginForm({
				//login이 성공했을 때
				success : function(authObj){
					location.href="./getInfo?access_token="+authObj.access_token;
				},
				//login 실패했을 때
				fail : function(errorObj){
					alert(authObj);
				}
			});
		});
		
		//remember control
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#id").val(key); 
	     
	    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#remember").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#remember").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
	    function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1);
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	     
	    function getCookie(cookieName) {
	        cookieName = cookieName + '=';
	        var cookieData = document.cookie;
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1)end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	        }
	        return unescape(cookieValue);
	    }
	});