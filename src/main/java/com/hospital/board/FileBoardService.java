package com.hospital.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.hospital.util.PageMaker;

public interface FileBoardService {

	public int setWrite(BoardVO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception;
		
	public int setDelete(int num, HttpSession session)throws Exception;
		
	public int setUpdate(BoardVO boardDTO, List<MultipartFile> files, HttpSession session) throws Exception;
		
	public BoardVO getSelect(int num) throws Exception;
		
	public List<BoardVO> getList(PageMaker pageMaker) throws Exception;
}