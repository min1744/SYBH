package com.hospital.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {

	public String saveFile(String realPath, MultipartFile multipartFile) throws Exception{
		File file = new File(realPath);
		System.out.println(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileSystemName = UUID.randomUUID().toString();
		
		String originalName = multipartFile.getOriginalFilename();
		
		originalName = originalName.substring(originalName.lastIndexOf('.'));
		fileSystemName = fileSystemName + originalName;
		System.out.println(fileSystemName);

		file = new File(realPath,fileSystemName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);

		return fileSystemName;	
	}

	public String saveFile2(String realPath, MultipartFile multipartFile) throws Exception{
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileSystemName = UUID.randomUUID().toString();
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf('.'));
		fileSystemName = fileSystemName + originalName;
		System.out.println(fileSystemName);

		file=new File(realPath, fileSystemName);
		FileOutputStream fs = new FileOutputStream(file);
		fs.write(multipartFile.getBytes());

		return fileSystemName;
	}

	public String saveFile3(String realPath, MultipartFile multipartFile) throws Exception{
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileSystemName = UUID.randomUUID().toString();
		String originalName = multipartFile.getOriginalFilename();
		originalName = originalName.substring(originalName.lastIndexOf('.'));
		fileSystemName = fileSystemName + originalName;
		System.out.println(fileSystemName);

		file = new File(realPath, fileSystemName);
		multipartFile.transferTo(file);

		return fileSystemName;
	}

	public boolean deleteFile(String realPath, String fname) throws Exception{
		File file = new File(realPath, fname);
		boolean result=false;
		if(file.exists()) {
			result=file.delete();
		}
		return result;
	}
}