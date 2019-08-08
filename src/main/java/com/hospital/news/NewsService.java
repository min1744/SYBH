package com.hospital.news;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.news.newsimages.NewsImagesDAO;
import com.hospital.news.newsimages.NewsImagesVO;
import com.hospital.util.PageMaker;

@Service
public class NewsService {
	
	@Inject
	private NewsDAO newsDAO;
	private NewsImagesDAO newsImagesDAO;
	
	//write
	public int setWrite(NewsVO newsVO, HttpSession session) throws Exception{
		int result = newsDAO.setWrite(newsVO);
		
		return result;
	}
	//update
	public int setUpdate(NewsVO newsVO) throws Exception{
		int result = newsDAO.setUpdate(newsVO);
		return result;
	}
	//delete
	public int setDelete(int num,HttpSession session) throws Exception{
		int result = newsDAO.setDelete(num);
		return result;
	}
	//select
	public NewsVO getSelect(int num) throws Exception{
		NewsVO newsVO = newsDAO.getSelect(num);
		newsDAO.addHit(num);
		return newsVO;
	}
	//list
	public List<NewsVO> getList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<NewsVO> list = newsDAO.getList(pageMaker);
		//NewsImagesVO newsImagesVO = newsImagesDAO.getSelect(fnum);
		int totalCount = newsDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		return list;
	}
	//all
	
	
}
