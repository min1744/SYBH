<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/all.jsp" />
<link href="../resources/css/memberJoin.css" rel="stylesheet">
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
		<form:form commandName="memberVO">
		<table>
			<tbody>
				<tr>
					<th>아이디(ID)<span>*</span></th>
					<form:input path="id"/>
					<form:errors path="id"></form:errors>
					<td><input type="text" name="id"><input type="button" value="중복확인" id="overlap"><span class="sub">한글(3자 이상), 영문 + 숫자 혼용 6~12자</span></td>
				</tr>	
				<tr>
					<th>비밀번호<span>*</span></th>
					<td><input type="password" name="pw"><span class="sub">영문, 숫자, 특수문자(!@#$%^&#38;*(),.;) 3가지 이상 조합으로 9~16자 이여야 합니다.</span></td>
				</tr>
				<tr>
					<th>비밀번호 확인<span>*</span></th>
					<td><input type="password" name="pw2"></td>
				</tr>
				<tr>
					<th>성명(한글)<span>*</span></th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>주민등록번호<span>*</span></th>
					<td><input type="text" name="res_reg_num"><span class="common">-</span><input type="text" name="res_reg_num"></td>
				</tr>
				<tr>
					<th>핸드폰번호<span>*</span></th>
					<td>
					<input type="text" name="phone" placeholder="010">
					<span class="common">-</span>
					<input type="text" name="phone">
					<span class="common">-</span>
					<input type="text" name="phone">
					</td>
				</tr>	
				<tr>
					<th>이메일<span>*</span></th>
					<td id="email_input"><input type="text" name="email"><span class="common">@</span><input type="text" name="email">
					<br><span class="sub_2">이메일 주소는 비밀번호 찾기 또는 인터넷 예약 등의 용도에 사용됩니다.</span><br>
					</td>
				</tr>
				<tr>
					<th>성별<span>*</span></th>
					<td id="age_td"><input type="checkbox"><span>남자</span><input type="checkbox"><span>여자</span></td>
				</tr>
				<tr>
					<th>나이<span>*</span></th>
					<td><input type="text" name="age"></td>
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