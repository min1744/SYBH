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
		$('.empty_check').each(function() {
			if($(this).val()==''){
				emptyCheck = false;
			}
		});

		if(emptyCheck){
			$("#form").submit();
		} else{
			alert('내용을 모두 입력해주세요.');
		}
	});
	
	//id체크
	$('#id').blur(function() {
		//아이디 체크하는 표현식
		var checkId=/^(?=.*[a-zA-Z])(?=.*[0-9]){6,12}$/;
		if(checkId){
			var id = $('#id').val();
			$.ajax({
				url:"../ajax/memberIdCheck",
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
		} else {
			$('#id_result').html('잘못된 형식의 아이디입니다.');
			$('#id_result').css("color", "red");
		}
		
		//표현식에 위배되는 경우
		if(!idReg2.test($('#id').val())){
			$('#id_text').html('영문자로 시작하는 6~12자의 영문 혹은 숫자여야 합니다.');
			$('#id_result').html('');
		}else{
			
			//표현식에 위배되지 않는경우
			if(!idReg.test($('#id').val())){
				alert('영문자로 시작하는 6~12자의 영문 혹은 숫자여야 합니다.');			
				$('#id_text').html('최소 6자리이상');
				$('#id_result').html('');
			}else{
				var id = $('#id').val();
				
				//get방식으로 보내서 아이디 중복확인하는 코드
				$.get("./memberIdCheck?id="+id, function(data) {
					var data = data.trim();
					if(data == 1){
						$('#id_result').html('존재하는 아이디입니다.');
						$('#id_result').css("color", "red");
						$('#id').val("").focus();
					} else {
						$('#id_result').html('사용할 수 있는 아이디입니다.');
						$('#id_result').css("color", "blue");
					}
				})
			}
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
					<td><form:input path="res_reg_num1" cssClass="empty_check"/><span class="common">-</span><form:password path="res_reg_num2" cssClass="empty_check"/></td>
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
					<br><span class="sub_2">이메일 주소는 비밀번호 찾기 또는 인터넷 예약 등의 용도에 사용됩니다.</span><br></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="email1"/></div><div><form:errors path="email2"/></div><div id="email_result"></div></td>
				</tr>
				<tr>
					<th>성별<span>*</span></th>
					<td id="age_td"><form:radiobutton path="gender" value="1" cssClass="empty_check"/><span>남자</span><form:radiobutton path="gender" value="2" cssClass="empty_check"/><span>여자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="gender"/></div><div id="gender_result"></div></td>
				</tr>
				<tr>
					<th>나이<span>*</span></th>
					<td><form:input path="age" cssClass="empty_check"/></td>
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