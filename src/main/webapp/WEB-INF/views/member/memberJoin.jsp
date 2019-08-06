<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberJoin.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/member/memberJoin.js"></script>
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
					<th>나이</th>
					<td><form:input path="age" id="age" cssClass="empty_check" readonly="true"/></td>
				</tr>
				<tr>
					<td></td>
					<td><div><form:errors path="age"/></div><div id="age_result"></div></td>
				</tr>
			</tbody>
		</table>
		</form:form>
		<input type="hidden" id="originEmail">
		<div id="join_btn">
			<button id="join">가입완료</button>
		</div>
	</div>
</div>
<!-- footer 추가 -->
<c:import url="../common/footer.jsp" />
</body>
</html>