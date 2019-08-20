package com.hospital.news.newsimages;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.util.FileSaver;

@Service
public class NewsImagesService {
	@Inject
	public NewsImagesDAO newsImagesDAO;
	@Inject
	public FileSaver fileSaver;
	
	public int setDelete(NewsImagesVO newsImagesVO,HttpSession session)throws Exception{
		int result = newsImagesDAO.setDelete(newsImagesVO.getFnum());
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("/resources/file");
			result = fileSaver.deleteFile(realPath, newsImagesVO.getFname());
		}
		return result;
	}
}
