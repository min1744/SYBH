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
	//form check
	$("#join").click(function() {
		var emptyCheck = true;
		var checkId = /^(?=.*[a-zA-Z])(?=.*[0-9]){6,12}$/;
		var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$/;
		var checkName = /^(?=.*[a-zA-Z가-힣]).{1,17}$/;
		var checkRes_reg_num1 = /^(?=.*[0-9]).{6,6}$/;
		var checkRes_reg_num2 = /^(?=.*[0-9]).{7,7}$/;
		var checkPhone1 = /^(?=.*[0-9]).{3,4}$/;
		var checkPhone2 = /^(?=.*[0-9]).{3,5}$/;
		var checkPhone3 = /^(?=.*[0-9]).{4,4}$/;
		var checkEmail1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;
		var checkEmail2 = /^(?=.*[a-z])(?=.*[.]).{8,12}$/;
		$('.empty_check').each(function() {
			if($(this).val()==''){
				emptyCheck = false;
			}
		});

		if(emptyCheck){
			$("#form").submit();
		} else {
			alert('내용을 모두 입력해주세요.');
		}
	});
	
	//id duplication check
	$('#id').keyup(function() {
		var id = $('#id').val();
		$.ajax({
			url:"../member/memberIdCheck",
			type:"POST",
			data:{
				id:id
			},
			success:function(data){
				data = data.trim();
				if(data == '1'){
					$('#id_result').html('존재하는 아이디입니다.');
					$('#id_result').css("color", "red");
				} else{
					$('#id_result').html('사용 가능한 아이디입니다.');
					$('#id_result').css("color", "blue");
				}
			}
		});
	});
	
	//pw and pw2 equal check
	$('#pw2').keyup(function() {
		var pw = $('#pw').val();
		var pw2 = $(this).val();
		if(pw.equals(pw2)){
			$('#pw2_result').html('비밀번호가 일치합니다.');
			$('#pw2_result').css("color", "blue");
		} else {
			$('#pw2_result').html('비밀번호가 일치하지 않습니다.');
			$('#pw2_result').css("color", "red");
		}
	});
	
	//res_reg_num check
	
	
	//email check
	
	
	//주민번호에 따른 gender selected & age put
	$('#res_reg_num2').blur(function() {
		var gender = $(this).val().substring(0, 1)*1;
		var birthYear = $('#res_reg_num1').val().substring(0, 2)*1;
		var now = new Date();
		if(gender/2 == 0 && gender < 5 && gender > 0){
			$('#woman').prop("selected", "selected");
		} else {
			$('#man').prop("selected", "selected");
		}
		if((gender == 1 || gender == 2) && gender < 5 && gender > 0 && birthYear >= 0){
			birthYear = birthYear + 1900;
		} else if((gender == 3 || gender == 4) && gender < 5 && gender > 0 && birthYear >= 0){
			birthYear = birthYear + 2000;
		}
		var age = now.getFullYear()*1 - birthYear + 1;
		$('#age').val(age);
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
					<td><form:input path="id" cssClass="empty_check" id="id"/><input type="button" value="중복확인" id="overlap"><span class="sub">영문 + 숫자 혼용 6~12자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="id"/></div><div id="id_result"></div></td>
				</tr>
				<tr>
					<th>비밀번호<span>*</span></th>
					<td><form:password path="pw" cssClass="empty_check"/><span class="sub">영어, 숫자, 특수문자(!@#$%^*+=-) 3가지 조합으로 10~15자 이여야 합니다.</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="pw"/></div><div id="pw_result"></div></td>
				</tr>
				<tr>
					<th>비밀번호 확인<span>*</span></th>
					<td><form:password path="pw2" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="pw2"/></div><div id="pw2_result"></div></td>
				</tr>
				<tr>
					<th>성명(한글)<span>*</span></th>
					<td><form:input path="name" cssClass="empty_check"/></td>
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
					<form:input path="phone1" cssClass="empty_check"/>
					<span class="common">-</span>
					<form:input path="phone2" cssClass="empty_check"/>
					<span class="common">-</span>
					<form:input path="phone3" cssClass="empty_check"/>
					</td>
				</tr>	
				<tr>
					<td></td>
					<td><div><form:errors path="phone1"/></div><div><form:errors path="phone2"/></div><div><form:errors path="phone3"/></div><div id="phone_result"></div></td>
				</tr>
				<tr>
					<th>이메일<span>*</span></th>
					<td id="email_input"><form:input path="email1" cssClass="empty_check"/><span class="common">@</span><form:input path="email2" cssClass="empty_check"/>
					<br><span class="sub_2">하나의 아이디에 하나의 이메일 주소를 사용하며, 이메일 주소는 비밀번호 찾기 또는 인터넷 예약 등의 용도에 사용됩니다.</span><br></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="email1"/></div><div><form:errors path="email2"/></div><div id="email_result"></div></td>
				</tr>
				<tr>
					<th>성별<span>*</span></th>
					<td id="age_td"><form:radiobutton path="gender" value="1" id="man" cssClass="empty_check"/><span>남자</span><form:radiobutton path="gender" value="2" id="woman" cssClass="empty_check"/><span>여자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="gender"/></div><div id="gender_result"></div></td>
				</tr>
				<tr>
					<th>나이<span>*</span></th>
					<td><form:input path="age" id="age" cssClass="empty_check" readonly="readonly"/></td>
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