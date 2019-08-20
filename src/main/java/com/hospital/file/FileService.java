package com.hospital.file;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.util.FileSaver;


@Service
public class FileService {
	
	@Inject
	private FileSaver fileSaver;
	
	
	public String summerFileUpload(MultipartFile file, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		String fname= fileSaver.saveFile(realPath, file);
		
		return fname;
	}
	
	public int summerFileDelete(String fileName, HttpSession session) throws Exception {
		
		String realPath = session.getServletContext().getRealPath("/resources/summernote");
		fileName = fileName.substring(fileName.lastIndexOf("/"));
		int result = fileSaver.deleteFile(realPath, fileName);
		return result;	
	}

}
