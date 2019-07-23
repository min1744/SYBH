package com.hospital.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.hospital.file.FileVO;

public class FileDown extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		FileVO fileVO = (FileVO)model.get("file");
		String board = (String)model.get("board");
		String realPath = request.getSession().getServletContext().getRealPath("/resources/"+board);
		File file = new File(realPath, fileVO.getFname());
		response.setCharacterEncoding("UTF-8");
		response.setContentLength((int)file.length());
		String fileName = URLEncoder.encode(fileVO.getOname(), "UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
	}
}