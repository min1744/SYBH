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
					<td><form:input path="id" cssClass="empty_check"/><input type="button" value="중복확인" id="overlap"><span class="sub">영문 + 숫자 혼용 6~12자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="id"/></td>
				</tr>
				<tr>
					<th>비밀번호<span>*</span></th>
					<td><form:password path="pw" cssClass="empty_check"/><span class="sub">영문 대문자, 영문 소문자, 숫자, 특수문자(!@#$%^*+=-) 4가지 조합으로 10~15자 이여야 합니다.</span></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="pw"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인<span>*</span></th>
					<td><form:password path="pw2" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="pw2"/></td>
				</tr>
				<tr>
					<th>성명(한글)<span>*</span></th>
					<td><form:input path="name" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="name"/></td>
				</tr>
				<tr>
					<th>주민등록번호<span>*</span></th>
					<td><form:input path="res_reg_num1" cssClass="empty_check"/><span class="common">-</span><form:input path="res_reg_num2" cssClass="empty_check"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="res_reg_num1"/></div><div><form:errors path="res_reg_num2"/></div></td>
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
					<td><div><form:errors path="phone1"/></div><div><form:errors path="phone2"/></div><div><form:errors path="phone3"/></div></td>
				</tr>
				<tr>
					<th>이메일<span>*</span></th>
					<td id="email_input"><form:input path="email1" cssClass="empty_check"/><span class="common">@</span><form:input path="email2" cssClass="empty_check"/>
					<br><span class="sub_2">이메일 주소는 비밀번호 찾기 또는 인터넷 예약 등의 용도에 사용됩니다.</span><br></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="email1"/></div><div><form:errors path="email2"/></div></td>
				</tr>
				<tr>
					<th>성별<span>*</span></th>
					<td id="age_td"><form:radiobutton path="gender" value="1" cssClass="empty_check"/><span>남자</span><form:radiobutton path="gender" value="2" cssClass="empty_check"/><span>여자</span></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="gender"/></td>
				</tr>
				<tr>
					<th>나이<span>*</span></th>
					<td><input type="number" name="age" class="empty_check"></td>
				</tr>
				<tr>
					<td></td>
					<td><form:errors path="age"/></td>
				</tr>
			</tbody>
		</table>
		<div id="join_btn">
			<button id="join">가입완료</button>
		</div>
		</form:form>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>