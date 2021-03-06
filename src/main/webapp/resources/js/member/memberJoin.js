$(function() {
	var checkId = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/;
	var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/;
	var checkEngName = /^(?=.*[a-zA-Z]).{1,17}$/;
	var checkKorName = /^(?=.*[가-힇]).{1,17}$/;
	var checkRes_reg_num1 = /^(?=.*[0-9]).{6,6}$/;
	var checkRes_reg_num2 = /^(?=.*[0-9]).{7,7}$/;
	var checkPhone1 = /^(?=.*[0-1]).{3,3}$/;
	var checkPhone2 = /^(?=.*[0-9]).{4,4}$/;
	var checkPhone3 = /^(?=.*[0-9]).{4,4}$/;
	var checkEmail1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/;
	var checkEmail2 = /^(?=.*[a-z])(?=.*[.]).{8,12}$/;
	
	var alertId = true;
	var alertPw1 = true;
	var alertPw2 = true;
	var alertName = true;
	var alertRes1 = true;
	var alertRes2 = true;
	var alertPhone = true;
	var alertEmail = true;
	var alertAge = true;
	
	//id expression rationnelle & duplication check
	$('#id').keyup(function() {
		var id = $(this).val();
		if(checkId.test(id)){
			$.ajax({
				url:"./memberIdCheck",
				type:"POST",
				data:{
					id:id
				},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						$('#id_result').html('존재하는 아이디입니다.');
						$('#id_result').css("color", "red");
						alertId = false;
					} else{
						$('#id_result').html('사용 가능한 아이디입니다.');
						$('#id_result').css("color", "blue");
						alertId = true;
					}
				}
			});
		} else {
			$('#id_result').html('잘못된 형식의 아이디입니다.');
			$('#id_result').css("color", "red");
			alertId = false;
		}
	});
	
	//pw expression rationnelle check
	$('#pw').keyup(function() {
		var pw = $(this).val();
		if(checkPw.test(pw)){
			$('#pw_result').html('');
			alertPw1 = true;
		} else {
			$('#pw_result').html('잘못된 형식의 비밀번호입니다.');
			$('#pw_result').css("color", "red");
			alertPw1 = false;
		}
	});
	
	$('#pw').change(function() {
		$('#pw2_result').html('비밀번호가 일치하지 않습니다.');
		$('#pw2_result').css("color", "red");
		alertPw2 = false;
	});
	
	//pw & pw2 equal check
	$('#pw2').keyup(function() {
		var pw = $('#pw').val();
		var pw2 = $(this).val();
		if(pw == pw2){
			$('#pw2_result').html('비밀번호가 일치합니다.');
			$('#pw2_result').css("color", "blue");
			alertPw2 = true;
			$('#name').focus();
		} else {
			$('#pw2_result').html('비밀번호가 일치하지 않습니다.');
			$('#pw2_result').css("color", "red");
			alertPw2 = false;
		}
	});
	
	//name expression rationnelle check
	$('#name').keyup(function() {
		var name = $(this).val();
		if(checkEngName.test(name) || checkKorName.test(name)){
			$('#name_result').html('');
			alertName = true;
		} else {
			$('#name_result').html('잘못된 형식의 이름입니다.');
			$('#name_result').css("color", "red");
			alertName = false;
		}
	});
	
	//res_reg_num1 expression rationnelle check && gender selected & age put
	$('#res_reg_num1').keyup(function() {
		var res_reg_num1 = $(this).val();
		var res_reg_num2 = $('#res_reg_num2').val();
		//주민등록번호 : ABCDEF-GHIJKLM
		//M = (11 - ((2×A + 3×B + 4×C + 5×D + 6×E + 7×F + 8×G + 9×H + 2×I + 3×J + 4×K + 5×L) % 11)) % 10
		var l1 = res_reg_num1.length;
		var l2 = res_reg_num2.length;
		var front = 0;
		var back = 0;
		if(checkRes_reg_num1.test(res_reg_num1) && checkRes_reg_num2.test(res_reg_num2)){
			var birthYear = res_reg_num1.substring(0, 2)*1;
			var birthMonth = res_reg_num1.substring(2, 4)*1;
			var birthDate = res_reg_num1.substring(4, 6)*1;
			var gender = res_reg_num2.substring(0, 1)*1;
			var now = new Date();
			var check = false;
			//gender selected
			if(gender == 1 || gender == 2){
				//1900년대 출생 남녀
				birthYear = birthYear + 1900;
			} else if(gender == 3 || gender == 4){
				//2000년대 출생 남녀
				birthYear = birthYear + 2000;
			} else if(gender == 9 || gender == 0){
				//1800년대 출생 남녀
				birthYear = birthYear + 1800;
			}
			//나머지는 외국인
			//5,6 : 1900년대 출생 외국인
			//7,8 : 2000년대 출생 외국인
			
			//age put
			var age = now.getFullYear()*1 - birthYear + 1;
			if(age >= 0 && age <= 120){
				$('#age').val(age);
				$('#age_result').html('');
				alertAge = true;
			} else if(age > 120){
				$('#age_result').html('120살 이하가 아닙니다.');
				$('#age_result').css("color", "red");
				alertAge = false;
			} else {
				$('#age_result').html('잘못된 나이입니다.');
				$('#age_result').css("color", "red");
				alertAge = false;
			}
			
			if(birthMonth > 0 && birthMonth < 13){// 1~12월
				if(birthMonth == 1 && birthMonth == 3 && birthMonth == 5 && birthMonth == 7 && birthMonth == 8 && birthMonth == 10 && birthMonth == 12){
					if(birthDate > 0 && birthDate < 32){
						check = true;
					} else {
						check = false;
					}
				} else {
					if(birthMonth == 2){ //2월생
						if(birthYear%4 == 0 && birthYear%100 != 0){ //윤년 계산
							if(birthDate > 0 && birthDate < 30){
								check = true;
							} else {
								check = false;
							}
						} else {
							if(birthDate > 0 && birthDate < 29){
								check = true;
							} else {
								check = false;
							}
						}
					} else {
						if(birthDate > 0 && birthDate < 31){
							check = true;
						} else {
							check = false;
						}
					}
				}
			} else {
				check = false;
			}
			//res_reg_num1 calculation
			for(var i = 0; i < l1; i++){
				var front_value_of_index = res_reg_num1.substring(i, i+1)*1;
				var f = front_value_of_index * (i+2);
				front += f;
			}
			//res_reg_num2 calculation
			for(var i = 0; i < l2-1; i++){
				var back_value_of_index = res_reg_num2.substring(i, i+1)*1;
				var b = 0;
				if(i > 1){
					b = back_value_of_index * i;
				} else {
					b = back_value_of_index * (i+8);
				}
				back += b;
			}
			//주민등록번호 체계 및 유효성 검사
			var result = (11-(front + back)%11)%10;
			var end = res_reg_num2.substring(6, 7)*1;
			if(result == end && check){
				$('#res_reg_num_result').html('');
				alertRes1 = true;
				alertRes2 = true;
			} else {
				$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
				$('#res_reg_num_result').css("color", "red");
				alertRes1 = false;
			}
		} else {
			$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
			$('#res_reg_num_result').css("color", "red");
			alertRes1 = false;
		}
		if(l1 == 6){
			$('#res_reg_num2').focus();
		}
	});
	
	//res_reg_num2 expression rationnelle check
	//gender selected
	//age put
	//지방자치단체 고유번호 범위지정(00~95)
	$('#res_reg_num2').keyup(function() {
		var res_reg_num1 = $('#res_reg_num1').val();
		var res_reg_num2 = $(this).val();
		if(checkRes_reg_num1.test(res_reg_num1) && checkRes_reg_num2.test(res_reg_num2)){
			//주민등록번호 : ABCDEF-GHIJKLM
			//M = (11 - ((2×A + 3×B + 4×C + 5×D + 6×E + 7×F + 8×G + 9×H + 2×I + 3×J + 4×K + 5×L) % 11)) % 10
			var l1 = res_reg_num1.length;
			var l2 = res_reg_num2.length;
			var location = res_reg_num2.substring(1, 3)*1;
			var front = 0;
			var back = 0;
			if(l2 == 7 && location < 96){
				//주민번호에 따른 gender selected & age put
				var gender = res_reg_num2.substring(0, 1)*1;
				var birthYear = res_reg_num1.substring(0, 2)*1;
				var now = new Date();
				if(gender%2 == 0){
					$('#woman').prop("checked", "checked");
				} else {
					$('#man').prop("checked", "checked");
				}
				if(gender == 1 || gender == 2){
					//1900년대 출생 남녀
					birthYear = birthYear + 1900;
				} else if(gender == 3 || gender == 4){
					//2000년대 출생 남녀
					birthYear = birthYear + 2000;
				} else if(gender == 9 || gender == 0){
					//1800년대 출생 남녀
					birthYear = birthYear + 1800;
				}
				//나머지는 외국인
				//5,6 : 1900년대 출생 외국인
				//7,8 : 2000년대 출생 외국인
				
				var age = now.getFullYear()*1 - birthYear + 1;
				if(age >= 0 && age <= 120){
					$('#age').val(age);
					$('#age_result').html('');
					alertAge = true;
				} else if(age > 120){
					$('#age_result').html('120살 이하가 아닙니다.');
					$('#age_result').css("color", "red");
					alertAge = false;
				} else {
					$('#age_result').html('잘못된 나이입니다.');
					$('#age_result').css("color", "red");
					alertAge = false;
				}
				
				//res_reg_num1 calculation
				for(var i = 0; i < l1; i++){
					var front_value_of_index = res_reg_num1.substring(i, i+1)*1;
					var f = front_value_of_index * (i+2);
					front += f;
				}
				//res_reg_num2 calculation
				for(var i = 0; i < l2-1; i++){
					var back_value_of_index = res_reg_num2.substring(i, i+1)*1;
					var b = 0;
					if(i > 1){
						b = back_value_of_index * i;
					} else {
						b = back_value_of_index * (i+8);
					}
					back += b;
				}
				//주민등록번호 체계 및 유효성 검사
				var result = (11-(front + back)%11)%10;
				var end = res_reg_num2.substring(6, 7)*1;
				if(result == end){
					$('#res_reg_num_result').html('');
					alertRes1 = true;
					alertRes2 = true;
				} else {
					$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
					$('#res_reg_num_result').css("color", "red");
					alertRes2 = false;
				}
			}
		} else {
			$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
			$('#res_reg_num_result').css("color", "red");
			alertRes2 = false;
		}
		if(l2 == 7){
			$('#phone1').focus();
		}
	});
	
	//phone1 expression rationnelle check
	$('#phone1').keyup(function() {
		var phone1 = $(this).val();
		var phone2 = $('#phone2').val();
		var phone3 = $('#phone3').val();
		var checkFront = false;
		if(checkPhone1.test(phone1) && checkPhone2.test(phone2) && checkPhone3.test(phone3)){
			if(phone1 == '010'){
				checkFront = true;
			} else {
				checkFront = false;
			}
		} else {
			checkFront = false;
		}
		
		if(checkFront){
			$('#phone_result').html('');
			alertPhone = true;
		} else {
			$('#phone_result').html('잘못된 형식의 번호입니다.');
			$('#phone_result').css("color", "red");
			alertPhone = false;
		}
		
		if(phone1.length == 3){
			$('#phone2').focus();
		}
	});
	
	//phone2 expression rationnelle check
	$('#phone2').keyup(function() {
		var phone1 = $('#phone1').val();
		var phone2 = $(this).val();
		var phone3 = $('#phone3').val();
		if(checkPhone1.test(phone1) && checkPhone2.test(phone2) && checkPhone3.test(phone3)){
			if(phone2*1 >= 0 && phone2*1 < 10000){
				$('#phone_result').html('');
				alertPhone = true;
			} else {
				$('#phone_result').html('잘못된 형식의 번호입니다.');
				$('#phone_result').css("color", "red");
			}
		} else {
			$('#phone_result').html('잘못된 형식의 번호입니다.');
			$('#phone_result').css("color", "red");
			alertPhone = false;
		}
		
		if(phone2.length == 4){
			$('#phone3').focus();
		}
	});
	
	//phone3 expression rationnelle check
	$('#phone3').keyup(function() {
		var phone1 = $('#phone1').val();
		var phone2 = $('#phone2').val();
		var phone3 = $(this).val();
		if(checkPhone1.test(phone1) && checkPhone2.test(phone2) && checkPhone3.test(phone3)){
			if(phone3*1 >= 0 && phone3*1 < 10000){
				$('#phone_result').html('');
				alertPhone = true;
			} else {
				$('#phone_result').html('잘못된 형식의 번호입니다.');
				$('#phone_result').css("color", "red");
				alertPhone = false;
			}
		} else {
			$('#phone_result').html('잘못된 형식의 번호입니다.');
			$('#phone_result').css("color", "red");
			alertPhone = false;
		}
		
		if(phone3.length == 4){
			$('#email1').focus();
		}
	});
	
	//email1 expression rationnelle check
	$('#email1').keyup(function() {
		var email1 = $('#email1').val();
		var email2 = $('#email2').val();
		if(checkEmail1.test(email1) && checkEmail2.test(email2)){
			$.ajax({
				url:"./memberEmailCheck",
				type:"POST",
				data:{
					email1:email1,
					email2:email2
				},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						$('#email_result').html('존재하는 이메일입니다.');
						$('#email_result').css("color", "red");
						alertEmail = false;
					} else{
						$('#email_result').html('사용 가능한 이메일입니다.');
						$('#email_result').css("color", "blue");
						alertEmail = true;
					}
				}
			});
		} else {
			$('#email_result').html('잘못된 형식의 이메일입니다.');
			$('#email_result').css("color", "red");
			alertEmail = false;
		}
	});
	
	//email2 expression rationnelle check
	$('#email2').keyup(function() {
		var email1 = $('#email1').val();
		var email2 = $('#email2').val();
		var extension = email2.substring(email2.lastIndexOf('.')+1);
		var check = false;
		if((checkEmail1.test(email1) && checkEmail2.test(email2)) && (extension == 'com' || extension == 'kr' || extension == 'net')){
			check = true;
			if(extension == 'kr'){
				extension = email2.substring(email2.indexOf('.')+1, email2.lastIndexOf('.'));
				var kr = ['co', 'pe', 'or', 'ne', 'go', 're', 'ac', 'hs', 'ms', 'es', 'sc'];
				for(var i = 0; i < kr.length; i++){
					check = false;
					if(extension == kr[i]){
						check = true;
						break;
					} else {
						check = false;
					}
				}
			}
		} else {
			check = false;
		}
		
		if(check){
			$.ajax({
				url:"./memberEmailCheck",
				type:"POST",
				data:{
					email1:email1,
					email2:email2
				},
				success:function(data){
					data = data.trim();
					if(data == '1'){
						$('#email_result').html('존재하는 이메일입니다.');
						$('#email_result').css("color", "red");
						alertEmail = false;
					} else{
						$('#email_result').html('사용 가능한 이메일입니다.');
						$('#email_result').css("color", "blue");
						alertEmail = true;
					}
				}
			});
		} else {
			$('#email_result').html('잘못된 형식의 이메일입니다.');
			$('#email_result').css("color", "red");
			alertEmail = false;
		}
	});
	
	//form check
	$("#join").click(function() {
		var emptyCheck = true;
		$('.empty_check').each(function() {
			if($(this).val()==''){
				emptyCheck = false;
			}
		});
		
		if(emptyCheck == false){
			alert('내용을 모두 입력해주세요.');
		} else if(alertId == false){
			alert('아이디를 확인해주세요.');
		} else if(alertPw1 == false || alertPw2 == false){
			alert('비밀번호를 확인해주세요.');
		} else if(alertName == false){
			alert('이름을 확인해주세요.');
		} else if(alertRes1 == false || alertRes2 == false){
			alert('주민등록번호를 확인해주세요.');
		} else if(alertPhone == false){
			alert('핸드폰 번호를 확인해주세요.');
		} else if(alertEmail == false){
			alert('이메일을 확인해주세요.')
		} else if(alertAge == false){
			alert('나이를 확인해주세요. 주민등록번호가 잘못되었습니다.');
		} else {
			var site = null;
			var email2 = $('#email2').val();
			var address = ['naver.com', 'gmail.com', 'hanmail.net',
						   'empal.com', 'hotmail.com', 'yahoo.co.kr',
						   'hanmir.com', 'hitel.net', 'kebi.com',
						   'netian.com', 'nate.com', 'dreamwiz.com',
						   'orgio.net', 'korea.com', 'wail.co.kr',
						   'lycos.co.kr', 'chol.com', 'intizen.com',
						   'freechal.com', 'teramail.com', 'metq.com'];
			//드림위즈는 2019년7월30일부로 서비스 종료
			//나머지 null값은 인증불가(?)
			var page = ['https://nid.naver.com/nidlogin.login?url=http%3A%2F%2Fmail.naver.com%2F', 'https://www.google.com/intl/ko/gmail/about/#', 'https://mail.daum.net/login?url=https%3A%2F%2Fmail.daum.net%2F',
						'http://home.mail.nate.com/login/login.html?s=mail&redirect=http%3A%2F%2Fmail3.nate.com%2F', 'http://www.hotmail.com/', 'https://overview.mail.yahoo.com/',
						null, null, null,
						'https://www.netian.com/usr/com/index.vw', 'http://home.mail.nate.com/login/login.html?s=mail&redirect=http%3A%2F%2Fmail3.nate.com%2F', null,
						null, 'http://www.korea.com', null,
						'http://www.lycos.co.kr/', 'http://www.chol.com', null,
						null, 'http://www.teramail.com', null];
			for(var i = 0; i < address.length; i++){
				if(email2 == address[i]){
					site = page[i];
					break;
				}
			}
			
			if(site == null){
				alert("존재하지 않거나 서비스 종료된 메일입니다.");
			} else {
				var originEmail = $('#originEmail').val();
				var updateEmail = null;
				if(originEmail != ''){
					alert("회원정보가 수정되었습니다.");
					var email1 = $('#email1').val();
					var email2 = $('#email2').val();
					updateEmail = email1 + "@" + email2;
					if(originEmail != updateEmail){
						alert("이메일 변경 - 인증을 다시 해주시기 바랍니다.");
						window.open(site, 'newWindow');//브라우저 새 창 열기
					}
					$("#form").submit();
				} else {
					alert("회원가입 되었습니다.");
					alert("이메일 인증 후 사용 가능합니다.");
					window.open(site, 'newWindow');//브라우저 새 창 열기
					$("#form").submit();
				}
			}
		}
	});
});