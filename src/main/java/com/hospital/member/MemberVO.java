package com.hospital.member;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class MemberVO {
	//아아디
	@NotNull
	@Size(min = 6, max = 10)
	private String id;
	//비밀번호
	@NotNull
	@Size(min = 10, max = 15)
	private String pw;
	//이름
	@NotNull
	@Size(min = 2, max = 8)
	private String name;
	//주민번호
	@NotNull
	private String res_reg_num;
	//핸드폰번호
	@NotNull
	private String phone;
	//이메일
	@NotNull
	private String email;
	//성별
	//1 : 남자
	//2 : 여자
	@NotNull
	private String gender;
	//나이
	@NotNull
	private int age;
	//회원등급
	//1 : user
	//2 : admin
	//3 : nurse
	//4 : doctor
	@NotNull
	private int grade;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRes_reg_num() {
		return res_reg_num;
	}
	public void setRes_reg_num(String res_reg_num) {
		this.res_reg_num = res_reg_num;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
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