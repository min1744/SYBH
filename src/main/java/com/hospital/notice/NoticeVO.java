package com.hospital.notice;

import java.sql.Date;

import com.hospital.board.BoardVO;

public class NoticeVO extends BoardVO {
	
	private String fix;

	public String getFix() {
		return fix;
	}

	public void setFix(String fix) {
		this.fix = fix;
	}
}