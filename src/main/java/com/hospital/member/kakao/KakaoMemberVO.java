package com.hospital.member.kakao;

public class KakaoMemberVO {
	//아이디
	private String id;
	//nickname
	private String name;
	//이메일 계정
	private String email;
	//생일(mm월dd일)
	private String birthday;
	//성별(male, female)
	private String gender;
	//나이(ex : 20~29)
	private String age_range;
	//54자리의 대소문자 영어와 숫자, _
	private String access_token;
	private final int grade = 1;
	
	public int getGrade() {
		return grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge_range() {
		return age_range;
	}
	public void setAge_range(String age_range) {
		this.age_range = age_range;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
}