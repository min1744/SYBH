package com.hospital.member;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class MemberVO {
	//아아디
	@NotBlank
	@Size(min = 6, max = 12)
	private String id;
	//비밀번호
	@NotBlank
	@Size(min = 10, max = 15)
	private String pw;
	@NotBlank
	@Size(min = 10, max = 15)
	private String pw2;
	//이름
	@NotBlank
	@Size(min = 1, max = 17)
	private String name;
	//주민번호
	@NotBlank
	@Size(min = 6, max = 6)
	private String res_reg_num1;
	@NotBlank
	@Size(min = 7, max = 7)
	private String res_reg_num2;
	private String res_reg_num = res_reg_num1 + "-" + res_reg_num2;
	//핸드폰번호
	@NotBlank
	@Size(min = 3, max = 4)
	private String phone1;
	@NotBlank
	@Size(min = 3, max = 5)
	private String phone2;
	@NotBlank
	@Size(min = 4, max = 4)
	private String phone3;
	private String phone = phone1 + "-" + phone2 + "-" + phone3;
	//이메일
	@NotBlank
	@Size(min = 6, max = 12)
	private String email1;
	@NotBlank
	@Size(min = 8, max = 12)
	private String email2;
	private String email = email1 + "@" + email2;
	//성별
	//1 : 남자
	//2 : 여자
	//@NotBlank
	//@NotEmpty
	@NotNull
	@Min(value = 1)
	@Max(value = 2)
	private int gender;
	//나이
	//@NotBlank
	//@NotEmpty
	@NotNull
	@Min(value = 0)
	@Max(value = 120)
	private int age;
	//회원등급
	//1 : user
	//2 : admin
	//3 : nurse
	//4 : doctor
	//@NotBlank
	//@NotEmpty
	@NotNull
	@Min(value = 1)
	@Max(value = 2)
	private int grade;
	
	public String getRes_reg_num() {
		return res_reg_num;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
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
}