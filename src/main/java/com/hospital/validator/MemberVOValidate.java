package com.hospital.validator;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.hospital.member.MemberDAO;
import com.hospital.member.MemberVO;

public class MemberVOValidate implements Validator {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO memberVO = (MemberVO)target;
		String id = memberVO.getId();
		String pw = memberVO.getPw();
		String pw2 = memberVO.getPw2();
		String name = memberVO.getName();
		String res_reg_num1 = memberVO.getRes_reg_num1();
		String res_reg_num2 = memberVO.getRes_reg_num2();
		String phone1 = memberVO.getPhone1();
		String phone2 = memberVO.getPhone2();
		String phone3 = memberVO.getPhone3();
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		int gender = memberVO.getGender();
		int age = memberVO.getAge();
		
		boolean checkId = Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$", id);
		boolean checkPw = Pattern.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$", pw);
		boolean checkName = Pattern.matches("^(?=.*[ㄱ-ㅎ가-힇a-zA-Z]).{2,17}$", name);
		boolean checkRes_reg_num1 = Pattern.matches("^(?=.*[0-9]).{6,6}$", res_reg_num1);
		boolean checkRes_reg_num2 = Pattern.matches("^(?=.*[0-9]).{7,7}$", res_reg_num2);
		boolean checkPhone1 = Pattern.matches("^(?=.*[0-9]).{3,4}$", phone1);
		boolean checkPhone2 = Pattern.matches("^(?=.*[0-9]).{3,5}$", phone2);
		boolean checkPhone3 = Pattern.matches("^(?=.*[0-9]).{4,4}$", phone3);
		boolean checkEmail1 = Pattern.matches("^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$", email1);
		boolean checkEmail2 = Pattern.matches("^(?=.*[a-z])(?=.*[.]).{8,12}$", email2);
		boolean checkGender = Pattern.matches("^(?=.*[1-2]).{1,1}$", gender+"");
		boolean checkAge = Pattern.matches("^(?=.*[0-9]).{1,3}$", age+"");
		
		//id
		if(checkId) {
			errors.rejectValue("id", "memberVO.id.confirm");
		}
		
		//pw
		if(checkPw) {
			errors.rejectValue("pw", "memberVO.pw.confirm");
		} else {
			if(!pw.equals(pw2)) {
				errors.rejectValue("pw", "memberVO.pw2.equal");
			}
		}
		
		//name
		if(checkName) {
			errors.rejectValue("name", "memberVO.name.confirm");
		}
		
		//res_reg_num
		if(checkRes_reg_num1 || checkRes_reg_num2) {
			errors.rejectValue("res_reg_num", "memberVO.res_reg_num.confirm");
		}
		
		//phone
		if(checkPhone1 || checkPhone2 || checkPhone3) {
			errors.rejectValue("phone", "memberVO.phone.confirm");
		}
		
		//email
		if(checkEmail1 || checkEmail2) {
			errors.rejectValue("email", "memberVO.email.confirm");
		}
		
		//gender
		if(checkGender) {
			errors.rejectValue("gender", "memberVO.gender.confirm");
		}
		
		//age
		if(checkAge) {
			errors.rejectValue("age", "memberVO.age.confirm");
		}
	}
}