<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberJoin.css" rel="stylesheet">
<script type="text/javascript">
$(function() {
	var checkId = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/;
	var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/;
	var checkEngName = /^(?=.*[a-zA-Z]).{1,17}$/;
	var checkKorName = /^(?=.*[가-힇]).{1,17}$/;
	var checkRes_reg_num1 = /^(?=.*[0-9]).{6,6}$/;
	var checkRes_reg_num2 = /^(?=.*[0-9]).{7,7}$/;
	var checkPhone1 = /^(?=.*[0-9]).{3,3}$/;
	var checkPhone2 = /^(?=.*[0-9]).{3,4}$/;
	var checkPhone3 = /^(?=.*[0-9]).{4,4}$/;
	var checkEmail1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$/;
	var checkEmail2 = /^(?=.*[a-z])(?=.*[.]).{8,12}$/;
	
	var alertId = false;
	var alertPw1 = false;
	var alertPw2 = false;
	var alertName = false;
	var alertRes1 = false;
	var alertRes2 = false;
	var alertPhone = false;
	var alertEmail = false;
	var alertAge = false;
	
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
		} else {
			$('#pw2_result').html('비밀번호가 일치하지 않습니다.');
			$('#pw2_result').css("color", "red");
			alertPw2 = false;
		}
	});
	
	//name expression rationnelle check
	$('#name').keyup(function() {
		var name = $(this).val();
		if(checkEngName.test(name)){
			$('#name_result').html('');
			alertName = true;
		} else if(checkKorName.test(name)){
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
		var checkRes_reg_num = false;
		var l1 = res_reg_num1.length;
		var l2 = res_reg_num2.length;
		var front = 0;
		var back = 0;
		if(checkRes_reg_num1.test(res_reg_num1) && checkRes_reg_num2.test(res_reg_num2)){
			//주민번호에 따른 gender selected & age put
			var gender = res_reg_num2.substring(0, 1)*1;
			var birthYear = res_reg_num1.substring(0, 2)*1;
			var now = new Date();
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
			var result = 11-((front + back)%11)%10;
			var end = res_reg_num2.substring(6, 7)*1;
			if(result == end){
				$('#res_reg_num_result').html('');
				alertRes1 = true;
			} else {
				$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
				$('#res_reg_num_result').css("color", "red");
				alertRes1 = false;
			}
		} else if(res_reg_num1 != '' && res_reg_num2 != '') {
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
			var checkRes_reg_num = false;
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
				var result = 11-((front + back)%11)%10;
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
		} else if(res_reg_num1 != '' && res_reg_num2 != '') {
			$('#res_reg_num_result').html('잘못된 형식의 주민등록번호입니다.');
			$('#res_reg_num_result').css("color", "red");
			alertRes2 = false;
		}
	});
	
	//phone1 expression rationnelle check
	$('#phone1').keyup(function() {
		var phone1 = $(this).val();
		var phone2 = $('#phone2').val();
		var phone3 = $('#phone3').val();
		if(checkPhone1.test(phone1) && checkPhone2.test(phone2) && checkPhone3.test(phone3)){
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
			$('#phone_result').html('');
			alertPhone = true;
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
			$('#phone_result').html('');
			alertPhone = true;
		} else {
			$('#phone_result').html('잘못된 형식의 번호입니다.');
			$('#phone_result').css("color", "red");
			alertPhone = false;
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
		if((checkEmail1.test(email1) && checkEmail2.test(email2)) && (extension == 'com' || extension == 'kr' || extension == 'net')){
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
			$("#form").submit();
		}
	});
});
</script>
</head>
<body>
	<!-- header 추가 -->
	<c:import url="../common/header.jsp" />
	<div id="board">
		<div id="board_title">
			<p id="title">회원가입</p>
			<p id="sub_title">회원가입을 하시면 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
		</div>
	</div>
	<div id="join_box">
	<div id="join_form">
		<p><span>*</span>표기 항목은 필수 입력 항목 입니다.</p>
		<form:form commandName="memberVO" id="form">
		<table>
			<tbody>
				<tr>
					<th>아이디(ID)<span>*</span></th>
					<td><form:input path="id" id="id" cssClass="empty_check"/><span class="sub">영문 + 숫자 혼용 6~20자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="id"/></div><div id="id_result"></div></td>
				</tr>
				<tr>
					<th>비밀번호<span>*</span></th>
					<td><form:password path="pw" id="pw" cssClass="empty_check"/><span class="sub">영어, 숫자, 특수문자(!@#$%^*+=-) 3가지 조합으로 10~15자 이여야 합니다.</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="pw"/></div><div id="pw_result"></div></td>
				</tr>
				<tr>
					<th>비밀번호 확인<span>*</span></th>
					<td><form:password path="pw2" id="pw2" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="pw2"/></div><div id="pw2_result"></div></td>
				</tr>
				<tr>
					<th>성명(한글)<span>*</span></th>
					<td><form:input path="name" id="name" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="name"/></div><div id="name_result"></div></td>
				</tr>
				<tr>
					<th>주민등록번호<span>*</span></th>
					<td><form:input path="res_reg_num1" id="res_reg_num1" cssClass="empty_check"/><span class="common">-</span><form:password path="res_reg_num2" id="res_reg_num2" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="res_reg_num1"/></div><div><form:errors path="res_reg_num2"/></div><div id="res_reg_num_result"></div></td>
				</tr>
				<tr>
					<th>핸드폰번호<span>*</span></th>
					<td>
					<form:input path="phone1" id="phone1" cssClass="empty_check"/>
					<span class="common">-</span>
					<form:input path="phone2" id="phone2" cssClass="empty_check"/>
					<span class="common">-</span>
					<form:input path="phone3" id="phone3" cssClass="empty_check"/>
					</td>
				</tr>	
				<tr>
					<td></td>
					<td><div><form:errors path="phone1"/></div><div><form:errors path="phone2"/></div><div><form:errors path="phone3"/></div><div id="phone_result"></div></td>
				</tr>
				<tr>
					<th>이메일<span>*</span></th>
					<td id="email_input"><form:input path="email1" id="email1" cssClass="empty_check"/><span class="common">@</span><form:input path="email2" id="email2" cssClass="empty_check"/>
					<br><span class="sub_2">하나의 아이디에 하나의 이메일 주소를 사용하며, 이메일 주소는 비밀번호 찾기 또는 인터넷 예약 등의 용도에 사용됩니다.</span><br></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="email1"/></div><div><form:errors path="email2"/></div><div id="email_result"></div></td>
				</tr>
				<tr>
					<th>성별<span>*</span></th>
					<td id="age_td"><form:radiobutton path="gender" value="1" id="man" cssClass="empty_check"/><span>남자</span><form:radiobutton path="gender" value="2" id="woman" cssClass="empty_check"/><span>여자</span></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="gender"/></div><div id="gender_result"></div></td>
				</tr>
				<tr>
					<th>나이<span>*</span></th>
					<td><form:input path="age" id="age" cssClass="empty_check" readonly="true"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="age"/></div><div id="age_result"></div></td>
				</tr>
			</tbody>
		</table>
		</form:form>
		<div id="join_btn">
			<button id="join">가입완료</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>