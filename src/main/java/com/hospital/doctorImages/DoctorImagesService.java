package com.hospital.doctorImages;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.util.FileSaver;

@Service
public class DoctorImagesService {
	@Inject
	private DoctorImagesDAO doctorImagesDAO;
	@Inject
	private FileSaver fileSaver;
	
	public int setDelete(DoctorImagesVO doctorImagesVO,HttpSession session)throws Exception{
		int result = doctorImagesDAO.setDelete(doctorImagesVO.getFnum());
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("/resources/file");
			result = fileSaver.deleteFile(realPath, doctorImagesVO.getFname());
		}
		return result;
	}
}
