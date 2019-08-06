package com.hospital.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.hospital.util.PageMaker;

public interface BoardDAO {
	
	public int getTotalCount(PageMaker pageMaker) throws Exception;
	
	public int setWrite(BoardVO boardVO) throws Exception;
	
	public int setUpdate(BoardVO boardVO) throws Exception;

	public int setDelete(int num) throws Exception;
	
	public BoardVO getSelect(int num) throws Exception;
	
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception;
	
	public int addHit(int num) throws Exception;
}