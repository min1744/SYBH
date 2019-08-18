package com.hospital.news;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.news.newsimages.NewsImagesDAO;
import com.hospital.news.newsimages.NewsImagesVO;
import com.hospital.util.FileSaver;
import com.hospital.util.PageMaker;

@Service
public class NewsService {
	
	@Inject
	private NewsDAO newsDAO;
	@Inject
	private NewsImagesDAO newsImagesDAO;
	@Inject	
	private FileSaver fileSaver;
	
	
	//write
	public int setWrite(NewsVO newsVO, HttpSession session, MultipartFile multipartFile) throws Exception{
		NewsImagesVO newsImagesVO = new NewsImagesVO();
		
		String realPath = session.getServletContext().getRealPath("/resources/file");
		int result = newsDAO.setWrite(newsVO);
		
		if(result < 1) {
			throw new Exception();
		}
		
		newsImagesVO.setNum(newsVO.getNum());
		newsImagesVO.setFname(fileSaver.saveFile(realPath, multipartFile));
		newsImagesVO.setOname(multipartFile.getOriginalFilename());
		//newsVO.setNewsImagesVO(newsImagesVO);
		result = newsImagesDAO.setWrite(newsImagesVO);
		
		return result;
		
		
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
		int totalCount = newsDAO.getTotalCount(map);
		pageMaker.makePage(totalCount);
		
		return newsDAO.getList(map);
	}
	
	public List<NewsVO> newsAll(String menu)throws Exception{
		List<NewsVO> list = newsDAO.newsAll(menu);
		
		return list;
	}
	
	
	
}
