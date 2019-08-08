package com.hospital.news;

import java.sql.Date;

public class NewsVO {
	
	private int num;
	private String title;
	private String writer;
	private String main_contents;
	private String sub_contents;
	private Date reg_date;
	private int hit;
	private String menu;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMain_contents() {
		return main_contents;
	}
	public void setMain_contents(String main_contents) {
		this.main_contents = main_contents;
	}
	public String getSub_contents() {
		return sub_contents;
	}
	public void setSub_contents(String sub_contents) {
		this.sub_contents = sub_contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	
	
	
	
	
	
	
	
	

}
