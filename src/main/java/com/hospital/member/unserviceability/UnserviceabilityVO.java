package com.hospital.member.unserviceability;

public class UnserviceabilityVO {
	private int unum;
	private String id;
	private String email;
	private String name;
	private String res_reg_num;
	private String reason;
	
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
}