package com.hospital.board;

import java.util.ArrayList;

import com.hospital.file.FileVO;

public class FileBoardVO extends BoardVO {
	private ArrayList<FileVO> files;

	public ArrayList<FileVO> getFiles() {
		return files;
	}

	public void setFiles(ArrayList<FileVO> files) {
		this.files = files;
	}
}