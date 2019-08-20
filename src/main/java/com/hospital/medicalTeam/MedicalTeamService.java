package com.hospital.medicalTeam;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hospital.doctorImages.DoctorImagesDAO;
import com.hospital.doctorImages.DoctorImagesVO;
import com.hospital.util.FileSaver;
import com.hospital.util.PageMaker;

@Service
public class MedicalTeamService {
	@Inject
	public MedicalTeamDAO medicalTeamDAO;
	@Inject
	private FileSaver fileSaver;
	@Inject
	private DoctorImagesDAO doctorImagesDAO;
	
	//list
	public List<MedicalTeamVO> getList(Integer mid) throws Exception{
		if(mid ==null) {
			mid=1;
		}
		return medicalTeamDAO.getList(mid);
	}
	
	//search
	public List<MedicalTeamVO> getSearch(String name) throws Exception{
		return medicalTeamDAO.getSearch(name);
	}
	
	//한명
	public MedicalTeamVO getSelect(String name) throws Exception{
		return medicalTeamDAO.getSelect(name);
	}
	
	//관리자용 출력
	public List<MedicalTeamVO> getMedicalList(PageMaker pageMaker)throws Exception{
		pageMaker.makeRow();
		List<MedicalTeamVO> list = medicalTeamDAO.getMedicalList(pageMaker);
		int totalCount= medicalTeamDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		
		return list;
		
	}
	
	public MedicalTeamVO getMedicalSelect(int num) throws Exception{
		return medicalTeamDAO.getMedicalSelect(num);
	}
	
	//의사 입력
	public int setWrite(MedicalTeamVO medicalTeamVO,HttpSession session, MultipartFile multipartFile)throws Exception{
		DoctorImagesVO doctorImagesVO = new DoctorImagesVO();
		
		String realPath = session.getServletContext().getRealPath("/resources/file");
		if(medicalTeamVO.getMed_office().equals("1")) {
			medicalTeamVO.setMed_office("이비인후과");
			medicalTeamVO.setMid(1);
		}else if(medicalTeamVO.getMed_office().equals("2")) {
			medicalTeamVO.setMed_office("외과");
			medicalTeamVO.setMid(2);
		}else if(medicalTeamVO.getMed_office().equals("3")) {
			medicalTeamVO.setMed_office("비뇨의학과");
			medicalTeamVO.setMid(3);
		}else if(medicalTeamVO.getMed_office().equals("4")) {
			medicalTeamVO.setMed_office("호흡기내과");
			medicalTeamVO.setMid(4);
		}else if(medicalTeamVO.getMed_office().equals("5")) {
			medicalTeamVO.setMed_office("신경과");
			medicalTeamVO.setMid(5);
		}
		
		int result = medicalTeamDAO.setWrite(medicalTeamVO);
		if(result<1) {
			throw new Exception();
		}
		try {
			doctorImagesVO.setNum(medicalTeamVO.getNum());
			doctorImagesVO.setFname(fileSaver.saveFile(realPath, multipartFile));
			doctorImagesVO.setOname(multipartFile.getOriginalFilename());
			result = doctorImagesDAO.setWrite(doctorImagesVO);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		if(result<1) {
			throw new Exception();
		}
		
		return result;
	}
	
	//의사 삭제 여러개
	public int setDelete(Integer[] num)throws Exception{
		List<Integer> list = Arrays.asList(num);
		return medicalTeamDAO.setListDelete(list);
	}
	//의사 한개 삭제
	public int setDelete(int num,HttpSession session) throws Exception{
		String realPath = session.getServletContext().getRealPath("/resources/file");
		List<DoctorImagesVO> files = doctorImagesDAO.getList(num);
		
		int result = doctorImagesDAO.setDelete(num);
		result = medicalTeamDAO.setDelete(num);
		for(int i=0;i<files.size();i++) {
			fileSaver.deleteFile(realPath, files.get(i).getFname());
		}
		return result;
		
	}
	
	//의사 업뎃
	public int setUpdate(MedicalTeamVO medicalTeamVO,MultipartFile multipartFile,HttpSession session) throws Exception{
		if(medicalTeamVO.getMed_office().equals("1")) {
			medicalTeamVO.setMed_office("이비인후과");
			medicalTeamVO.setMid(1);
		}else if(medicalTeamVO.getMed_office().equals("2")) {
			medicalTeamVO.setMed_office("외과");
			medicalTeamVO.setMid(2);
		}else if(medicalTeamVO.getMed_office().equals("3")) {
			medicalTeamVO.setMed_office("비뇨의학과");
			medicalTeamVO.setMid(3);
		}else if(medicalTeamVO.getMed_office().equals("4")) {
			medicalTeamVO.setMed_office("호흡기내과");
			medicalTeamVO.setMid(4);
		}else if(medicalTeamVO.getMed_office().equals("5")) {
			medicalTeamVO.setMed_office("신경과");
			medicalTeamVO.setMid(5);
		}
		
		int result = medicalTeamDAO.setUpdate(medicalTeamVO);
		if(result<1) {
			throw new Exception();
		}
		String realPath = session.getServletContext().getRealPath("/resources/file");
		DoctorImagesVO doctorImagesVO = new DoctorImagesVO();
		try {
			doctorImagesVO = new DoctorImagesVO();
			doctorImagesVO.setNum(medicalTeamVO.getNum());
			doctorImagesVO.setOname(multipartFile.getOriginalFilename());
			doctorImagesVO.setFname(fileSaver.saveFile(realPath, multipartFile));
			result = doctorImagesDAO.setWrite(doctorImagesVO);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	//관리자 끝
}
