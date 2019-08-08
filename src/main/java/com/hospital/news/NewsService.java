package com.hospital.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return newsDAO.setWrite(newsVO);
	}
	//update
	public int setUpdate(NewsVO newsVO) throws Exception{
		return newsDAO.setUpdate(newsVO);
	}
	//delete
	public int setDelete(int num,HttpSession session) throws Exception{
		return newsDAO.setDelete(num);
	}
	//select
	public NewsVO getSelect(int num) throws Exception{
		NewsVO newsVO = newsDAO.getSelect(num);
		newsDAO.addHit(num);
		return newsVO;
	}
	//list
	public List<NewsVO> getList(PageMaker pageMaker, String menu) throws Exception{
		pageMaker.makeRow();
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("menu", menu);
		map.put("pager", pageMaker);
		return newsDAO.getList(map);
	}
	//all
	
	
}
