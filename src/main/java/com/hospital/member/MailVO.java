package com.hospital.member;

public class MailVO {
	private String setFrom;
	private String toMail;
	private String title;
	private String contents;
	
	public String getSetFrom() {
		return setFrom;
	}
	public void setSetFrom(String setFrom) {
		this.setFrom = setFrom;
	}
	public String getToMail() {
		return toMail;
	}
	public void setToMail(String toMail) {
		this.toMail = toMail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}