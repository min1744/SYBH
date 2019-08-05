package com.hospital.qna.comments;

import java.sql.Date;

public class QnACommentsVO {
	
	private int qcnum;
	private int num;
	private String id;
	private String contents;
	private Date reg_date;
	private int ref;
	private int step;
	private int depth;
	
	
	public int getQcnum() {
		return qcnum;
	}
	public void setQcnum(int qcnum) {
		this.qcnum = qcnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	

}
