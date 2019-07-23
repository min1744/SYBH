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

	//Spring_ex10_board 예제와 달리 return을 int가 아닌 boolean타입으로 설정했으니 주의할 것!
	//file이 정상적으로 삭제 시 true 
	public boolean deleteFile(String realPath, String fname) throws Exception{
		File file = new File(realPath, fname);
		boolean result=false;
		if(file.exists()) {
			result=file.delete();
		}
		return result;
	}
}