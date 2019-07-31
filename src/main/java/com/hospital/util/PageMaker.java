package com.hospital.util;

public class PageMaker {
	private int totalCount = 0;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	private int perPage=10;
	private Integer curPage;
	private String kind;//title, writer, contents
	private String search;
	
	//rownum
	private int startRow;
	private int lastRow;
	
	//page
	private int totalBlock;
	private int curBlock;
	private int startNum;
	private int lastNum;

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public int getStartRow() {
		return startRow;
	}
	public int getLastRow() {
		return lastRow;
	}
	public Integer getCurPage() {
		if(curPage == null) {
			this.curPage=1;
		}
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
		if(curPage == null) {
			this.curPage=1;
		}
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		if(search==null) {
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	//startRow, lastRow
	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.perPage+1;
		this.lastRow = this.curPage*perPage;
	}
	
	public void makePage(int totalCount) {
		this.totalCount = totalCount;
		//1. ?���? �??�� �??��
		//2. totalPage 구하�?
		int totalPage=totalCount/perPage;
		if(totalCount%perPage !=0) {
			totalPage++;
		}
		
		//3. totalBlock
		int perBlock=10;
		this.totalBlock=totalPage/perBlock;
		if(totalPage%perBlock !=0) {
			this.totalBlock++;
		}
		
		//4. curPage�? ?��?��?��?�� curBlock
		this.curBlock=curPage/perBlock;
		if(this.curPage%perBlock !=0) {
			curBlock++;
		}
		
		//5. startNum, lastNum
		this.startNum=(this.curBlock-1)*perBlock+1;
		this.lastNum=this.curBlock*perBlock;
		
		//6. curBlock?�� totalBlock?��?��
		if(this.curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
	}
}