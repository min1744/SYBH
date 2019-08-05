package com.hospital.doctorImages;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.FileSaver;

@Service
public class DoctorImagesService {
	@Inject
	private DoctorImagesDAO doctorImagesDAO;
	@Inject
	private FileSaver fileSaver;
	
	public int setWrite(DoctorImagesVO doctorImagesVO)throws Exception{
		return 0;
	}
}
