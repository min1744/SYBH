package com.hospital.news;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class NewsService {
	
	@Inject
	private NewsDAO newsDAO;
	
	public int setWrite(NewsVO newsVO, HttpSession session) throws Exception{
		int result = newsDAO.setWrite(newsVO);
		
		return result;
	}
	
	public int setUpdate(NewsVO newsVO) throws Exception{
		int result = newsDAO.setUpdate(newsVO);
		return result;
	}
	
	public int setDelete(int num,HttpSession session) throws Exception{
		int result = newsDAO.setDelete(num);
		return result;
	}
	
	public NewsVO getSelect(int num) throws Exception{
		NewsVO newsVO = newsDAO.getSelect(num);
		newsDAO.addHit(num);
		return newsVO;
	}
	
	public List<NewsVO> getList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<NewsVO> list = newsDAO.getList(pageMaker);
		
		int totalCount = newsDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	
}
