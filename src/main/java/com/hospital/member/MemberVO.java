package com.hospital.member;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

public class MemberVO {
	//아아디
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$")
	private String id;
	//비밀번호
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$")
	private String pw;
	//비밀번호 확인
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,15}$")
	private String pw2;
	//이름
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-zA-Z가-힣]).{1,17}$")
	private String name;
	//주민번호
	@NotBlank
	@Pattern(regexp = "^(?=.*[0-9]).{6,6}$")
	private String res_reg_num1;
	@NotBlank
	@Pattern(regexp = "^(?=.*[0-9]).{7,7}$")
	private String res_reg_num2;
	private String res_reg_num;
	//핸드폰번호
	@NotBlank
	@Pattern(regexp = "^(?=.*[0-9]).{3,3}$")
	private String phone1;
	@NotBlank
	@Pattern(regexp = "^(?=.*[0-9]).{3,4}$")
	private String phone2;
	@NotBlank
	@Pattern(regexp = "^(?=.*[0-9]).{4,4}$")
	private String phone3;
	private String phone;
	//이메일
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9]).{6,20}$")
	private String email1;
	@NotBlank
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[.]).{8,12}$")
	private String email2;
	private String email;
	//성별
	//1 : 남자
	//2 : 여자
	@NotNull
	@Range(min = 1, max = 2)
	private int gender;
	//나이
	@NotNull
	@Min(value = 0)
	@Max(value = 120)
	private int age;
	//회원등급
	//1 : user
	//2 : admin
	private int grade;
	private String authCode;
	private String authStatus;
	//54자리의 대소문자 영어와 숫자, _
	private String access_token;
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPw2() {
		return pw2;
	}
	public void setPw2(String pw2) {
		this.pw2 = pw2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRes_reg_num1() {
		return res_reg_num1;
	}
	public void setRes_reg_num1(String res_reg_num1) {
		this.res_reg_num1 = res_reg_num1;
	}
	public String getRes_reg_num2() {
		return res_reg_num2;
	}
	public void setRes_reg_num2(String res_reg_num2) {
		this.res_reg_num2 = res_reg_num2;
	}
	public String getRes_reg_num() {
		return res_reg_num;
	}
	public void setRes_reg_num(String res_reg_num) {
		this.res_reg_num = res_reg_num;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
}